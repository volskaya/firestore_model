import 'dart:async';

import 'package:firestore_model/src/firebase_model.dart';
import 'package:firestore_model/src/firestore_model.dart';
import 'package:firestore_model/src/utils/disposable_hook_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:loader_coordinator/loader_coordinator.dart';
import 'package:log/log.dart';

/// Allows scheduling a future with [SchedulerBinding.instance.scheduleTask].
Future<T> scheduleFuture<T>(FutureOr<T> Function() callback, [Priority priority = Priority.touch]) {
  final completer = Completer<T>();

  SchedulerBinding.instance.scheduleTask(
    () async {
      try {
        final value = await callback();
        completer.complete(value);
      } catch (e, t) {
        completer.completeError(e, t);
      }
    },
    priority,
  );

  return completer.future;
}

/// Asynchronous / Synchronous loader of [FirestoreModel]s.
class FutureItem<D extends FirebaseModel<D>> {
  /// Creates an asynchronous [FutureItem].
  factory FutureItem({
    required String path,
    required FirebaseModelType type,
    bool subscribe = false,
    DisposableHookContext? scrollAwareContext,
  }) =>
      FutureItem._(
        item: null,
        path: path,
        subscribe: subscribe,
        scrollAwareContext: scrollAwareContext,
        synchronous: false,
        type: type,
      ).._deferLoad();

  /// Creates a synchronous [FutureItem] with an already ready [item].
  factory FutureItem.of({
    required D item,
    required FirebaseModelType type,
    bool subscribe = false,
    DisposableHookContext? scrollAwareContext,
  }) =>
      FutureItem._(
        item: (() => subscribe ? (item..subscribe()) : item)(),
        path: item.path,
        subscribe: subscribe,
        scrollAwareContext: scrollAwareContext,
        synchronous: true,
        type: type,
      );

  FutureItem._({
    required this.path,
    required this.subscribe,
    required this.item,
    required this.synchronous,
    required this.type,
    this.scrollAwareContext,
  });

  /// Firebase model type.
  final FirebaseModelType type;

  /// Whether to subscribe to the fetched model or not.
  final bool subscribe;

  /// Optional state of the widget where this [FutureItem] is held.
  ///
  /// When this is defined, the [FutureItem] will defer the fetch of the model
  /// till the nearest scroll view has slowed down.
  final DisposableHookContext? scrollAwareContext;

  /// True when this [FutureItem] was constructed with an already existing item.
  final bool synchronous;

  /// Firebase path of this [FutureItem].
  final String path;

  /// Future that will complete when the [FutureItem] is ready and a model is fetched.
  Future<D?>? get future {
    if (_future != null) return _future;

    // Lazily created [Future] for synchronous item, if something ever uses it.
    if (item != null) {
      assert(synchronous);
      _future = Future.value(item);
    }

    return _future;
  }

  /// An object that extends [FirestoreModel]. Null until the [future] completes,
  /// unless the [FutureItem] was constructed synchronously.
  D? item;

  static final _log = Log.named('FutureItem');
  bool _disposed = false;
  Future<D?>? _future;

  Future<D?> _getItem() async {
    assert(item == null);
    assert(!synchronous);
    assert(!_disposed);
    if (_disposed || synchronous) return null;

    final loader = LoaderCoordinator.instance.touch();

    try {
      // Item is not in the cache so [FirebaseModel.from] is expected to fetch the model from firebase.
      // It's okay to delay/schedule the call here.
      final fetchedItem = await FirebaseModel.from<D>(type, path, subscribe: subscribe);
      // _log.v('Fetched future item: $path ($type)');

      if (!_disposed) {
        item = fetchedItem;
      } else {
        fetchedItem.dispose(unsubscribe: subscribe);
        return null;
      }

      return fetchedItem;
    } catch (e, t) {
      _log.e('Failed to fetch the future item $path ($type)', e, t);
      rethrow;
    } finally {
      loader.dispose();
    }
  }

  static void _defer(DisposableHookContext scrollAware, VoidCallback callback) {
    if (scrollAware.context != null && Scrollable.recommendDeferredLoadingForContext(scrollAware.context!)) {
      SchedulerBinding.instance.scheduleFrameCallback((_) => _defer(scrollAware, callback));
    } else {
      callback();
    }
  }

  void _deferLoad() {
    if (scrollAwareContext?.context != null) {
      assert(false);
      final completer = Completer<D>();
      _defer(scrollAwareContext!, () async {
        try {
          completer.complete(await _getItem());
        } catch (e, t) {
          completer.completeError(e, t);
        }
      });
      _future = completer.future;
    } else {
      _future = _getItem();
    }
  }

  /// Dispose the [FirestoreModel] and unsubscribe, if [subscribe] is true.
  void dispose() {
    final shouldDispose = !_disposed;
    _disposed = true;
    if (shouldDispose) {
      item?.dispose(unsubscribe: subscribe);
      item = null;
      _future = null;
    }
    assert(shouldDispose, 'Disposing the same [FutureItem] twice might indicate a mistake in code. Path: $path');
  }
}
