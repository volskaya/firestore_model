import 'dart:async';
import 'dart:collection';

import 'package:firestore_model/src/firebase_model.dart';
import 'package:firestore_model/src/firestore_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:log/log.dart';
import 'package:meta/meta.dart';
import 'package:utils/utils.dart';

/// Reference counting for my firestore models, to prevent redundant
/// subscriptions and fetches
///
/// Example in [MyUser], don't forget to [ReferenceModel.releaseRef]
mixin ReferencedModel {
  static final _log = Log.named('ReferencedModel');

  /// Hash map of reference counters keyed by the document paths.
  @visibleForTesting static final references = HashMap<String, int>();

  /// Hash map of object memoizers keyed by the document paths.
  @visibleForTesting static final cache = HashMap<String, Memoizer<FirebaseModel>>();

  /// Print the [references] counters.
  static void printReferences() {
    if (references.isEmpty) print('No active references');
    final entries = references.entries.toList(growable: false)..sort((a, b) => a.key.compareTo(b.key));
    for (final entry in entries) {
      final path = entry.key;
      final references = entry.value;
      final subscriptions = cache[entry.key]?.value?.subscribers ?? 0;
      print('${references.toString().padLeft(3, ".")} - $path, (${subscriptions}s)');
    }

    assert(entries.length == cache.entries.length);
  }

  static Future<T> _get<T extends FirebaseModel<T>>(FirebaseModelType type, String path) async {
    final model = FirebaseModel.build<T>(type, path);

    // Until now, the model only has a reference, which it needs to fetch updates.
    // Await a single document update here and return the model.
    await model.update();
    return model;
  }

  /// Returns a synchronously cached, referenced model, and increments
  /// its reference counter.
  static T? getRef<T extends FirebaseModel<T>>(String path) {
    if (cache[path]?.isCompleted == true) {
      assert((references[path] ?? 0) > 0);
      assert(isReferenced(path));
      references[path] = (references[path] ?? 0) + 1;
      return cache[path]!.value as T;
    }

    return null;
  }

  /// Check if a reference has a completed memoizer, without altering
  /// the reference counter.
  static bool isRefCompleted(String path) => cache[path]?.isCompleted == true;

  /// Returns true, if [cache] contains [reference].
  static bool isReferenced(String path) => cache.containsKey(path);

  /// Returns the reference count of [path].
  static int getReferenceCount(String path) => references[path] ?? 0;

  /// Reference the object in [ReferencedModel] cache. Use this only when the the object, under this path,
  /// is not cached yet.
  ///
  /// After the object is used, its needs to be disposed.
  static T addRef<T extends FirebaseModel<T>>({
    required String path,
    required T object,
  }) {
    assert(!cache.containsKey(path));

    // Set path and increment references counter.
    cache[path] = Memoizer<T>.of(object);
    references[path] = (references[path] ?? 0) + 1;
    // _log.v('Referenced ${T.toString()} - $path, count - ${references[path]}');

    return object;
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
    final hasReference = ReferencedModel.isReferenced(path);

    if (hasReference) {
      final object = await ReferencedModel.reference<T>(type, path);
      SchedulerBinding.instance!.scheduleTask(() => object.feedData(newObject()), Priority.touch);

      return object;
    } else {
      assert(!cache.containsKey(path));
      final memoizer = Memoizer<T>(future: () => SchedulerBinding.instance!.scheduleTask(newObject, Priority.touch));

      cache[path] = memoizer;
      references[path] = (references[path] ?? 0) + 1;
      // _log.v('Referenced ${T.toString()} - $path, count - ${references[path]}');

      return (await memoizer.future)!;
    }

    // // When the object has reference, return that, instead of creating
    // // a new one.
    // final object = hasReference ? await ReferencedModel.reference<T>(type, path) : newObject();

    // // Object was not referenced, so manually reference the one returned from `serializer`.
    // if (!hasReference) {
    //   addRef<T>(path: path, object: object);
    // } else {
    //   object.feedData(newObject()); // If it was referenced, push the new data as an update.
    // }

    // return object;
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
    references[path] = (references[path] ?? 0) + 1;

    if (cache[path]?.value != null) {
      final object = cache[path]!.value!;
      if (subscribe) await object.subscribe();
      return object as T;
    } else if (cache[path]?.future != null) {
      final object = await cache[path]?.future;
      if (subscribe) await object?.subscribe();
      return object as T;
    }

    // Object not memoized yet, creating it here.
    assert(!cache.containsKey(path));
    // _log.v('No object for ${T.toString()} - $path exists, creating a new one…');

    cache[path] = Memoizer<T>(
      future: () async {
        if (subscribe) {
          // No snapshot data means an empty model with a reference.
          // This model is subscribed to below, which will await first
          // snapshot data, unless the model already has them.
          final item = FirebaseModel.build<T>(type, path);

          // Await first snapshot, to ensure model correctly handles `exists`.
          await item.subscribe();
          return item;
        } else {
          return _get<T>(type, path);
        }
      },
    );

    // _log.v('Referenced ${T.toString()} - $path ($type), '
    //     'count - ${references[path]}');

    return cache[path]!.future as Future<T>;
  }

  /// Disposes every model found in [cache].
  @visibleForTesting
  static Future disposeEverything() async {
    while (cache.isNotEmpty) (await cache.values.last.future)?.dispose();
  }

  /// Intended to be called from [FirestoreModel.dispose].
  @protected
  void releaseRef({
    required covariant FirebaseModel model,
    required VoidCallback onInvalidated,
    VoidCallback? onDecremented,
    bool forceInvalidate = false,
  }) {
    assert(model.path.isNotEmpty);
    assert(references[model.path] != null, '${model.path} reference released without it being referenced');

    references[model.path] = (references[model.path] ?? 1) - 1;

    // _log.v(
    //   'Unreferenced ${model.runtimeType.toString()}'
    //   ' - ${model.id}, '
    //   'remaining - ${references[model.path] ?? 0}',
    // );

    // Make sure to remove any negative counters
    if (references[model.path] != null && references[model.path]! <= 0) {
      // _log.v(
      //   'No more referenced remaining for ${model.runtimeType.toString()} - '
      //   '${model.id}, invalidating…',
      // );

      references.remove(model.path);
      if (cache.containsKey(model.path)) {
        try {
          cache.remove(model.path)!.invalidate();
          assert(!cache.containsKey(model.path));
        } finally {
          onInvalidated();
        }
      }
    } else {
      assert(cache.containsKey(model.path));
      onDecremented?.call();
    }
  }
}
