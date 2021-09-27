import 'dart:async';
import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:firestore_model/firestore_model.dart';
import 'package:firestore_model/src/firestore_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:loader_coordinator/loader_coordinator.dart';
import 'package:log/log.dart';
import 'package:mobx/mobx.dart';
import 'package:refresh_storage/refresh_storage.dart';
import 'package:riverpod/riverpod.dart';

part 'firestore_collection_pod.freezed.dart';
part 'firestore_collection_pod.g.dart';

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
typedef FirestoreCollectionPodQueryBuilder<T extends FirestoreModel<T>, D> = Query
    Function(FirestoreCollectionPod<T, D> collection, Query base);

/// If this callback returns true, the paginated item will be skipped.
typedef FirestoreCollectionPodShouldSkipCallback = bool Function(DocumentSnapshot value);

/// Event callback of [FirestoreCollection].
typedef FirestoreCollectionPodEvent<T extends FirestoreModel<T>, D> = void
    Function(FirestoreCollectionPod<T, D> collection);

/// Cargo builder for items in [FirestoreCollection].
typedef FirestoreCollectionPodCargoBuilder<T extends FirestoreModel<T>, D> = FutureOr<D> Function(T item);

/// [FirestoreCollectionProps] targets the [bucket] & [timestampField] as family values.
///
/// Lists, within the app, should use unique bucket names.
class FirestoreCollectionProps<T extends FirestoreModel<T>, D> {
  FirestoreCollectionProps({
    required this.bucket,
    required this.collection,
    required this.orderValues,
    this.timestampField = 'createTime',
    this.prepareSecondPage = false,
    this.itemsPerPage = FirestoreCollectionPod.defaultItemsPerPage,
    this.subscribe = false,
    this.allowOfflineItems = false,
    this.delay = Duration.zero,
    this.shouldSkip,
    this.pageQuery,
    this.subscriptionQuery,
    this.onFirstPagePaginated,
    this.cargoBuilder,
    this.delayedFuture,
    this.ads = false,
  });

  /// Bucket identifier of [RefreshStorage] used by [FirestoreCollectionBuilder].
  final String bucket;

  /// Base [Query] to query the documents from.
  final Query collection;

  /// Default field name of the create timestamp within the collection documents,
  final String timestampField;

  /// Initially paginates 2 pages at once, since the child items are expected to call
  /// pagination right away anyway, for their next page.
  final bool prepareSecondPage;

  /// Number of documents to paginate.
  final int itemsPerPage;

  /// Whether to also listen to new documents, created within the collection.
  final bool subscribe;

  /// Whether to allow the subscription list to add offline documents to the list.
  final bool allowOfflineItems;

  /// Initial delay of first observable update, after the initial pagination.
  final Duration delay;

  /// The values for order fields used in [query]. Must be maintain the order as in [query].
  ///
  /// By default the documents are ordered by [timestampField]. Value of this field
  /// must be returned in the list.
  final List<dynamic> Function(T item) orderValues;

  /// If this callback returns true, the paginated item will be skipped.
  /// This won't affect subscribed items, as that could caus an infinite loop.
  final FirestoreCollectionPodShouldSkipCallback? shouldSkip;

  /// Query builder for the paginated list.
  ///
  /// By default the paginated documents will be ordered by [timestampField],
  /// in a descending order.
  final FirestoreCollectionPodQueryBuilder<T, D>? pageQuery;

  /// Query builder for the paginated list.
  ///
  /// By default the paginated documents will be ordered by [timestampField],
  /// in an ascending order.
  final FirestoreCollectionPodQueryBuilder<T, D>? subscriptionQuery;

  /// Called after the first page has paginated.
  final FirestoreCollectionPodEvent<T, D>? onFirstPagePaginated;

  /// Cargo builder for each seen item.
  ///
  /// For example a notification document also needing to paginate
  /// its relevant user document.
  final FirestoreCollectionPodCargoBuilder<T, D>? cargoBuilder;

  /// A delayed future to await before the first paginated items are updated.
  final Future Function()? delayedFuture;

  /// A convenience toggle to memoize ads toggle status for the pod.
  final bool ads;

  // Prop equality is tied only to the bucket.
  @override
  bool operator ==(dynamic other) =>
      identical(other, this) ||
      (other is FirestoreCollectionProps && other.bucket == bucket && other.timestampField == timestampField);

  @override
  int get hashCode => runtimeType.hashCode ^ bucket.hashCode ^ timestampField.hashCode;
}

@freezed
class FirestoreCollectionValue<T extends FirestoreModel<T>, D>
    with _$FirestoreCollectionValue<T, D>
    implements RefreshStorageItem {
  const factory FirestoreCollectionValue({
    required List<T> paginated,
    required List<T> subscribed,
    required List<T> pending,
    required Map<String, D> cargo,
    required DateTime createTime,
    @Default(FirestoreCollectionStatus.idle) FirestoreCollectionStatus status,
    @Default(false) bool ended,
  }) = _FirestoreCollectionValue;

  const FirestoreCollectionValue._();

  @override
  void dispose([dynamic _]) {
    for (final item in pending.followedBy(subscribed).followedBy(paginated)) item.dispose();
    for (final value in cargo.values) (value as dynamic)?.dispose?.call();
  }

  D? cargoOf(T item) => cargo[item.id];

  FirestoreCollectionValue<T, D> clean() => copyWith(
        paginated: paginated..insertAll(0, pending.reversed.followedBy(subscribed.reversed)),
        pending: <T>[],
        subscribed: <T>[],
      );
}

class FirestoreCollectionPod<T extends FirestoreModel<T>, D> extends _FirestoreCollectionPod<T, D>
    with _$FirestoreCollectionPod<T, D> {
  FirestoreCollectionPod(
    ProviderRefBase ref, {
    required FirestoreCollectionProps<T, D> props,
    required int refresh,
    FirestoreCollectionValue<T, D>? initialValue,
  }) : super(
          ref,
          props: props,
          refresh: refresh,
          initialValue: initialValue,
        );

  /// The default count to paginate unless overriden in the [FirestoreCollectionBuilder]'s constructor.
  static const defaultItemsPerPage = 20;

  static ChangeNotifierProviderFamily<FirestoreCollectionPod<T, D>, FirestoreCollectionProps<T, D>>
      getChangeProviderFamily<T extends FirestoreModel<T>, D>() =>
          ChangeNotifierProvider.family(_buildPod, name: 'FirestoreCollection');

  static ProviderFamily<FirestoreCollectionPod<T, D>, FirestoreCollectionProps<T, D>>
      getProviderFamily<T extends FirestoreModel<T>, D>() => Provider.family(_buildPod, name: 'FirestoreCollection');

  static FirestoreCollectionPod<T, D> _buildPod<T extends FirestoreModel<T>, D>(
    ProviderRefBase ref,
    FirestoreCollectionProps<T, D> props,
  ) {
    final refresh = ref.read(RefreshCounterPod.provider);
    final storage = ref.read(RefreshStoragePod.provider);
    final storageEntry = storage.getItem(props.bucket);
    final previousState = storageEntry?.item as FirestoreCollectionValue<T, D>?;
    final usePreviousState = storageEntry != null && refresh == storageEntry.refresh;
    final collection = FirestoreCollectionPod<T, D>(
      ref,
      props: props,
      refresh: refresh,
      initialValue: usePreviousState ? previousState : null,
    );

    void listener() {
      final value = FirestoreCollectionValue(
        paginated: collection.paginated,
        subscribed: collection.subscribed,
        pending: collection.pending,
        cargo: collection.cargo,
        createTime: collection.createTime,
        status: collection.status,
        ended: collection.ended,
      );

      storage.add(props.bucket, value, refresh);
    }

    collection.addListener(listener);
    ref.onDispose(() => collection.removeListener(listener));

    return collection;
  }
}

abstract class _FirestoreCollectionPod<T extends FirestoreModel<T>, D> extends ChangeNotifier
    with AnimationLocalListenersMixin, AnimationLazyListenerMixin, Store {
  _FirestoreCollectionPod(
    this.ref, {
    required this.props,
    required this.refresh,
    FirestoreCollectionValue<T, D>? initialValue,
  })  : ended = initialValue?.ended ?? false,
        status = initialValue?.status ?? FirestoreCollectionStatus.idle,
        createTime = initialValue?.createTime ?? DateTime.now(),
        paginated = initialValue != null
            ? [
                ...initialValue.pending.reversed,
                ...initialValue.subscribed.reversed,
                ...initialValue.paginated,
              ]
            : <T>[];

  static final _log = Log.named('FirestoreCollection');

  final ProviderRefBase ref;
  final int refresh;
  final FirestoreCollectionProps<T, D> props;
  final DateTime createTime;

  final _seenItems = <String>{}; // Seen document IDs to filter redundant items.

  @o List<T> paginated = <T>[];
  @o List<T> subscribed = <T>[];
  @o List<T> pending = <T>[];
  @o HashMap<String, D> cargo = HashMap<String, D>();
  @o FirestoreCollectionStatus status = FirestoreCollectionStatus.idle;
  @o bool ended = false;
  @o int page = 0;

  StreamSubscription<QuerySnapshot>? _streamSubscription;
  bool _paginating = false;
  bool get isSubscribed => _streamSubscription != null;
  bool get isScrolled => false; // TODO(volskaya): Implement something for htis.

  Future<MapEntry<T, D?>> _getModelAndCargo(DocumentSnapshot doc) async {
    final model = await FirestoreModel.withReference<T>(doc.reference, doc);
    final cargo = await props.cargoBuilder?.call(model);
    return MapEntry(model, cargo);
  }

  Future<List<MapEntry<T, D?>>> _deserializeQuerySnapshot(
    Iterable<DocumentSnapshot> docs, {
    bool subscribed = false,
  }) =>
      Future.wait(
        docs.where((doc) {
          if (_seenItems.contains(doc.id)) return false;
          if (!subscribed && (props.shouldSkip?.call(doc) ?? false)) {
            _seenItems.add(doc.id); // Skipped manually due to `shouldSkip`.
            return false;
          }
          return true;
        }).map((doc) {
          _seenItems.add(doc.id);
          return _getModelAndCargo(doc);
        }),
        cleanUp: (e) {
          e.key.dispose();
          (e.value as dynamic)?.dispose();
        },
      );

  Query? get _pageQuery {
    if (props.pageQuery != null) {
      return props.pageQuery!(this as FirestoreCollectionPod<T, D>, props.collection);
    } else {
      final query = props.collection
          .orderBy(props.timestampField, descending: true)
          .orderBy(FieldPath.documentId, descending: true);

      final T? last = paginated.lastOrNull;
      return last != null ? query.startAfter([...props.orderValues(last), last.id]) : query;
    }
  }

  Query get _subscriptionQuery {
    assert(props.subscribe);

    if (props.subscriptionQuery != null) {
      return props.subscriptionQuery!(this as FirestoreCollectionPod<T, D>, props.collection);
    } else {
      final query = props.collection.orderBy(props.timestampField, descending: false);
      final cursor = pending.reversed
          .followedBy(subscribed.reversed)
          .followedBy(paginated)
          .firstWhereOrNull((x) => x.exists == true);

      /// A snapshot could already be deleted, by the time it's used to subscribe.
      /// Iterate over pending -> subscribed -> paginated items to find the newest existing snapshot.
      ///
      /// Pending and subscribed items are reversed, since they're ordered ascending.
      return cursor != null ? query.startAfter([...props.orderValues(cursor), cursor.id]) : query;
    }
  }

  @action
  void _checkStatus() {
    if (paginated.isEmpty && subscribed.isEmpty) {
      status = FirestoreCollectionStatus.empty;
    } else if (paginated.isNotEmpty || subscribed.isNotEmpty) {
      status = FirestoreCollectionStatus.ready;
    }
  }

  @action
  void movePendingItemsToSubscribedItems() {
    if (pending.isNotEmpty) {
      subscribed = subscribed..addAll(pending);
      pending = pending..clear();
      notifyListeners();
    }
  }

  @action
  Future<void> fetchPage(int page) async {
    if (page <= this.page || ended || !mounted) {
      // _log.i('Skipping redundant pagination for page: $page');
      return;
    }

    if (_paginating) return;
    _paginating = true;

    if (status == FirestoreCollectionStatus.idle) {
      // This is assumed to be the first pagination.
      status = FirestoreCollectionStatus.loading;
      notifyListeners();
    }

    final loader = LoaderCoordinator.instance.touch();

    try {
      await _paginate(page);

      // NOTE: Initial pagination could have fetched 2 pages.
      assert(!mounted || (page == 1 ? (page == this.page || page + 1 == this.page) : page == this.page));
    } finally {
      loader.dispose();
      _paginating = false;
    }
  }

  @action
  Future<void> _paginate(int page) async {
    assert(page > this.page);
    if (!mounted) return;

    // Initially fetch 2 pages, since the first items will try to paginate right away anyway.
    final isFirstPage = page == 1;
    final prepareSecondPage = isFirstPage && props.prepareSecondPage;
    final itemCount = props.prepareSecondPage ? props.itemsPerPage * 2 : props.itemsPerPage;
    final snapshots = await _pageQuery?.limit(itemCount).get();

    if (!mounted) {
      return;
    } else if (snapshots == null) {
      _checkStatus();
      ended = true;
      this.page = prepareSecondPage ? page + 1 : page;
      notifyListeners();
      return;
    } else if (isFirstPage && mounted) {
      final now = DateTime.now();
      final awaitDelay = props.delay > Duration.zero && now.isBefore(createTime.add(props.delay));
      final awaitDelayedFuture = props.delayedFuture != null;

      try {
        await Future.wait([
          if (awaitDelayedFuture) props.delayedFuture!(),
          if (awaitDelay) Future<void>.delayed(now.difference(createTime).abs()),
        ]);
      } catch (_) {}

      if (!mounted) return;
    }

    final items = await _deserializeQuerySnapshot(snapshots.docs);
    // final items = await _deserializeIsolateSnapshots(snapshots);

    if (mounted) {
      if (items.length < itemCount) ended = true;

      for (final entry in items) {
        paginated.add(entry.key);
        if (entry.value != null) cargo[entry.key.id] = entry.value!;
      }

      // HACK: Make sure the observables notify an update.
      paginated = paginated;
      cargo = cargo;

      this.page = prepareSecondPage ? page + 1 : page;
      _checkStatus();
      notifyListeners();
    } else {
      for (final item in items) {
        item.key.dispose();
        (item.value as dynamic)?.dispose?.call();
      }
    }

    if (isFirstPage && mounted && props.onFirstPagePaginated != null) {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        if (mounted) props.onFirstPagePaginated?.call(this as FirestoreCollectionPod<T, D>);
      });
    }
  }

  void startSubscription() {
    assert(_streamSubscription == null);
    assert(props.subscribe);

    if (!isSubscribed) {
      try {
        // _log.i('Subscribing to ${props.bucket}');
        _streamSubscription = _subscriptionQuery
            .limit(props.itemsPerPage)
            .snapshots(includeMetadataChanges: true)
            .listen(_handleQuerySubscription);
      } on PlatformException catch (e, t) {
        _log.e('Couldn\'t attach a listener to ${props.bucket}', e, t);
        WidgetsBinding.instance!.addPostFrameCallback((_) {
          if (props.subscribe && mounted && !isSubscribed) startSubscription(); // Attempt to resubscribe.
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
  Future<void> _handleQuerySubscription(QuerySnapshot snapshot) async {
    if (!mounted) return;
    if (snapshot.docs.isEmpty) {
      // _log.i('Skipping query snapshot: ${snapshot.hashCode}, no documents');
      return;
    }

    // _log.i('Handling query snapshot: ${snapshot.hashCode}, ${snapshot.docs.length} new documents');

    try {
      final upstreamDocuments = [
        ...snapshot.docs.where((doc) =>
            !_seenItems.contains(doc.id) && doc.metadata.hasPendingWrites == false && doc.metadata.isFromCache == false)
      ];

      if (upstreamDocuments.isNotEmpty) stopSubscription(); // The subscription will resubscribe from a newer document.
      final allowOffline = props.allowOfflineItems == true;
      final documents = allowOffline ? snapshot.docs.where((x) => !_seenItems.contains(x.id)) : upstreamDocuments;
      // _log.i('${props.bucket} subscription got ${documents.length} new items');
      final items = await _deserializeQuerySnapshot(documents, subscribed: true);

      if (mounted) {
        if (documents.isNotEmpty) {
          if (isScrolled) {
            paginated = paginated..addAll(items.map((item) => item.key));
            cargo = cargo..addEntries(items.where((x) => x.value != null).map((x) => MapEntry(x.key.id, x.value!)));
            notifyListeners();
          } else {
            subscribed = subscribed..addAll(items.map((item) => item.key));
            cargo = cargo..addEntries(items.where((x) => x.value != null).map((x) => MapEntry(x.key.id, x.value!)));
          }
          notifyListeners();
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
      if (props.subscribe && !isSubscribed) startSubscription();
    }
  }

  /// Get the paginator callback for a paginated documents widget, according
  /// to its index within a list.
  Future Function()? getPaginator(int paginatedItemIndex) =>
      !ended && paginatedItemIndex > (paginated.length - props.itemsPerPage) ? () => fetchPage(page + 1) : null;

  Future _handleInitialMount() async {
    if (!mounted) return;
    if (paginated.isEmpty) await fetchPage(1);
    if (props.subscribe && mounted && !isSubscribed) startSubscription();
  }

  bool mounted = false;

  @override
  void didStartListening() {
    mounted = true;
    _handleInitialMount();
  }

  @override
  void didStopListening() {
    mounted = false;
  }
}
