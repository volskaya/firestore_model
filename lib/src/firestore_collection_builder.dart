import 'dart:async';

import 'package:firestore_model/src/firestore_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loader_coordinator/loader_coordinator.dart';
import 'package:log/log.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:refresh_storage/refresh_storage.dart';

part 'firestore_collection_builder.g.dart';

/// Status of the [FirestoreCollectionBuilderState].
enum FirestoreCollectionStatus {
  /// Collectino hasn't started the initial pagination yet.
  idle,

  /// Collection is fetching items.
  loading,

  /// Collection attempted to fetch items and was empty.
  empty,

  /// Collection has items.
  ready,
}

/// Either a subscription or pagination query builder.
typedef FirestoreCollectionQueryBuilder<T extends FirestoreModel<T>, D> = Query Function(
    FirestoreCollectionBuilderState<T, D> state, Query collection);

/// Child builder of [FirestoreCollectionBuilder].
typedef FirestoreCollectionChildBuilder<T extends FirestoreModel<T>, D> = Widget Function(
    BuildContext context, FirestoreCollectionBuilderState<T, D> state);

/// All [FirestoreCollectionBuilder] cargo objects must extend this to
/// allow the collection to call its dispose.
abstract class FirestoreCollectionCargo {
  /// The dispose method of the cargo object.
  void dispose();
}

class _FirestoreCollectionStorage<T extends FirestoreModel<T>, D> = _FirestoreCollectionStorageStore<T, D>
    with _$_FirestoreCollectionStorage<T, D>;

abstract class _FirestoreCollectionStorageStore<T extends FirestoreModel<T>, D> with Store {
  _FirestoreCollectionStorageStore({@required this.identifier});

  static final _log = Log.named('FirstoreCollectionStorageStore');

  final String identifier;

  final paginatedItems = ObservableList<T>();
  final subscribedItems = ObservableList<T>();
  final pendingItems = ObservableList<T>();
  final cargo = ObservableMap<String, D>();
  final _states = <FirestoreCollectionBuilderState<T, D>>[];
  final _seenItems = <String>{}; // Seen document IDs to filter redundant items.

  int page = 0;
  StreamSubscription<QuerySnapshot> _streamSubscription;
  bool _paginating = false;
  DateTime _createTime;

  bool get isSubscribed => _streamSubscription != null;
  FirestoreCollectionBuilderState<T, D> get _state => _states.isNotEmpty ? _states.last : null;

  @observable
  FirestoreCollectionStatus listStatus = FirestoreCollectionStatus.idle;

  @observable
  bool isEndReached = false;

  Future<MapEntry<T, D>> _getModelAndCargo(DocumentSnapshot doc) async {
    final model = await FirestoreModel.withReference<T>(doc.reference, doc);
    final cargo = await _state?.widget?.cargoBuilder?.call(model);
    return MapEntry(model, cargo);
  }

  Future<List<MapEntry<T, D>>> _deserializeQuerySnapshot(Iterable<DocumentSnapshot> docs, {bool subscribed = false}) =>
      Future.wait(
        docs.where((doc) {
          if (_seenItems.contains(doc.id)) return false;
          if (!subscribed && (_state?.widget?.shouldSkip?.call(doc) ?? false)) {
            _seenItems.add(doc.id); // Skipped manually due to `shouldSkip`.
            return false;
          }
          return true;
        }).map((doc) {
          _seenItems.add(doc.id);
          return _getModelAndCargo(doc);
        }),
      );

  Query get _pageQuery {
    assert(_state != null);

    if (_state.widget.pageQuery != null) {
      return _state.widget.pageQuery(_state, _state?.widget?.collection);
    } else {
      final query = _state.widget.collection.orderBy(_state.widget.timestampField, descending: true);
      return paginatedItems.isNotEmpty ? query.startAfterDocument(paginatedItems.last.snapshot) : query;
    }
  }

  Query get _subscriptionQuery {
    assert(_state != null);
    assert(_state.widget.subscribe);

    // Check if server timestamp is ready.
    // If a subscribed item was added to a list without a serverside [FieldValue],
    // maybe the subscription hasn't skipped resubbing on an offline document.
    assert((() {
      for (final item in [...pendingItems, ...subscribedItems, ...paginatedItems]) {
        if (item.createTime == null) return false;
      }
      return true;
    })(), 'Spotted a subscribed item with no timestamp');

    if (_state.widget.subscriptionQuery != null) {
      return _state.widget.subscriptionQuery(_state, _state.widget.collection);
    } else {
      final query = _state.widget.collection.orderBy(_state.widget.timestampField, descending: false);
      final cursor = pendingItems.reversed
          .followedBy(subscribedItems.reversed)
          .followedBy(paginatedItems)
          .firstWhere((x) => x.exists == true, orElse: () => null);

      /// A snapshot could already be deleted, by the time it's used to subscribe.
      /// Iterate over pending -> subscribed -> paginated items to find the newest existing snapshot.
      ///
      /// Pending and subscribed items are reversed, since they're ordered ascending.
      return cursor != null ? query.startAfterDocument(cursor.snapshot) : query;
    }
  }

  @action
  void _checkStatus() {
    if (paginatedItems.isEmpty && subscribedItems.isEmpty) {
      listStatus = FirestoreCollectionStatus.empty;
    } else if (paginatedItems.isNotEmpty || subscribedItems.isNotEmpty) {
      listStatus = FirestoreCollectionStatus.ready;
    }
  }

  @action
  void movePendingItemsToSubscribedItems() {
    if (pendingItems.isNotEmpty) {
      subscribedItems.addAll(pendingItems);
      pendingItems.clear();
    }
  }

  @action
  Future fetchPage(int page) async {
    if (page <= this.page || isEndReached || _state?.mounted != true) {
      _log.i('Skipping redundant pagination for page: $page');
      return;
    }

    if (_paginating) return;
    _paginating = true;
    final loader = LoaderCoordinator.instance.touch();

    if (listStatus == FirestoreCollectionStatus.idle) {
      // This is assumed to be the first pagination.
      listStatus = FirestoreCollectionStatus.loading;
    }

    try {
      await _paginate(page);
      assert(_state?.mounted != true || page == this.page);
    } finally {
      _paginating = false;
      loader.dispose();
    }
  }

  @action
  Future _paginate(int page) async {
    assert(_state != null);
    assert(page > this.page);

    // Initially fetch 2 pages, since the first items will try to paginate right away anyway.
    final prepareSecondPage = page == 1 && _state?.widget?.prepareSecondPage == true;
    final itemCount = prepareSecondPage ? _state.widget.itemsPerPage * 2 : _state.widget.itemsPerPage;
    final snapshots = await _pageQuery.limit(itemCount).get();
    if (_state?.mounted != true) return;

    if (snapshots.size < itemCount) {
      isEndReached = true;
      _log.i('$identifier collection end reached');
    }

    final items = await _deserializeQuerySnapshot(snapshots.docs);
    _log.i('$identifier pagination got ${items.length} new items');

    if (page == 1) {
      final now = DateTime.now();
      if ((_state?.widget?.delay ?? Duration.zero) > Duration.zero &&
          now.isBefore(_createTime.add(_state.widget.delay))) {
        await Future<void>.delayed(now.difference(_createTime).abs());
      }
    }

    if (_state?.mounted == true) {
      paginatedItems.addAll(items.map((item) => item.key));
      cargo.addEntries(items.where((x) => x.value != null).map((x) => MapEntry(x.key.id, x.value)));
      this.page = prepareSecondPage ? page + 1 : page;
      _checkStatus();
    } else {
      for (final item in items) {
        item.key.dispose();
        (item.value as dynamic)?.dispose?.call();
      }
    }
  }

  void startSubscription() {
    assert(_streamSubscription == null);
    assert(_state?.widget?.subscribe == true);

    if (!isSubscribed) {
      try {
        _log.i('Subscribing to $identifier');
        _streamSubscription = _subscriptionQuery
            .limit(_state.widget.itemsPerPage)
            .snapshots(includeMetadataChanges: true)
            .listen(_handleQuerySubscription);
      } on PlatformException catch (e, t) {
        _log.e('Couldn\'t attach a listener to $identifier', e, t);
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (_state?.widget?.subscribe == true) startSubscription(); // Attempt to resubscribe.
        });
      }
    }
  }

  void stopSubscription() {
    try {
      _streamSubscription?.cancel();
    } finally {
      _streamSubscription = null;
    }
  }

  /// If deserializing the query snapshot returns no items, subscription will not
  /// resubscribe to the nearest subscription timestamp and instead wait for
  /// another batch.
  ///
  /// Multiple snapshots can be handled at the same time and move the subscription
  /// timestamp cursor.
  @action
  Future _handleQuerySubscription(QuerySnapshot snapshot) async {
    if (_state?.mounted != true) return;
    if (snapshot.docs.isEmpty) {
      _log.i('Skipping query snapshot: ${snapshot.hashCode}, no documents');
      return;
    }

    _log.i('Handling query snapshot: ${snapshot.hashCode}, ${snapshot.docs.length} new documents');

    try {
      final upstreamDocuments = [
        ...snapshot.docs.where((doc) =>
            !_seenItems.contains(doc.id) && doc.metadata.hasPendingWrites == false && doc.metadata.isFromCache == false)
      ];

      if (upstreamDocuments.isNotEmpty) stopSubscription(); // The subscription will resubscribe from a newer document.
      final allowOffline = _state?.widget?.allowOfflineItems == true;
      final documents = allowOffline ? snapshot.docs.where((x) => !_seenItems.contains(x.id)) : upstreamDocuments;
      _log.i('$identifier subscription got ${documents.length} new items');
      final items = await _deserializeQuerySnapshot(documents, subscribed: true);

      if (_state?.mounted == true) {
        if (documents.isNotEmpty) {
          (_state._isScrolled ? pendingItems : subscribedItems).addAll(items.map((item) => item.key));
          cargo.addEntries(items.where((x) => x.value != null).map((x) => MapEntry(x.key.id, x.value)));
          _checkStatus();
        }
      } else {
        for (final item in items) {
          item.key.dispose();
          (item.value as dynamic)?.dispose?.call();
        }
      }
    } catch (e, t) {
      _log.e('Couldn\'t process newly paginated items', e, t);
    } finally {
      // Need to resubscribe to the newest timestamp, to prevent duplicate
      // documents from being added to the list.
      if (_state?.widget?.subscribe == true && !isSubscribed) startSubscription();
    }
  }

  @action
  void dispose() {
    pendingItems.followedBy(subscribedItems).followedBy(paginatedItems).forEach((item) => item.dispose());
    for (final value in cargo.values) (value as dynamic)?.dispose?.call();
  }

  @action
  void mount(FirestoreCollectionBuilderState<T, D> state) {
    if (_states.contains(state)) throw 'Already mounted';
    _states.add(state);
    _createTime ??= DateTime.now();

    // Move pending & subscribed items to the paginated list.
    //
    // FIXME: Pushing items to the paginated list, when a new state is mounted,
    // will cause the list to update in all the previous states.
    if (pendingItems.isNotEmpty || subscribedItems.isNotEmpty) {
      paginatedItems.insertAll(0, pendingItems.reversed.followedBy(subscribedItems.reversed));
      pendingItems.clear();
      subscribedItems.clear();
    }
  }

  /// Unreferences `_state`.
  void unmount(FirestoreCollectionBuilderState<T, D> state) {
    assert(_states.contains(state));
    final removed = _states.remove(state);
    assert(removed, 'Unmounted a state that has not been mouted');
    if (_states.isEmpty) stopSubscription();
  }
}

/// Build subscribable lists of firestore collections.
///
/// If there's a [PrimaryScrollController] above this collection, when it's
/// scrolled off its resting position, subscribed items will be added to the
/// pending items list instead, until the controller is back in its resting position.
class FirestoreCollectionBuilder<T extends FirestoreModel<T>, D> extends StatefulWidget {
  /// Creates [FirestoreCollectionBuilder].
  const FirestoreCollectionBuilder({
    Key key,
    @required this.collection,
    @required this.bucket,
    @required this.builder,
    this.pageQuery,
    this.subscriptionQuery,
    this.timestampField = 'createTime',
    this.itemsPerPage = 20,
    this.subscribe = false,
    this.observe = true,
    this.scrollController,
    this.onPendingItemsChanged,
    this.routeOverride,
    this.storageOverride,
    this.shouldSkip,
    this.allowOfflineItems = false,
    this.cargoBuilder,
    this.delay = Duration.zero,
    this.prepareSecondPage = true,
  }) : super(key: key);

  /// Get [FirestoreCollectionBuilderState] from [BuildContext].
  static FirestoreCollectionBuilderState of(BuildContext context) =>
      Provider.of<FirestoreCollectionBuilderState>(context, listen: false);

  /// Shortcut access to pending items.
  final ValueChanged<List<T>> onPendingItemsChanged;

  /// Cargo builder for each seen item.
  ///
  /// For example a notification document also needing to paginate
  /// its relevant user document.
  final FutureOr<D> Function(T item) cargoBuilder;

  /// Pass custom scroll controller. By default this builder tries to attach to
  /// [PrimaryScrollController] to add items to pending item list, instead of
  /// subscribed, when the list is scrolled.
  final ScrollController scrollController;

  /// Initial [Query] to query the documents from.
  final Query collection;

  /// Bucket identifier of [RefreshStorage] used by [FirestoreCollectionBuilder].
  final String bucket;

  /// Initially paginates 2 pages at once, since the child items are expected to call
  /// pagination right away anyway, for their next page.
  final bool prepareSecondPage;

  /// Child builder with the current list state.
  ///
  /// If [observe] is false, this builder won't rebuild when items change and
  /// you'll have to manually use [Observer] to observe the lits inside [FirestoreCollectionBuilderState].
  final FirestoreCollectionChildBuilder<T, D> builder;

  /// Query builder for the paginated list.
  ///
  /// By default the paginated documents will be ordered by [timestampField],
  /// in a descending order.
  final FirestoreCollectionQueryBuilder<T, D> pageQuery;

  /// Query builder for the paginated list.
  ///
  /// By default the paginated documents will be ordered by [timestampField],
  /// in an ascending order.
  final FirestoreCollectionQueryBuilder<T, D> subscriptionQuery;

  /// Default field name of the create timestamp within the collection documents.
  final String timestampField;

  /// Number of documents to paginate.
  final int itemsPerPage;

  /// Whether to also listen to new documents, created within the collection.
  final bool subscribe;

  /// Whether to wrap child builder in an [Observer] to automatically rebuild
  /// on any list change.
  final bool observe;

  /// Storage override passed to the [RefreshStorage] builder.
  final RefreshStorageState storageOverride;

  /// Route override passed to the [RefreshStorage] builder.
  final ModalRoute routeOverride;

  /// Whether to allow the subscription list to add offline documents to the list.
  final bool allowOfflineItems;

  /// If this callback returns true, the paginated item will be skipped.
  /// This won't affect subscribed items, as that could caus an infinite loop.
  final bool Function(DocumentSnapshot value) shouldSkip;

  /// Initial delay of first observable update, after the initial pagination.
  final Duration delay;

  @override
  FirestoreCollectionBuilderState<T, D> createState() => FirestoreCollectionBuilderState<T, D>();
}

/// The public state that'also passed to [FirestoreCollectionBuilder.builder].
///
/// Observe [paginatedItems], [subscribedItems], or [pendingItems] for changes,
/// unless [FirestoreCollectionBuilder.observe] is true.
class FirestoreCollectionBuilderState<T extends FirestoreModel<T>, D> extends State<FirestoreCollectionBuilder<T, D>>
    with WidgetsBindingObserver {
  ReactionDisposer _pendingItemsReaction;

  /// Current status of this collection builder.
  FirestoreCollectionStatus get status => _storage.listStatus;

  /// Documents per page as set no [FirestoreCollectionBuilder.itemsPerPage].
  int get itemsPerPage => widget.itemsPerPage;

  /// Bucket identifier of this [FirestoreCollectinoBuilderState].
  String get identifier => 'subscribed_collection_builder_${widget.bucket}';

  /// Current paginated page.
  int get page => _storage.page;

  /// True when the last pagination request returned less items than [itemsPerPage].
  bool get isEndReached => _storage.isEndReached;

  /// [ObservableList] of paginated items. Observe this manually, if
  /// [FirestoreCollectionBuilder.observe] is false.
  ObservableList<T> get paginatedItems => _storage.paginatedItems;

  /// [ObservableList] of subscribed items. Observe this manually, if
  /// [FirestoreCollectionBuilder.observe] is false.
  ///
  /// List is only updated when [FirestoreCollectionBuilder.subscribe] is true.
  ObservableList<T> get subscribedItems => _storage.subscribedItems;

  /// [ObservableList] of pending items. Observe this manually, if
  /// [FirestoreCollectionBuilder.observe] is false.
  ///
  /// List is only updated when [FirestoreCollectionBuilder.subscribe] is true
  /// and the [ScrollController] is scrolled.
  ObservableList<T> get pendingItems => _storage.pendingItems;

  /// [ObservableMap] of cargo for every deserialized document model.
  ObservableMap<String, D> get cargo => _storage.cargo;

  _FirestoreCollectionStorage<T, D> _storage;
  bool get _isScrolled => widget.scrollController?.hasClients == true ? widget.scrollController.offset > 0 : false;

  /// Get the paginator callback for a paginated documents widget, according
  /// to its index within a list.
  VoidCallback getPaginator(int paginatedItemIndex) =>
      !_storage.isEndReached && paginatedItemIndex > (paginatedItems.length - itemsPerPage)
          ? () => _storage.fetchPage(_storage.page + 1)
          : null;

  /// Move the pending items to the subscribed items list.
  void movePendingItemsToSubscribedItems() => _storage?.movePendingItemsToSubscribedItems();

  void _handleScroll() {
    assert(widget.scrollController != null);
    if (widget.scrollController.hasClients && _isScrolled && pendingItems.isNotEmpty) {
      movePendingItemsToSubscribedItems();
    }
  }

  Future _startListening() async {
    if (paginatedItems.isEmpty) await _storage.fetchPage(1);
    if (widget.subscribe && mounted && !_storage.isSubscribed) _storage.startSubscription();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    _storage = (widget.bucket != null
        ? RefreshStorage.write<_FirestoreCollectionStorage<T, D>>(
            context: context,
            identifier: '${identifier}_firestore_collection_builder',
            route: widget.routeOverride,
            storage: widget.storageOverride,
            dispose: (storage) => storage.dispose(),
            builder: () => _FirestoreCollectionStorage<T, D>(identifier: identifier),
          )
        : _FirestoreCollectionStorage<T, D>(identifier: identifier))
      ..mount(this);

    _startListening();
    _pendingItemsReaction = autorun((_) => widget.onPendingItemsChanged?.call(pendingItems));
    widget.scrollController?.addListener(_handleScroll);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant FirestoreCollectionBuilder<T, D> oldWidget) {
    assert(oldWidget.bucket == widget.bucket, 'Bucket must not change');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    widget.scrollController?.removeListener(_handleScroll);
    _storage.stopSubscription();
    _pendingItemsReaction?.call();
    _storage.unmount(this);
    if (widget.bucket == null) _storage.dispose();
    _storage = null; // HACK: Fixes memory leak.
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        _startListening();
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        _storage.stopSubscription();
        break;
    }
  }

  @override
  Widget build(BuildContext context) => Provider<FirestoreCollectionBuilderState>.value(
        value: this,
        child: widget.observe
            ? Observer(
                name: widget.bucket,
                builder: (context, __) => widget.builder(context, this),
              )
            : widget.builder(context, this),
      );
}
