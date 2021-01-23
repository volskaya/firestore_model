import 'package:firebase_database/firebase_database.dart';
import 'package:firestore_model/src/firebase_model.dart';
import 'package:firestore_model/src/firebase_model_hook.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firestore_model/src/firestore_model.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:refresh_storage/refresh_storage.dart';

/// Widget builder of [FirebaseModelBuilder].
typedef FirebaseModelWidgetBuilderCallback<T extends FirebaseModel<T>> = Widget Function(BuildContext context, T data);

/// Asynchronous widget builder of reference counted [FirebaseModel]s.
///
/// If the firestore reference is already fetched, the widget builds
/// synchronously.
class FirebaseModelBuilder<T extends FirebaseModel<T>> extends HookWidget {
  /// Creates Firestore version of [FirebaseModelBuilder].
  ///
  /// A generic type, that extends [FirestoreModel], must be provided!
  FirebaseModelBuilder.firestore({
    Key key,

    /// Firestore reference to build.
    @required DocumentReference reference,
    this.bucket,
    this.builder,
    this.subscribe = false,
    this.storageContext,
    this.observe = true,
    this.update = false,
  })  : _type = FirebaseModelType.firestore,
        _path = reference?.path,
        super(key: key);

  /// Creates Realtime Database version of [FirstoreReferenceBuilder].
  ///
  /// A generic type, that extends [RealtimeModel], must be provided!
  FirebaseModelBuilder.realtime({
    Key key,

    /// Realtime Database reference to build.
    @required DatabaseReference reference,
    this.bucket,
    this.builder,
    this.subscribe = false,
    this.storageContext,
    this.observe = true,
    this.update = false,
  })  : _type = FirebaseModelType.realtime,
        _path = reference?.path,
        super(key: key);

  final FirebaseModelType _type;
  final String _path;

  /// [RefreshStorage] bucket identifier of this widgets storage.
  ///
  /// If null, [RefreshStorage] won't be used.
  final String bucket;

  /// Asynchronous widget builder.
  final FirebaseModelWidgetBuilderCallback<T> builder;

  /// Subscribe to realtime changes.
  final bool subscribe;

  /// Allow overriding context of [MyApp.storage] to support building
  /// within an overlay.
  final BuildContext storageContext;

  /// Whether to automatically wrap the builder in an [Observer].
  final bool observe;

  /// Request the model to update, when this widget is initialized.
  final bool update;

  @override
  Widget build(BuildContext context) {
    T data;

    switch (_type) {
      case FirebaseModelType.firestore:
        data = use<T>(
          FirebaseModelHook<T>.firestore(
            reference: _path != null ? FirebaseFirestore.instance.doc(_path) : null,
            bucket: bucket ?? _path,
            subscribe: subscribe,
            storageContext: storageContext,
            update: update,
          ),
        );
        break;
      case FirebaseModelType.realtime:
        data = use<T>(
          FirebaseModelHook<T>.realtime(
            reference: _path != null ? FirebaseDatabase.instance.reference().child(_path) : null,
            bucket: bucket ?? _path,
            subscribe: subscribe,
            storageContext: storageContext,
            update: update,
          ),
        );
        break;
    }

    return observe
        ? Observer(
            name: '${bucket ?? _path}_observer',
            builder: (context, __) => builder(context, data?.path == _path ? data : null),
          )
        : builder(context, data?.path == _path ? data : null);
  }
}
