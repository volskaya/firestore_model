// ignore_for_file:sort_unnamed_constructors_first

import 'dart:async';
import 'dart:developer' as developer;

import 'package:firestore_model/src/firebase_model.dart';
import 'package:flutter/material.dart';
import 'package:firestore_model/src/firestore_model.dart';
import 'package:flutter/scheduler.dart';
import 'package:loader_coordinator/loader_coordinator.dart';

/// Allows scheduling a future with [SchedulerBinding.instance.scheduleTask].
Future<T> scheduleFuture<T>(FutureOr<T> Function() callback, [Priority priority = Priority.touch]) {
  final completer = Completer<T>();
  final stopwatch = Stopwatch()..start();
  SchedulerBinding.instance.scheduleTask(
    () async {
      stopwatch.stop();
      print('Scheduled firebase model in ${stopwatch.elapsedMilliseconds}ms');

      try {
        final value = await callback();
        completer.complete(value);
      } catch (e) {
        completer.completeError(e);
      }
    },
    priority,
  );
  return completer.future;
}

/// Asynchronous/Synchronous loader of [FirestoreModel]s.
class FutureItem<D extends FirebaseModel<D>> {
  FutureItem._({
    @required this.path,
    @required this.subscribe,
    @required this.item,
    @required this.future,
    @required this.synchronous,
    @required this.type,
    this.state,
  });

  /// Creates an asynchronous [FutureItem].
  factory FutureItem({
    @required String path,
    @required FirebaseModelType type,
    bool subscribe = false,
    State state,
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
    @required FirebaseModelType type,
    bool subscribe = false,
    State state,
  }) =>
      FutureItem._(
        item: (() => subscribe ? (item..subscribe()) : item)(),
        future: Future.value(item),
        path: item.path,
        subscribe: subscribe,
        state: state,
        synchronous: true,
        type: type,
      );

  /// Firebase model type.
  final FirebaseModelType type;

  /// Whether to subscribe to the fetched model or not.
  final bool subscribe;

  /// Optional state of the widget where this [FutureItem] is held.
  ///
  /// When this is defined, the [FutureItem] will defer the fetch of the model
  /// till the nearest scroll view has slowed down.
  final State state;

  /// True when this [FutureItem] was constructed with an already existing item.
  final bool synchronous;

  /// Firebase path of this [FutureItem].
  final String path;

  /// Future that will complete when the [FutureItem] is ready and a model is fetched.
  Future<D> future;

  /// An object that extends [FirestoreModel]. Null until the [future] completes,
  /// unless the [FutureItem] was constructed synchronously.
  D item;

  bool _disposed = false;

  Future<D> _getItem() async {
    assert(item == null);
    assert(!synchronous);
    assert(!_disposed);
    if (_disposed || synchronous) return null;

    final loader = LoaderCoordinator.instance.touch();

    try {
      // Item is not in the cache so [FirebaseModel.from] is expected to fetch the model from firebase.
      // It's okay to delay/schedule the call here.
      final fetchedItem = await FirebaseModel.from<D>(type, path, subscribe: subscribe);
      // final fetchedItem = await scheduleFuture<D>(() => FirebaseModel.from<D>(type, path, subscribe: subscribe));
      developer.log('Fetched future item: ${fetchedItem.path} ($type)', name: 'firestore_model');

      if (!_disposed) {
        item = fetchedItem;
      } else {
        fetchedItem.dispose(unsubscribe: subscribe);
        return null;
      }

      return fetchedItem;
    } finally {
      loader.dispose();
    }
  }

  static void _defer(State state, VoidCallback callback) {
    if (state.mounted && Scrollable.recommendDeferredLoadingForContext(state.context)) {
      SchedulerBinding.instance.scheduleFrameCallback((_) => _defer(state, callback));
    } else {
      callback();
    }
  }

  void _deferLoad() {
    if (state != null) {
      assert(false);
      final completer = Completer<D>();
      _defer(state, () async => completer.complete(await _getItem()));
      future = completer.future;
    } else {
      future = _getItem();
    }
  }

  /// Dispose the [FirestoreModel] and unsubscribe, if [subscribe] is true.
  void dispose() {
    final shouldDispose = !_disposed;
    _disposed = true;
    if (shouldDispose) {
      item?.dispose(unsubscribe: subscribe);
      item = null;
      future = null;
    }
    assert(shouldDispose, 'Disposing the same [FutureItem] twice might indicate a mistake in code. Path: $path');
  }
}
