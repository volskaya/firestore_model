import 'dart:async';
import 'dart:collection';

import 'package:firestore_model/src/firebase_model.dart';
import 'package:firestore_model/src/firestore_model.dart';
import 'package:flutter/foundation.dart';
import 'package:log/log.dart';
import 'package:meta/meta.dart';

/// Reference counting for my firestore models, to prevent redundant
/// subscriptions and fetches
///
/// Example in [MyUser], don't forget to [ReferenceModel.releaseRef]
mixin ReferencedModel {
  static final _log = Log.named('ReferencedModel');
  static final _references = HashMap<String, int>();
  static final _cache = HashMap<String, _Memoizer<FirebaseModel>>();

  /// Print the [_references] counters.
  static void printReferences() {
    if (_references.isEmpty) print('No active references');
    final entries = _references.entries.toList(growable: false)..sort((a, b) => a.key.compareTo(b.key));
    for (final entry in entries) {
      final path = entry.key;
      final references = entry.value;
      final subscriptions = _cache[entry.key]?.item?.subscribers ?? 0;
      print('${references.toString().padLeft(3, ".")} - $path, (${subscriptions}s)');
    }
  }

  static Future<T> _get<T extends FirebaseModel<T>>(FirebaseModelType type, String path) async {
    final model = FirebaseModel.build<T>(type, path);

    // Until now, the model only has a reference, which it needs to fetch updates.
    // Await a single document update here and return the model.
    await model.update();

    assert(model.id != null);
    assert(model.path != null);

    return model;
  }

  /// Returns a synchronously cached, referenced model, and increments
  /// its reference counter.
  static T getRef<T extends FirebaseModel<T>>(String path) {
    if (_cache[path]?.isCompleted == true) {
      assert(_references[path] > 0);
      _references[path] += 1;
      return _cache[path].item as T;
    }

    return null;
  }

  /// Check if a reference has a completed memoizer, without altering
  /// the reference counter.
  static bool isRefCompleted(String path) => _cache[path]?.isCompleted == true;

  /// Returns true, if [_cache] contains [reference].
  static bool isReferenced(String path) => _cache.containsKey(path);

  /// Reference the object in [ReferencedModel] cache.
  ///
  /// After the object is used, its needs to be disposed.
  static void addRef<T extends FirebaseModel<T>>({
    @required String path,
    @required T object,
  }) {
    assert(!_cache.containsKey(path));
    assert(object != null);

    // Set path and increment references counter
    _cache[path] = _Memoizer<T>.of(object);
    _references[path] = (_references[path] ?? 0) + 1;

    _log.v('Referenced ${T.toString()} - $path, '
        'count - ${_references[path]}');
  }

  /// Memoized version of `reference`, which will return [T], if it
  /// already has a reference, else get the object from `newObject`
  /// and set it as main reference.
  @protected
  static Future<T> referenceWithSnapshot<T extends FirebaseModel<T>>(
    FirebaseModelType type,
    String path,
    T Function() newObject,
  ) async {
    assert(path.isNotEmpty);
    final hasReference = _cache.containsKey(path);

    // When the object has reference, return that, instead of creating
    // a new one.
    final object = hasReference ? await ReferencedModel.reference<T>(type, path) : newObject();
    assert(object != null);

    // Object was not referenced, so manually reference the one
    // returned from `serializer`.
    if (!hasReference && object != null) {
      addRef<T>(path: path, object: object);
    } else {
      // If it was referenced, push the new data as an update.
      object.feedData(newObject());
    }

    return object;
  }

  /// If subscribe == true, returns a model created with a subscription.
  /// This removed the redundant read, when normally the document would
  /// be fetched with .get -> .subscribe.
  @protected
  static Future<T> reference<T extends FirebaseModel<T>>(
    FirebaseModelType type,
    String path, {
    bool subscribe = false,
  }) async {
    assert(path.isNotEmpty);
    _references[path] = (_references[path] ?? 0) + 1;

    if (_cache[path]?.item != null) {
      final object = _cache[path].item;
      if (subscribe) await object.subscribe();
      return object as T;
    } else if (_cache[path]?.future != null) {
      final object = await _cache[path]?.future;
      if (subscribe) await object.subscribe();
      return object as T;
    }

    // Object not memoized yet, creating it here.
    assert(!_cache.containsKey(path));
    _log.v('No object for ${T.toString()} - $path exists, creating a new one…');

    _cache[path] = _Memoizer<T>(
      future: () async {
        if (subscribe) {
          // No snapshot data means an empty model with a reference.
          // This model is subscribed to below, which will await first
          // snapshot data, unless the model already has them.
          final item = FirebaseModel.build<T>(type, path);

          // Await first snapshot, to ensure model correctly handles `exists`.
          await item.subscribe();
          assert(item.id != null);
          assert(item.path != null);

          return item;
        } else {
          return _get<T>(type, path);
        }
      },
    );

    _log.v('Referenced ${T.toString()} - $path ($type), '
        'count - ${_references[path]}');

    return _cache[path].future as Future<T>;
  }

  /// Intended to be called from [FirestoreModel.dispose].
  @protected
  void releaseRef({
    @required covariant FirebaseModel model,
    @required VoidCallback onInvalidated,
    VoidCallback onDecremented,
  }) {
    assert(model.path.isNotEmpty);
    assert(onInvalidated != null);
    assert(_references[model.path] != null, '${model.path} reference released without it being referenced');

    _references[model.path] = (_references[model.path] ?? 1) - 1;

    _log.v(
      'Unreferenced ${model.runtimeType.toString()}'
      ' - ${model?.id}, '
      'remaining - ${_references[model.path] ?? 0}',
    );

    // Make sure to remove any negative counters
    if (_references[model.path] <= 0) {
      _log.v(
        'No more referenced remaining for ${model.runtimeType.toString()} - '
        '${model.id}, invalidating…',
      );

      _references.remove(model.path);
      if (_cache.containsKey(model.path)) {
        try {
          _cache.remove(model.path).invalidate();
          assert(!_cache.containsKey(model.path));
        } finally {
          onInvalidated();
        }
      }
    } else {
      assert(_cache.containsKey(model.path));
      onDecremented?.call();
    }
  }
}

class _Memoizer<T> {
  _Memoizer({
    @required Future<T> Function() future,
  }) {
    _resolveFuture(future);
  }

  _Memoizer.of(this.item);

  Future _resolveFuture(Future<T> Function() future) async {
    assert(!_invalidated);

    try {
      final resolvedItem = await future();
      if (_invalidated) return;
      item = resolvedItem;
      _completer.complete(resolvedItem);
    } catch (e) {
      _completer.completeError(e);
    }
  }

  Completer<T> _completer = Completer<T>();
  bool _invalidated = false;
  T item;

  Future<T> get future {
    assert(!_invalidated);
    // assert(item != null, 'Item should have been accessed synchronously');
    return _completer.future;
  }

  bool get isCompleted => _completer.isCompleted || item != null;
  void invalidate() {
    _invalidated = true;
    if (!_completer.isCompleted) {
      _completer.complete(null);
    }

    item = null;
    _completer = null;
  }
}
