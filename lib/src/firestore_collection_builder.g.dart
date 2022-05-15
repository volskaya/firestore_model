// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firestore_collection_builder.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$_FirestoreCollectionStorage<T extends FirestoreModel<T>, D>
    on _FirestoreCollectionStorageStore<T, D>, Store {
  late final _$paginatedItemsAtom = Atom(
      name: '_FirestoreCollectionStorageStore.paginatedItems',
      context: context);

  @override
  IList<T> get paginatedItems {
    _$paginatedItemsAtom.reportRead();
    return super.paginatedItems;
  }

  @override
  set paginatedItems(IList<T> value) {
    if (super.paginatedItems != value) {
      _$paginatedItemsAtom.reportWrite(value, super.paginatedItems, () {
        super.paginatedItems = value;
      });
    }
  }

  late final _$subscribedItemsAtom = Atom(
      name: '_FirestoreCollectionStorageStore.subscribedItems',
      context: context);

  @override
  IList<T> get subscribedItems {
    _$subscribedItemsAtom.reportRead();
    return super.subscribedItems;
  }

  @override
  set subscribedItems(IList<T> value) {
    if (super.subscribedItems != value) {
      _$subscribedItemsAtom.reportWrite(value, super.subscribedItems, () {
        super.subscribedItems = value;
      });
    }
  }

  late final _$pendingItemsAtom = Atom(
      name: '_FirestoreCollectionStorageStore.pendingItems', context: context);

  @override
  IList<T> get pendingItems {
    _$pendingItemsAtom.reportRead();
    return super.pendingItems;
  }

  @override
  set pendingItems(IList<T> value) {
    if (super.pendingItems != value) {
      _$pendingItemsAtom.reportWrite(value, super.pendingItems, () {
        super.pendingItems = value;
      });
    }
  }

  late final _$listStatusAtom = Atom(
      name: '_FirestoreCollectionStorageStore.listStatus', context: context);

  @override
  FirestoreCollectionStatus get listStatus {
    _$listStatusAtom.reportRead();
    return super.listStatus;
  }

  @override
  set listStatus(FirestoreCollectionStatus value) {
    if (super.listStatus != value) {
      _$listStatusAtom.reportWrite(value, super.listStatus, () {
        super.listStatus = value;
      });
    }
  }

  late final _$isEndReachedAtom = Atom(
      name: '_FirestoreCollectionStorageStore.isEndReached', context: context);

  @override
  bool get isEndReached {
    _$isEndReachedAtom.reportRead();
    return super.isEndReached;
  }

  @override
  set isEndReached(bool value) {
    if (super.isEndReached != value) {
      _$isEndReachedAtom.reportWrite(value, super.isEndReached, () {
        super.isEndReached = value;
      });
    }
  }

  late final _$fetchPageAsyncAction = AsyncAction(
      '_FirestoreCollectionStorageStore.fetchPage',
      context: context);

  @override
  Future<void> fetchPage(int page) {
    return _$fetchPageAsyncAction.run(() => super.fetchPage(page));
  }

  late final _$_paginateAsyncAction = AsyncAction(
      '_FirestoreCollectionStorageStore._paginate',
      context: context);

  @override
  Future<void> _paginate(int page) {
    return _$_paginateAsyncAction.run(() => super._paginate(page));
  }

  late final _$_handleQuerySubscriptionAsyncAction = AsyncAction(
      '_FirestoreCollectionStorageStore._handleQuerySubscription',
      context: context);

  @override
  Future<void> _handleQuerySubscription(QuerySnapshot<Object?> snapshot) {
    return _$_handleQuerySubscriptionAsyncAction
        .run(() => super._handleQuerySubscription(snapshot));
  }

  late final _$_FirestoreCollectionStorageStoreActionController =
      ActionController(
          name: '_FirestoreCollectionStorageStore', context: context);

  @override
  void _checkStatus() {
    final _$actionInfo = _$_FirestoreCollectionStorageStoreActionController
        .startAction(name: '_FirestoreCollectionStorageStore._checkStatus');
    try {
      return super._checkStatus();
    } finally {
      _$_FirestoreCollectionStorageStoreActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void movePendingItemsToSubscribedItems() {
    final _$actionInfo =
        _$_FirestoreCollectionStorageStoreActionController.startAction(
            name:
                '_FirestoreCollectionStorageStore.movePendingItemsToSubscribedItems');
    try {
      return super.movePendingItemsToSubscribedItems();
    } finally {
      _$_FirestoreCollectionStorageStoreActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void dispose([dynamic _]) {
    final _$actionInfo = _$_FirestoreCollectionStorageStoreActionController
        .startAction(name: '_FirestoreCollectionStorageStore.dispose');
    try {
      return super.dispose(_);
    } finally {
      _$_FirestoreCollectionStorageStoreActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void mount(FirestoreCollectionBuilderState<T, D> state) {
    final _$actionInfo = _$_FirestoreCollectionStorageStoreActionController
        .startAction(name: '_FirestoreCollectionStorageStore.mount');
    try {
      return super.mount(state);
    } finally {
      _$_FirestoreCollectionStorageStoreActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
paginatedItems: ${paginatedItems},
subscribedItems: ${subscribedItems},
pendingItems: ${pendingItems},
listStatus: ${listStatus},
isEndReached: ${isEndReached}
    ''';
  }
}
