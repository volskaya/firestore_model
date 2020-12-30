// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firestore_collection_builder.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$_FirestoreCollectionStorage<T extends FirestoreModel<T>>
    on _FirestoreCollectionStorageStore<T>, Store {
  final _$listStatusAtom =
      Atom(name: '_FirestoreCollectionStorageStore.listStatus');

  @override
  FirestoreCollectionStatus get listStatus {
    _$listStatusAtom.reportRead();
    return super.listStatus;
  }

  @override
  set listStatus(FirestoreCollectionStatus value) {
    _$listStatusAtom.reportWrite(value, super.listStatus, () {
      super.listStatus = value;
    });
  }

  final _$_isEndReachedAtom =
      Atom(name: '_FirestoreCollectionStorageStore._isEndReached');

  @override
  bool get _isEndReached {
    _$_isEndReachedAtom.reportRead();
    return super._isEndReached;
  }

  @override
  set _isEndReached(bool value) {
    _$_isEndReachedAtom.reportWrite(value, super._isEndReached, () {
      super._isEndReached = value;
    });
  }

  final _$_fetchPageAsyncAction =
      AsyncAction('_FirestoreCollectionStorageStore._fetchPage');

  @override
  Future<dynamic> _fetchPage(int page) {
    return _$_fetchPageAsyncAction.run(() => super._fetchPage(page));
  }

  final _$_paginateAsyncAction =
      AsyncAction('_FirestoreCollectionStorageStore._paginate');

  @override
  Future<dynamic> _paginate() {
    return _$_paginateAsyncAction.run(() => super._paginate());
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
  void _dispose() {
    final _$actionInfo = _$_FirestoreCollectionStorageStoreActionController
        .startAction(name: '_FirestoreCollectionStorageStore._dispose');
    try {
      return super._dispose();
    } finally {
      _$_FirestoreCollectionStorageStoreActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void _mount(FirestoreCollectionBuilderState<T> state) {
    final _$actionInfo = _$_FirestoreCollectionStorageStoreActionController
        .startAction(name: '_FirestoreCollectionStorageStore._mount');
    try {
      return super._mount(state);
    } finally {
      _$_FirestoreCollectionStorageStoreActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listStatus: ${listStatus}
    ''';
  }
}
