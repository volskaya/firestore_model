import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firestore_model/src/firebase_model.dart';
import 'package:firestore_model/src/firestore_model.dart';
import 'package:firestore_model/src/realtime_model.dart';
import 'package:firestore_model/src/referenced_model.dart';
import 'package:firestore_model/src/utils/disposable_hook_context.dart';
import 'package:firestore_model/src/utils/future_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:refresh_storage/refresh_storage.dart';

/// Page storage of [FirebaseModelHook].
class _FirebaseModelHookBucket<T extends FirebaseModel<T>> extends RefreshStorageItem {
  /// The memoizer of [FirebaseModel]s.
  FutureItem<T>? object;

  @override
  void dispose([dynamic _]) {
    super.dispose(_);
    object?.dispose();
    object = null;
  }
}

/// Asynchronous hooks of reference counted [FirebaseModel]s.
///
/// If the firestore reference is already fetched, the widget builds
/// synchronously.
class FirebaseModelHook<T extends FirebaseModel<T>> extends Hook<T?> {
  /// Creates Firestore version of [FirebaseModelHook].
  ///
  /// A generic type, that extends [FirestoreModel], must be provided!
  FirebaseModelHook.firestore({
    /// Firestore reference to build.
    required DocumentReference? reference,
    required this.bucket,
    this.subscribe = false,
    this.storage,
    this.update = false,
    this.scrollAware = false,
  })  : _type = FirebaseModelType.firestore,
        _path = reference?.path;

  /// Creates Realtime Database version of [FirebaseModelHook].
  ///
  /// A generic type, that extends [RealtimeModel], must be provided!
  FirebaseModelHook.realtime({
    /// Realtime Database reference to build.
    required DatabaseReference? reference,
    required this.bucket,
    this.subscribe = false,
    this.storage,
    this.update = false,
    this.scrollAware = false,
  })  : _type = FirebaseModelType.realtime,
        _path = reference?.path;

  final FirebaseModelType _type;
  final String? _path;

  /// [RefreshStorage] bucket identifier of this widgets storage.
  ///
  /// If null, [RefreshStorage] won't be used.
  final String? bucket;

  /// Subscribe to realtime changes.
  final bool subscribe;

  /// Allow overriding context of [MyApp.storage] to support building
  /// within an overlay.
  final RefreshStoragePod? storage;

  /// Request the model to update, when this hook is initialized.
  final bool update;

  /// When this is toggled, the [FutureItem]s will defer their fetch of the model
  /// till the nearest scroll view has slowed down.
  final bool scrollAware;

  /// Creates Firestore version of [FirebaseModelHook].
  ///
  /// A generic type, that extends [FirestoreModel], must be provided!
  static T? useFirestore<T extends FirestoreModel<T>>(
    DocumentReference? reference, {
    String? bucket,
    bool subscribe = false,
    RefreshStoragePod? storage,
    bool update = false,
    bool scrollAware = false,
  }) =>
      use<T?>(
        FirebaseModelHook<T>.firestore(
          reference: reference,
          bucket: bucket ?? reference?.path,
          subscribe: subscribe,
          storage: storage,
          update: update,
          scrollAware: scrollAware,
        ),
      );

  /// Creates Realtime Database version of [FirebaseModelHook].
  ///
  /// A generic type, that extends [RealtimeModel], must be provided!
  static T? useRealtime<T extends RealtimeModel<T>>(
    DatabaseReference? reference, {
    String? bucket,
    bool subscribe = false,
    RefreshStoragePod? storage,
    bool update = false,
    bool scrollAware = false,
  }) =>
      use<T?>(
        FirebaseModelHook<T>.realtime(
          reference: reference,
          bucket: bucket ?? reference?.path,
          subscribe: subscribe,
          storage: storage,
          update: update,
          scrollAware: scrollAware,
        ),
      );

  @override
  _FirebaseModelHookState<T> createState() => _FirebaseModelHookState<T>();
}

class _FirebaseModelHookState<T extends FirebaseModel<T>> extends HookState<T?, FirebaseModelHook<T>> {
  // static final _log = Log.named('FirebaseModelHook');

  late RefreshStorageEntry<_FirebaseModelHookBucket<T>> _storage;
  late String _bucket; // If `bucket` was not passed, reference path will be used instead.
  bool _mounted = false;
  bool _usingPageStorage = false;
  DisposableHookContext? _disposableContext;

  Future _scheduleRebuild(FutureItem? object) async {
    assert(object?.synchronous != true);

    if (object == null || object.item != null || object.synchronous) return; // Already built.
    await object.future;
    if (_storage.value?.object?.path == object.path) markMayNeedRebuild();
  }

  void _updateObject() {
    assert(hook._path != null);

    // Attempt to get cached object synchronously. If the object is not null,
    // build the widget without [FutureBuilder]
    //
    // This will increment the reference counter and instantiate the future item
    // as a "synchronous item". When the future item is disposed, this reference
    // will dispose as well.
    final object = ReferencedModel.getRef<T>(hook._path!);

    if (object != null) {
      // _log.v('Instantiated with a synchronous ${hook._path} (${hook._type})');
      _storage.value?.object = FutureItem<T>.of(
        type: hook._type,
        item: object,
        subscribe: hook.subscribe,
        scrollAwareContext: _disposableContext,
      );

      // If an empty synchronous item is instantiated with subscription off,
      // it may never get data, so always request 1 update.
      if (hook.update && !hook.subscribe) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (_mounted) _storage.value?.object?.item?.update();
        });
      }
    } else {
      // _log.v('Instantiating asynchronously ${hook._path} (${hook._type})');
      _storage.value?.object = FutureItem<T>(
        type: hook._type,
        path: hook._path!,
        subscribe: hook.subscribe,
        scrollAwareContext: _disposableContext,
      );
      _scheduleRebuild(_storage.value?.object);
    }
  }

  RefreshStoragePod? _getStorage() {
    try {
      return hook.storage ?? RefreshStorage.notifierOf(context);
    } catch (_) {
      return null; // Built in an overlay?
    }
  }

  @override
  void initHook() {
    assert(hook.bucket != null, 'If the reference is expected to be null, pass `bucket` manually');
    super.initHook();

    final storage = _getStorage();
    _disposableContext = hook.scrollAware ? DisposableHookContext(this) : null;
    _bucket = hook.bucket!; // Bucket is not allowed to change.
    _mounted = true;
    _usingPageStorage = storage != null;
    _storage = storage != null
        ? RefreshStorage.write(
            storage: storage,
            context: context,
            identifier: _bucket,
            builder: () => _FirebaseModelHookBucket<T>(),
          )
        : RefreshStorageEntry(_bucket, _FirebaseModelHookBucket<T>());

    if (hook._path != null) {
      if (_storage.value?.object == null || _storage.value?.object?.path != hook._path) {
        // _log.v('Bucket item null, creating: ${hook._path} (${hook._type})');

        if (_storage.value?.object != null) {
          // Path changed, dispose the previous item.
          _storage.value!.object?.dispose();
          _storage.value!.object = null;
        }

        _updateObject();
      } else {
        // _log.v('Reusing bucket storage: ${hook._path} (${hook._type})');
        if (_storage.value?.object?.synchronous != true) _scheduleRebuild(_storage.value?.object);
      }
    }
  }

  @override
  void didUpdateHook(FirebaseModelHook<T> oldHook) {
    assert(oldHook.subscribe == hook.subscribe);
    assert(oldHook.bucket == hook.bucket);
    assert(oldHook._type == hook._type);

    if (oldHook._path != hook._path) {
      // _log.v('${oldHook._path} changed to ${hook._path}');
      _storage.value?.object?.dispose();
      _storage.value?.object = null;
      if (hook._path != null) _updateObject();
    }

    super.didUpdateHook(oldHook);
  }

  @override
  void dispose() {
    _mounted = false;
    if (!_usingPageStorage) {
      _storage.value?.object?.dispose();
      _storage.value?.object = null;
    }
    _disposableContext?.dispose();
    _storage.dispose();
    super.dispose();
  }

  @override
  T? build(BuildContext context) => _storage.value?.object?.item;
}
