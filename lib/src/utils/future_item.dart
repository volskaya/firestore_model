// ignore_for_file:sort_unnamed_constructors_first

import 'dart:async';
import 'dart:developer' as developer;

import 'package:firestore_model/src/firebase_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:firestore_model/src/firestore_model.dart';

/// Asynchronous/Synchronous loader of [FirestoreModel]s.
class FutureItem<D extends FirebaseModel<D>> {
  FutureItem._({
    @required this.path,
    @required this.state,
    @required this.subscribe,
    @required this.item,
    @required this.future,
    @required this.synchronous,
    @required this.type,
  });

  /// Creates an asynchronous [FutureItem].
  factory FutureItem({
    @required String path,
    @required State state,
    @required FirebaseModelType type,
    bool subscribe = false,
  }) =>
      FutureItem._(
        item: null,
        future: null,
        path: path,
        subscribe: subscribe,
        state: state,
        synchronous: false,
        type: type,
      ).._deferLoad();

  /// Creates a synchronous [FutureItem] with an already ready [item].
  factory FutureItem.of({
    @required D item,
    @required State state,
    @required FirebaseModelType type,
    bool subscribe = false,
  }) =>
      FutureItem._(
        item: (() => subscribe ? (item..subscribe()) : item)(),
        future: Future.value(item),
        path: null,
        subscribe: subscribe,
        state: state,
        synchronous: true,
        type: type,
      );

  /// Firebase model type.
  final FirebaseModelType type;

  /// Whether to subscribe to the fetched model or not.
  final bool subscribe;

  /// State of the widget where this [FutureItem] is held.
  final State state;

  /// True when this [FutureItem] was constructed with an already existing item.
  final bool synchronous;

  /// Firebase path of this [FutureItem].
  final String path;

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

    final fetchedItem = await FirebaseModel.from<D>(type, path, subscribe: subscribe);
    developer.log('Fetched future item: ${fetchedItem.path} ($type)', name: 'firestore_model');

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
    final shouldDispose = !_disposed;
    _disposed = true;
    if (shouldDispose) item?.dispose(unsubscribe: subscribe);
    assert(shouldDispose, 'Disposing the same [FutureItem] twice might indicate a mistake in code. Path: $path');
  }
}
