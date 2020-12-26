import 'dart:developer' as developer;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firestore_model/src/firebase_model.dart';
import 'package:firestore_model/src/firestore_model.dart';
import 'package:firestore_model/src/realtime_model.dart';
import 'package:firestore_model/src/referenced_model.dart';
import 'package:firestore_model/src/utils/future_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:refresh_storage/refresh_storage.dart';

/// Page storage of [FirebaseModelHook].
class _FirebaseModelHookBucket<T extends FirebaseModel<T>> {
  /// The memoizer of [FirebaseModel]s.
  FutureItem<T> object;
}

/// Asynchronous hooks of reference counted [FirebaseModel]s.
///
/// If the firestore reference is already fetched, the widget builds
/// synchronously.
class FirebaseModelHook<T extends FirebaseModel<T>> extends Hook<T> {
  /// Creates Firestore version of [FirebaseModelHook].
  ///
  /// A generic type, that extends [FirestoreModel], must be provided!
  FirebaseModelHook.firestore({
    /// Firestore reference to build.
    @required DocumentReference reference,
    @required this.bucket,
    this.subscribe = false,
    this.placeholder,
    this.storageContext,
    this.update = false,
    this.state,
  })  : _type = FirebaseModelType.firestore,
        _path = reference?.path;

  /// Creates Realtime Database version of [FirebaseModelHook].
  ///
  /// A generic type, that extends [RealtimeModel], must be provided!
  FirebaseModelHook.realtime({
    /// Realtime Database reference to build.
    @required DatabaseReference reference,
    @required this.bucket,
    this.subscribe = false,
    this.placeholder,
    this.storageContext,
    this.update = false,
    this.state,
  })  : _type = FirebaseModelType.realtime,
        _path = reference?.path;

  final FirebaseModelType _type;
  final String _path;

  /// [RefreshStorage] bucket identifier of this widgets storage.
  ///
  /// If null, [RefreshStorage] won't be used.
  final String bucket;

  /// Subscribe to realtime changes.
  final bool subscribe;

  /// Optional value to pass to [builder], while the [reference] is not fetched.
  final T placeholder;

  /// Allow overriding context of [MyApp.storage] to support building
  /// within an overlay.
  final BuildContext storageContext;

  /// Request the model to update, when this hook is initialized.
  final bool update;

  /// Optional state of the widget under which the [FutureItem]s are held.
  ///
  /// When this is defined, the [FutureItem]s will defer their fetch of the model
  /// till the nearest scroll view has slowed down.
  final State state;

  /// Creates Firestore version of [FirebaseModelHook].
  ///
  /// A generic type, that extends [FirestoreModel], must be provided!
  static T useFirestore<T extends FirestoreModel<T>>(
    DocumentReference reference, {
    String bucket,
    bool subscribe = false,
    T placeholder,
    BuildContext storageContext,
    bool update = false,
    State state,
  }) =>
      use<T>(
        FirebaseModelHook<T>.firestore(
          reference: reference,
          bucket: bucket ?? reference?.path,
          subscribe: subscribe,
          placeholder: placeholder,
          storageContext: storageContext,
          update: update,
          state: state,
        ),
      );

  /// Creates Realtime Database version of [FirebaseModelHook].
  ///
  /// A generic type, that extends [RealtimeModel], must be provided!
  static T useRealtime<T extends RealtimeModel<T>>(
    DatabaseReference reference, {
    String bucket,
    bool subscribe = false,
    T placeholder,
    BuildContext storageContext,
    bool update = false,
    State state,
  }) =>
      use<T>(
        FirebaseModelHook<T>.realtime(
          reference: reference,
          bucket: bucket ?? reference?.path,
          subscribe: subscribe,
          placeholder: placeholder,
          storageContext: storageContext,
          update: update,
          state: state,
        ),
      );

  @override
  _FirebaseModelHookState<T> createState() => _FirebaseModelHookState<T>();
}

class _FirebaseModelHookState<T extends FirebaseModel<T>> extends HookState<T, FirebaseModelHook<T>> {
  _FirebaseModelHookBucket<T> _storage;
  bool _mounted = false;
  bool _usingPageStorage = false;
  String _bucket;

  Future _scheduleRebuild(FutureItem object) async {
    assert(!object.synchronous);

    if (object.item != null || object.synchronous) return;
    await object.future;
    if (_storage?.object?.path == object.path) markMayNeedRebuild();
  }

  void _updateObject() {
    assert(hook._path != null);

    // Attempt to get cached object synchronously. If the object is not null,
    // build the widget without [FutureBuilder]
    //
    // This will increment the reference counter and instantiate the future item
    // as a "synchronous item". When the future item is disposed, this reference
    // will dispose as well.
    final object = ReferencedModel.getRef<T>(hook._path);

    if (object != null) {
      developer.log('Instantiated with a synchronous ${hook._path} (${hook._type})', name: 'firestore_model');
      _storage.object = FutureItem<T>.of(
        type: hook._type,
        item: object,
        subscribe: hook.subscribe,
        state: hook.state,
      );

      // If an empty synchronous item is instantiated with subscription off,
      // it may never get data, so always request 1 update.
      if (hook.update && !hook.subscribe) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (_mounted) _storage.object.item?.update();
        });
      }
    } else {
      developer.log('Instantiating asynchronously ${hook._path} (${hook._type})', name: 'firestore_model');
      _storage.object = FutureItem<T>(
        type: hook._type,
        path: hook._path,
        subscribe: hook.subscribe,
        state: hook.state,
      );
      _scheduleRebuild(_storage.object);
    }
  }

  static RefreshStorageState _getStorage(BuildContext context) {
    try {
      return RefreshStorage.of(context);
    } catch (_) {
      return null; // Built in an overlay?
    }
  }

  @override
  void initHook() {
    super.initHook();
    final storage = _FirebaseModelHookState._getStorage(hook.storageContext ?? context);
    _bucket = hook.bucket; // Bucket is not allowed to change.
    _mounted = true;
    _usingPageStorage = storage != null;
    _storage = storage != null
        ? RefreshStorage.write(
            storage: storage,
            context: hook.storageContext ?? context,
            identifier: _bucket,
            builder: () => _FirebaseModelHookBucket<T>(),
            dispose: (storage) => storage.object?.dispose(),
          )
        : _FirebaseModelHookBucket<T>();

    if (hook._path != null) {
      if (_storage.object == null || _storage.object.path != hook._path) {
        developer.log('Bucket item null, creating: ${hook._path} (${hook._type})', name: 'firestore_model');

        if (_storage.object != null) {
          // Path changed, dispose the previous item.
          _storage.object?.dispose();
          _storage.object = null;
        }

        _updateObject();
      } else {
        developer.log('Reusing bucket storage: ${hook._path} (${hook._type})', name: 'firestore_model');
      }
    }
  }

  @override
  void didUpdateHook(FirebaseModelHook<T> oldHook) {
    assert(oldHook.subscribe == hook.subscribe);
    assert(oldHook.bucket == hook.bucket);
    assert(oldHook._type == hook._type);

    if (oldHook._path != hook._path) {
      developer.log('${oldHook._path} changed to ${hook._path}', name: 'firestore_model');
      _storage.object?.dispose();
      _storage.object = null;
      if (hook._path != null) _updateObject();
    }

    super.didUpdateHook(oldHook);
  }

  @override
  void dispose() {
    _mounted = false;
    if (!_usingPageStorage) _storage?.object?.dispose();
    super.dispose();
  }

  @override
  T build(BuildContext context) => _storage?.object?.item;
}
