import 'dart:async';
import 'dart:developer' as developer;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:firestore_model/src/firestore_model.dart';

typedef FromReferenceCallback<T extends FirestoreModel<T>> = Future<T> Function(
  DocumentReference reference, {
  bool subscribe,
});

/// Asynchronous/Synchronous loader of [FirestoreModel]s.
class FutureItem<D extends FirestoreModel<D>> {
  /// Creates an asynchronous [FutureItem].
  factory FutureItem({
    @required DocumentReference reference,
    @required State state,
    bool subscribe = false,
  }) =>
      FutureItem._(
        item: null,
        future: null,
        reference: reference,
        subscribe: subscribe,
        state: state,
        synchronous: false,
      ).._deferLoad();

  FutureItem._({
    @required this.reference,
    @required this.state,
    @required this.subscribe,
    @required this.item,
    @required this.future,
    @required this.synchronous,
  });

  /// Creates a synchronous [FutureItem] with an already ready [item].
  factory FutureItem.of({
    @required D item,
    @required State state,
    bool subscribe = false,
  }) =>
      FutureItem._(
        item: (() => subscribe ? (item..subscribe()) : item)(),
        future: Future.value(item),
        reference: null,
        subscribe: subscribe,
        state: state,
        synchronous: true,
      );

  /// Whether to subscribe to the fetched model or not.
  final bool subscribe;

  /// State of the widget where this [FutureItem] is held.
  final State state;

  /// True when this [FutureItem] was constructed with an already existing item.
  final bool synchronous;

  /// Firestore reference of this [FutureItem].
  final DocumentReference reference;

  bool _disposed = false;
  bool get _shouldContinue => !_disposed && !synchronous;

  /// Future that will complete when the [FutureItem] is ready and a model is fetched.
  Future<D> future;

  /// An object that extends [FirestoreModel]. Null until the [future] completes,
  /// unless the [FutureItem] was constructed synchronously.
  D item;

  Future<D> _getItem() async {
    assert(item == null);
    assert(_shouldContinue);
    if (!_shouldContinue) return null;

    final fetchedItem = await FirestoreModel.from<D>(reference, subscribe: subscribe);
    developer.log('Fetched future item: ${fetchedItem.reference.path}', name: 'firestore_model');

    if (_shouldContinue) {
      item = fetchedItem;
    } else {
      fetchedItem.dispose(unsubscribe: subscribe);
      return null;
    }

    return fetchedItem;
  }

  static void _defer(State state, VoidCallback callback) {
    if (state.mounted && Scrollable.recommendDeferredLoadingForContext(state.context)) {
      SchedulerBinding.instance.scheduleFrameCallback((_) => _defer(state, callback));
    } else {
      callback();
    }
  }

  void _deferLoad() {
    final completer = Completer<D>();
    _defer(state, () async => completer.complete(await _getItem()));
    future = completer.future;
  }

  /// Dispose the [FirestoreModel] and unsubscribe, if [subscribe] is true.
  void dispose() {
    assert(!_disposed, 'Disposing the same [FutureItem] twice might indicate a mistake in code');
    _disposed = true;
    item?.dispose(unsubscribe: subscribe);
  }
}
