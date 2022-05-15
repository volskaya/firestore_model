// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firestore_collection_pod.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FirestoreCollectionPod<T extends FirestoreModel<T>, D>
    on _FirestoreCollectionPod<T, D>, Store {
  late final _$paginatedAtom =
      Atom(name: '_FirestoreCollectionPod.paginated', context: context);

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

  late final _$subscribedAtom =
      Atom(name: '_FirestoreCollectionPod.subscribed', context: context);

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

  late final _$pendingAtom =
      Atom(name: '_FirestoreCollectionPod.pending', context: context);

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

  late final _$statusAtom =
      Atom(name: '_FirestoreCollectionPod.status', context: context);

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

  late final _$pageStatusAtom =
      Atom(name: '_FirestoreCollectionPod.pageStatus', context: context);

  @override
  FirestoreCollectionPageStatus get pageStatus {
    _$pageStatusAtom.reportRead();
    return super.pageStatus;
  }

  @override
  set pageStatus(FirestoreCollectionPageStatus value) {
    if (super.pageStatus != value) {
      _$pageStatusAtom.reportWrite(value, super.pageStatus, () {
        super.pageStatus = value;
      });
    }
  }

  late final _$endedAtom =
      Atom(name: '_FirestoreCollectionPod.ended', context: context);

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

  late final _$pageAtom =
      Atom(name: '_FirestoreCollectionPod.page', context: context);

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

  late final _$fetchPageAsyncAction =
      AsyncAction('_FirestoreCollectionPod.fetchPage', context: context);

  @override
  Future<void> fetchPage(int page) {
    return _$fetchPageAsyncAction.run(() => super.fetchPage(page));
  }

  late final _$_paginateAsyncAction =
      AsyncAction('_FirestoreCollectionPod._paginate', context: context);

  @override
  Future<void> _paginate(int targetPage) {
    return _$_paginateAsyncAction.run(() => super._paginate(targetPage));
  }

  late final _$_handleQuerySubscriptionAsyncAction = AsyncAction(
      '_FirestoreCollectionPod._handleQuerySubscription',
      context: context);

  @override
  Future<void> _handleQuerySubscription(QuerySnapshot<Object?> snapshot) {
    return _$_handleQuerySubscriptionAsyncAction
        .run(() => super._handleQuerySubscription(snapshot));
  }

  late final _$_FirestoreCollectionPodActionController =
      ActionController(name: '_FirestoreCollectionPod', context: context);

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
pageStatus: ${pageStatus},
ended: ${ended},
page: ${page}
    ''';
  }
}
