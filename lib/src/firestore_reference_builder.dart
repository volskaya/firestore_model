import 'package:firestore_model/src/firebase_model_builder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firestore_model/src/firestore_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:refresh_storage/refresh_storage.dart';

/// -
typedef FirestoreReferenceBuilderCallback<T extends FirestoreModel<T>> = Widget Function(BuildContext context, T? data);

/// Asynchronous widget builder of reference counted [FirestoreModel]s.
///
/// If the firestore reference is already fetched, the widget builds
/// synchronously.
///
/// NOTE: This is an old / deprecated class that now just extends [FirebaseModelBuilder.firestore].
class FirestoreReferenceBuilder<T extends FirestoreModel<T>> extends StatelessWidget {
  /// Creates [FirstoreReferenceBuilder].
  ///
  /// A generic type, that extends [FirestoreModel], must be provided!
  const FirestoreReferenceBuilder({
    Key? key,
    required this.reference,
    required this.builder,
    this.bucket,
    this.subscribe = false,
    this.initialValue,
    this.storageContext,
    this.observe = true,
  })  : assert(initialValue == null || reference != null),
        super(key: key);

  /// Firestore reference to build.
  final DocumentReference? reference;

  /// [RefreshStorage] bucket identifier of this widgets storage.
  ///
  /// If null, [RefreshStorage] won't be used.
  final String? bucket;

  /// Asynchronous widget builder.
  final FirestoreReferenceBuilderCallback<T> builder;

  /// Subscribe to realtime changes.
  final bool subscribe;

  /// Optional value to pass to [builder], while the [reference] is not fetched.
  final T? initialValue;

  /// Allow overriding context of [MyApp.storage] to support building
  /// within an overlay.
  final BuildContext? storageContext;

  /// Whether to automatically wrap the builder in an [Observer].
  final bool observe;

  @override
  Widget build(BuildContext context) => FirebaseModelBuilder<T>.firestore(
        reference: reference,
        bucket: bucket,
        subscribe: subscribe,
        storageContext: storageContext,
        observe: observe,
        builder: (context, model) => builder(context, model ?? initialValue),
      );
}
