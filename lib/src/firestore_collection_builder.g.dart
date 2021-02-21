// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firestore_collection_builder.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$_FirestoreCollectionStorage<T extends FirestoreModel<T>, D>
    on _FirestoreCollectionStorageStore<T, D>, Store {
  final _$paginatedItemsAtom =
      Atom(name: '_FirestoreCollectionStorageStore.paginatedItems');

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

  final _$subscribedItemsAtom =
      Atom(name: '_FirestoreCollectionStorageStore.subscribedItems');

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

  final _$pendingItemsAtom =
      Atom(name: '_FirestoreCollectionStorageStore.pendingItems');

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

  final _$listStatusAtom =
      Atom(name: '_FirestoreCollectionStorageStore.listStatus');

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

  final _$isEndReachedAtom =
      Atom(name: '_FirestoreCollectionStorageStore.isEndReached');

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

  final _$fetchPageAsyncAction =
      AsyncAction('_FirestoreCollectionStorageStore.fetchPage');

  @override
  Future<dynamic> fetchPage(int page) {
    return _$fetchPageAsyncAction.run(() => super.fetchPage(page));
  }

  final _$_paginateAsyncAction =
      AsyncAction('_FirestoreCollectionStorageStore._paginate');

  @override
  Future<dynamic> _paginate(int page) {
    return _$_paginateAsyncAction.run(() => super._paginate(page));
  }

  final _$_handleQuerySubscriptionAsyncAction =
      AsyncAction('_FirestoreCollectionStorageStore._handleQuerySubscription');

  @override
  Future<dynamic> _handleQuerySubscription(QuerySnapshot snapshot) {
    return _$_handleQuerySubscriptionAsyncAction
        .run(() => super._handleQuerySubscription(snapshot));
  }

  final _$_FirestoreCollectionStorageStoreActionController =
      ActionController(name: '_FirestoreCollectionStorageStore');

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
