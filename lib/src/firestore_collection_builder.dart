import 'dart:async';
import 'dart:developer' as developer;

import 'package:firestore_model/src/firestore_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:refresh_storage/refresh_storage.dart';

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

typedef FirestoreCollectionQueryBuilder<T extends FirestoreModel<T>> = Query Function(
  FirestoreCollectionBuilderState<T> state,
  Query collection,
);

typedef FirestoreCollectionChildBuilder<T extends FirestoreModel<T>> = Widget Function(
  BuildContext context,
  FirestoreCollectionBuilderState<T> state,
);

class _FirestoreCollectionStorage<T extends FirestoreModel<T>> {
  final paginatedItems = ObservableList<T>();
  final subscribedItems = ObservableList<T>();
  final pendingItems = ObservableList<T>();
  final listStatus = ValueNotifier<FirestoreCollectionStatus>(FirestoreCollectionStatus.idle);
}

/// Build subscribable lists of firestore collections.
///
/// If there's a [PrimaryScrollController] above this collection, when it's
/// scrolled off its resting position, subscribed items will be added to the
/// pending items list instead, until the controller is back in its resting position.
class FirestoreCollectionBuilder<T extends FirestoreModel<T>> extends StatefulWidget {
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
  }) : super(key: key);

  /// Shortcut access to pending items.
  final ValueChanged<List<T>> onPendingItemsChanged;

  /// Pass custom scroll controller. By default this builder tries to attach to
  /// [PrimaryScrollController] to add items to pending item list, instead of
  /// subscribed, when the list is scrolled.
  final ScrollController scrollController;

  /// Initial [Query] to query the documents from.
  final Query collection;

  /// Bucket identifier of [RefreshStorage] used by [FirestoreCollectionBuilder].
  final String bucket;

  /// Child builder with the current list state.
  ///
  /// If [observe] is false, this builder won't rebuild when items change and
  /// you'll have to manually use [Observer] to observe the lits inside [FirestoreCollectionBuilderState].
  final FirestoreCollectionChildBuilder<T> builder;

  /// Query builder for the paginated list.
  ///
  /// By default the paginated documents will be ordered by [timestampField],
  /// in a descending order.
  final FirestoreCollectionQueryBuilder<T> pageQuery;

  /// Query builder for the paginated list.
  ///
  /// By default the paginated documents will be ordered by [timestampField],
  /// in an ascending order.
  final FirestoreCollectionQueryBuilder<T> subscriptionQuery;

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
  final PageStorageBucket storageOverride;

  /// Route override passed to the [RefreshStorage] builder.
  final ModalRoute routeOverride;

  @override
  FirestoreCollectionBuilderState<T> createState() => FirestoreCollectionBuilderState<T>();
}

/// The public state that'also passed to [FirestoreCollectionBuilder.builder].
///
/// Observe [paginatedItems], [subscribedItems], or [pendingItems] for changes,
/// unless [FirestoreCollectionBuilder.observe] is true.
class FirestoreCollectionBuilderState<T extends FirestoreModel<T>> extends State<FirestoreCollectionBuilder<T>>
    with WidgetsBindingObserver {
  final _seenItems = <String>{}; // Seen document IDs to filter redundant items
  ReactionDisposer _pendingItemsReaction;

  /// Current status of this collection builder.
  ValueNotifier<FirestoreCollectionStatus> get status => _pageStorage.listStatus;

  /// Documents per page as set no [FirestoreCollectionBuilder.itemsPerPage].
  int get itemsPerPage => widget.itemsPerPage;

  /// Bucket identifier of this [FirestoreCollectinoBuilderState].
  String get identifier => 'subscribed_collection_builder_${widget.bucket}';

  /// Timestamp of last pagination.
  DateTime pageTime;

  /// Current paginated page.
  int page = 0;

  /// True when the last pagination request returned less items than [itemsPerPage].
  bool isEndReached = false;

  /// [ObservableList] of paginated items. Observe this manually, if
  /// [FirestoreCollectionBuilder.observe] is false.
  ObservableList<T> get paginatedItems => _pageStorage.paginatedItems;

  /// [ObservableList] of subscribed items. Observe this manually, if
  /// [FirestoreCollectionBuilder.observe] is false.
  ///
  /// List is only updated when [FirestoreCollectionBuilder.subscribe] is true.
  ObservableList<T> get subscribedItems => _pageStorage.subscribedItems;

  /// [ObservableList] of pending items. Observe this manually, if
  /// [FirestoreCollectionBuilder.observe] is false.
  ///
  /// List is only updated when [FirestoreCollectionBuilder.subscribe] is true
  /// and the [ScrollController] is scrolled.
  ObservableList<T> get pendingItems => _pageStorage.pendingItems;

  Timestamp _initialTimestamp;
  bool _fetchingPage = false;
  _FirestoreCollectionStorage<T> _pageStorage;
  bool get _isScrolled => widget.scrollController?.hasClients == true ? widget.scrollController.offset > 0 : false;

  Query get _pageQuery {
    assert(_initialTimestamp != null);
    if (widget.pageQuery != null) {
      return widget.pageQuery(this, widget.collection);
    } else {
      final query = widget.collection.orderBy(widget.timestampField, descending: true);
      return paginatedItems.isNotEmpty ? query.startAfterDocument(paginatedItems.last.snapshot) : query;
    }
  }

  Query get _subscriptionQuery {
    assert(_initialTimestamp != null);
    assert(widget.subscribe);

    // Check if server timestamp is ready.
    // If a subscribed item was added to a list without a serverside [FieldValue],
    // maybe subscription hasn't skipped resubbing on an offline document.
    assert((() {
      for (final item in [...pendingItems, ...subscribedItems, ...paginatedItems]) {
        if (item.createTime == null) return false;
      }
      return true;
    })(), 'Spotted a subscribed item with no timestamp.');

    if (widget.subscriptionQuery != null) {
      return widget.subscriptionQuery(this, widget.collection);
    } else {
      final query = widget.collection.orderBy(widget.timestampField, descending: false);
      final items = [
        ...pendingItems.reversed,
        ...subscribedItems.reversed,
        ...paginatedItems,
      ].where((item) => item.exists);

      /// A snapshot could already be deleted, by the time it's used to subscribe.
      /// Iterate over pending -> subscribed -> paginated items to find the newest existing snapshot.
      ///
      /// Pending and subscribed items are reversed, since they're ordered ascending.
      DocumentSnapshot newestSnapshot;
      for (final item in items) {
        if (item.snapshot?.exists == true) {
          newestSnapshot = item.snapshot;
          break;
        }
      }

      assert((() {
        final _items = items.toList(growable: false);
        for (var i = 0; i < _items.length - 1; i++) {
          final currentItem = _items[i], nextItem = _items[i + 1];
          if (currentItem.createTime.millisecondsSinceEpoch < nextItem.createTime.millisecondsSinceEpoch) {
            print('Current timestamp: ${currentItem.createTime}, next: ${nextItem.createTime}');
            return false;
          }
        }
        return true;
      })(), 'Subscription query items are not in a descending order');

      return newestSnapshot != null ? query.startAfterDocument(newestSnapshot) : query;
    }
  }

  /// Get the paginator callback for a paginated documents widget, according
  /// to its index within a list.
  VoidCallback getPaginator(int paginatedItemIndex) =>
      paginatedItemIndex > (paginatedItems.length - itemsPerPage) ? () => _fetchPage(page + 1) : null;

  /// Seen items are added to [_seenItems] and never returned twice.
  Future<List<T>> _deserializeQuerySnapshot(Iterable<DocumentSnapshot> docs) => Future.wait(
        docs.where((doc) => !_seenItems.contains(doc.id)).map((doc) {
          _seenItems.add(doc.id);
          return FirestoreModel.withReference(doc.reference, doc);
        }),
      );

  void _checkStatus() {
    if (paginatedItems.isEmpty && subscribedItems.isEmpty) {
      status.value = FirestoreCollectionStatus.empty;
    } else if (paginatedItems.isNotEmpty || subscribedItems.isNotEmpty) {
      status.value = FirestoreCollectionStatus.ready;
    }
  }

  Future _fetchPage(int page) async {
    if (_fetchingPage) return;
    _fetchingPage = true;

    if (page <= this.page || isEndReached) {
      developer.log('Skipping redundant pagination for page: $page', name: 'firestore_model');
      return;
    }

    if (status.value == FirestoreCollectionStatus.idle) {
      status.value = FirestoreCollectionStatus.loading;
    }

    try {
      await _paginate();
      this.page += 1;
      pageTime = DateTime.now();
      _checkStatus();
      assert(!mounted || page == this.page);
    } catch (e) {
      developer.log('Couldn\'t paginate page $page', name: 'firestore_model', error: e);
    } finally {
      _fetchingPage = false;
    }
  }

  Future _paginate() async {
    final snapshots = await _pageQuery.limit(widget.itemsPerPage).get();
    if (!mounted) return;

    if (snapshots.size < widget.itemsPerPage) {
      isEndReached = true;
      developer.log('$identifier collection end reached', name: 'firestore_model');
    }

    final items = await _deserializeQuerySnapshot(snapshots.docs);
    developer.log('$identifier pagination got ${items.length} new items', name: 'firestore_model');

    if (mounted) {
      paginatedItems.addAll(items);
    } else {
      for (final item in items) item.dispose();
    }
  }

  StreamSubscription<QuerySnapshot> _streamSubscription;
  void _startSubscription() {
    assert(_streamSubscription == null);
    assert(widget.subscribe);

    try {
      developer.log('Subscribing to $identifier', name: 'firestore_model');
      _streamSubscription = _subscriptionQuery
          .limit(itemsPerPage)
          .snapshots(includeMetadataChanges: true)
          .listen(_handleQuerySubscription);
    } on PlatformException catch (e) {
      developer.log('Couldn\'t attach a listener to $identifier', name: 'firestore_model', error: e);
    }
  }

  /// If deserializing the query snapshot returns no items, subscription will not
  /// resubscribe to the nearest subscription timestamp and instead wait for
  /// another batch.
  ///
  /// Multiple snapshots can be handled at the same time and move the subscription
  /// timestamp cursor.
  Future _handleQuerySubscription(QuerySnapshot snapshot) async {
    if (!mounted) return;
    if (snapshot.docs.isEmpty) {
      return developer.log('Skipping query snapshot: ${snapshot.hashCode}, no documents', name: 'firestore_model');
    }

    developer.log(
      'Handling query snapshot: ${snapshot.hashCode}, '
      '${snapshot.docs.length} new documents',
      name: 'firestore_model',
    );

    try {
      final items = await _deserializeQuerySnapshot(snapshot.docs);

      if (items.isNotEmpty && !snapshot.metadata.hasPendingWrites && !snapshot.metadata.isFromCache) {
        await _streamSubscription?.cancel();
        _streamSubscription = null;
      }

      developer.log('$identifier subscription got ${items.length} new items', name: 'firestore_model');

      if (mounted) {
        (_isScrolled ? pendingItems : subscribedItems).addAll(items);
        _checkStatus();
      } else {
        for (final item in items) item.dispose();
      }
    } catch (e) {
      developer.log('Couldn\'t process newly paginated items', name: 'firestore_model', error: e);
    } finally {
      // Need to resubscribe to the newest timestamp, to prevent duplicate
      // documents from being added to the list
      if (widget.subscribe && _streamSubscription == null) _startSubscription();
    }
  }

  void _setupPageStorage() {
    _pageStorage = RefreshStorage.write<_FirestoreCollectionStorage<T>>(
      context: context,
      identifier: identifier,
      builder: () => _FirestoreCollectionStorage<T>(),
      route: widget.routeOverride,
      storage: widget.storageOverride,
      dispose: (data) {
        final allItems = [...data.pendingItems, ...data.subscribedItems, ...data.paginatedItems];
        developer.log('Disposing ${allItems.length} items from $identifier', name: 'firestore_model');
        for (final item in allItems) item.dispose();
      },
    );

    if (pendingItems.isNotEmpty) {
      subscribedItems.addAll(pendingItems);
      pendingItems.clear();
    }

    if (subscribedItems.isNotEmpty) {
      paginatedItems.insertAll(
        0,
        subscribedItems.reversed.where((item) => item.createTime != null).toList(growable: false)
          ..sort((a, b) => b.createTime.millisecondsSinceEpoch.compareTo(a.createTime.millisecondsSinceEpoch)),
      );
      subscribedItems.clear();
    }

    if (paginatedItems.isNotEmpty) {
      _initialTimestamp = paginatedItems.first.createTime;

      // Assert order is correct, by making sure document timestamps
      // are ordered newest to oldest
      assert((() {
        if (paginatedItems.length <= 1) return true; // Not enough items
        var timestamp = paginatedItems.first.createTime;
        for (final message in paginatedItems.skip(1)) {
          if (message.createTime.millisecondsSinceEpoch > timestamp.millisecondsSinceEpoch) {
            return false; // Next timestamp is later than current message
          }
          timestamp = message.createTime;
        }
        return true;
      })());
    }
  }

  void _handleScroll() {
    assert(widget.scrollController != null);
    if (widget.scrollController.hasClients && _isScrolled && pendingItems.isNotEmpty) {
      subscribedItems.addAll(pendingItems);
      pendingItems.clear();
    }
  }

  /// Subscription and pagination queries will attempt to use their
  /// latest timestamps or fall back to `_initialTimestamp`
  Future _startListening() async {
    if (paginatedItems.isEmpty) await _fetchPage(1);
    if (widget.subscribe) _startSubscription();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initialTimestamp = Timestamp.now();
    pageTime = _initialTimestamp.toDate();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_pageStorage == null) {
      widget.scrollController?.addListener(_handleScroll);
      _setupPageStorage(); // Sets _pageStorage
      _startListening();
      _pendingItemsReaction = autorun((_) => widget.onPendingItemsChanged?.call(pendingItems));
    }
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
    widget.scrollController?.removeListener(_handleScroll);
    _streamSubscription?.cancel();
    _streamSubscription = null;
    _pendingItemsReaction?.call();
    // NOTE: Items are disposed by the page storage, when the route is popped
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        assert(_streamSubscription == null);
        if (widget.subscribe) _startSubscription();
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        _streamSubscription?.cancel();
        _streamSubscription = null;
        break;
    }
  }

  @override
  Widget build(BuildContext context) => widget.observe
      ? Observer(
          name: widget.bucket,
          builder: (context) => widget.builder(context, this),
        )
      : widget.builder(context, this);
}
