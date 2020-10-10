import 'dart:async';
import 'dart:collection';
import 'dart:developer' as developer;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_model/src/firestore_model.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

/// Reference counting for my firestore models, to prevent redundant
/// subscriptions and fetches
///
/// Example in [MyUser], don't forget to [ReferenceModel.releaseRef]
mixin ReferencedModel {
  static final _references = HashMap<DocumentReference, int>();
  static final _cache = HashMap<DocumentReference, _Memoizer<FirestoreModel>>();

  static Future<T> _get<T extends FirestoreModel<T>>(DocumentReference reference) async {
    final model = FirestoreModel.build<T>(reference);

    // Until now, the model only has a reference, which it needs to fetch updates.
    // Await a single document update here and return the model.
    await model.update();

    assert(model.id != null);
    assert(model.reference != null);
    assert(model.id == model.reference.id);

    return model;
  }

  /// Returns a synchronously cached, referenced model, and increments
  /// its reference counter
  static T getRef<T extends FirestoreModel<T>>(DocumentReference reference) {
    if (_cache[reference]?.isCompleted == true) {
      assert(_references[reference] > 0);
      _references[reference] += 1;
      return _cache[reference].item as T;
    }

    return null;
  }

  /// Check if a reference has a completed memoizer, without altering
  /// the reference counter.
  static bool isRefCompleted(DocumentReference reference) => _cache[reference]?.isCompleted == true;

  /// Returns true, if [_cache] contains [reference].
  static bool isReferenced(DocumentReference reference) => _cache.containsKey(reference);

  /// Reference the object in [ReferencedModel] cache.
  ///
  /// After the object is used, its needs to be disposed.
  static void addRef<T extends FirestoreModel<T>>({
    @required DocumentReference reference,
    @required T object,
  }) {
    assert(!_cache.containsKey(reference));
    assert(object != null);

    // Set reference and increment references counter
    _cache[reference] = _Memoizer<T>.of(object);
    _references[reference] = (_references[reference] ?? 0) + 1;

    developer.log(
      'Referenced ${T.toString()} - ${reference?.id}, '
      'count - ${_references[reference]}',
      name: 'firestore_model',
    );
  }

  /// Memoized version of `reference`, which will return [T], if it
  /// already has a reference, else get the object from `newObject`
  /// and set it as main reference
  @protected
  static Future<T> referenceWithSnapshot<T extends FirestoreModel<T>>({
    @required DocumentReference reference,
    @required T Function() newObject,
  }) async {
    assert(reference.id.isNotEmpty);
    final hasReference = _cache.containsKey(reference);

    // When the object has reference, return that, instead of creating
    // a new one
    final object = hasReference ? await ReferencedModel.reference<T>(reference: reference) : newObject();
    assert(object != null);

    // Object was not referenced, so manually reference the one
    // returned from `serializer`
    if (!hasReference && object != null) {
      addRef<T>(reference: reference, object: object);
    } else {
      // If it was referenced, push the new data as an update
      object.feedData(newObject());
    }

    return object;
  }

  /// If subscribe == true, returns a model created with a subscription.
  /// This removed the redundant read, when normally the document would
  /// be fetched with .get -> .subscribe.
  @protected
  static Future<T> reference<T extends FirestoreModel<T>>({
    @required DocumentReference reference,
    bool subscribe = false,
  }) async {
    assert(reference.path.isNotEmpty);
    _references[reference] = (_references[reference] ?? 0) + 1;

    if (_cache[reference]?.item != null) {
      final object = _cache[reference].item;
      if (subscribe) await object.subscribe();
      return object as T;
    } else if (_cache[reference]?.future != null) {
      final object = await _cache[reference]?.future;
      if (subscribe) await object.subscribe();
      return object as T;
    }

    // Object not memoized yet, creating it here
    assert(!_cache.containsKey(reference));
    developer.log(
      'No object for ${T.toString()} - ${reference.id} exists, creating a new one…',
      name: 'firestore_model',
    );

    _cache[reference] = _Memoizer<T>(
      future: () async {
        if (subscribe) {
          // No snapshot data means an empty model with a reference.
          // This model is subscribed to below, which will await first
          // snapshot data, unless the model already has them
          final item = FirestoreModel.build<T>(reference);

          // Await first snapshot, to ensure model correctly handles `exists`.
          await item.subscribe();
          assert(item.id != null);
          assert(item.reference != null);
          assert(item.id == item.reference.id);

          return item;
        } else {
          return _get<T>(reference);
        }
      },
    );

    developer.log(
      'Referenced ${T.toString()} - ${reference.id}, '
      'count - ${_references[reference]}',
      name: 'firestore_model',
    );

    return _cache[reference].future as Future<T>;
  }

  /// Intended to be called from [FirestoreModel.dispose]
  @protected
  void releaseRef({
    @required covariant FirestoreModel model,
    @required VoidCallback onInvalidated,
    VoidCallback onDecremented,
  }) {
    assert(model.reference.path.isNotEmpty);
    assert(onInvalidated != null);

    _references[model.reference] = (_references[model.reference] ?? 0) - 1;
    developer.log(
      'Unreferenced ${model.runtimeType.toString()}'
      ' - ${model?.id}, '
      'remaining - ${_references[model.reference] ?? 0}',
      name: 'firestore_model',
    );

    // Make sure to remove any negative counters
    if (_references[model.reference] <= 0) {
      developer.log(
        'No more referenced remaining for ${model.runtimeType.toString()} - '
        '${model.id}, invalidating…',
        name: 'firestore_model',
      );

      _references.remove(model.reference);
      if (_cache.containsKey(model.reference)) {
        onInvalidated();
        _cache.remove(model.reference).invalidate();
      }
    } else {
      assert(_cache.containsKey(model.reference));
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
