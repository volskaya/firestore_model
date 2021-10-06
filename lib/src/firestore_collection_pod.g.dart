// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firestore_collection_pod.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FirestoreCollectionPod<T extends FirestoreModel<T>, D>
    on _FirestoreCollectionPod<T, D>, Store {
  final _$paginatedAtom = Atom(name: '_FirestoreCollectionPod.paginated');

  @override
  List<FirestoreCollectionEntry<T, D>> get paginated {
    _$paginatedAtom.reportRead();
    return super.paginated;
  }

  @override
  set paginated(List<FirestoreCollectionEntry<T, D>> value) {
    if (super.paginated != value) {
      _$paginatedAtom.reportWrite(value, super.paginated, () {
        super.paginated = value;
      });
    }
  }

  final _$subscribedAtom = Atom(name: '_FirestoreCollectionPod.subscribed');

  @override
  List<FirestoreCollectionEntry<T, D>> get subscribed {
    _$subscribedAtom.reportRead();
    return super.subscribed;
  }

  @override
  set subscribed(List<FirestoreCollectionEntry<T, D>> value) {
    if (super.subscribed != value) {
      _$subscribedAtom.reportWrite(value, super.subscribed, () {
        super.subscribed = value;
      });
    }
  }

  final _$pendingAtom = Atom(name: '_FirestoreCollectionPod.pending');

  @override
  List<FirestoreCollectionEntry<T, D>> get pending {
    _$pendingAtom.reportRead();
    return super.pending;
  }

  @override
  set pending(List<FirestoreCollectionEntry<T, D>> value) {
    if (super.pending != value) {
      _$pendingAtom.reportWrite(value, super.pending, () {
        super.pending = value;
      });
    }
  }

  final _$statusAtom = Atom(name: '_FirestoreCollectionPod.status');

  @override
  FirestoreCollectionStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(FirestoreCollectionStatus value) {
    if (super.status != value) {
      _$statusAtom.reportWrite(value, super.status, () {
        super.status = value;
      });
    }
  }

  final _$endedAtom = Atom(name: '_FirestoreCollectionPod.ended');

  @override
  bool get ended {
    _$endedAtom.reportRead();
    return super.ended;
  }

  @override
  set ended(bool value) {
    if (super.ended != value) {
      _$endedAtom.reportWrite(value, super.ended, () {
        super.ended = value;
      });
    }
  }

  final _$pageAtom = Atom(name: '_FirestoreCollectionPod.page');

  @override
  int get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(int value) {
    if (super.page != value) {
      _$pageAtom.reportWrite(value, super.page, () {
        super.page = value;
      });
    }
  }

  final _$fetchPageAsyncAction =
      AsyncAction('_FirestoreCollectionPod.fetchPage');

  @override
  Future<void> fetchPage(int page) {
    return _$fetchPageAsyncAction.run(() => super.fetchPage(page));
  }

  final _$_paginateAsyncAction =
      AsyncAction('_FirestoreCollectionPod._paginate');

  @override
  Future<void> _paginate(int page) {
    return _$_paginateAsyncAction.run(() => super._paginate(page));
  }

  final _$_handleQuerySubscriptionAsyncAction =
      AsyncAction('_FirestoreCollectionPod._handleQuerySubscription');

  @override
  Future<void> _handleQuerySubscription(QuerySnapshot<Object?> snapshot) {
    return _$_handleQuerySubscriptionAsyncAction
        .run(() => super._handleQuerySubscription(snapshot));
  }

  final _$_FirestoreCollectionPodActionController =
      ActionController(name: '_FirestoreCollectionPod');

  @override
  void _checkStatus() {
    final _$actionInfo = _$_FirestoreCollectionPodActionController.startAction(
        name: '_FirestoreCollectionPod._checkStatus');
    try {
      return super._checkStatus();
    } finally {
      _$_FirestoreCollectionPodActionController.endAction(_$actionInfo);
    }
  }

  @override
  void movePendingItemsToSubscribedItems() {
    final _$actionInfo = _$_FirestoreCollectionPodActionController.startAction(
        name: '_FirestoreCollectionPod.movePendingItemsToSubscribedItems');
    try {
      return super.movePendingItemsToSubscribedItems();
    } finally {
      _$_FirestoreCollectionPodActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
paginated: ${paginated},
subscribed: ${subscribed},
pending: ${pending},
status: ${status},
ended: ${ended},
page: ${page}
    ''';
  }
}
