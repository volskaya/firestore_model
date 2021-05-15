import 'dart:async';

import 'package:firestore_model/src/firebase_model.dart';
import 'package:firestore_model/src/referenced_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'firestore_model.g.dart';

/// Reference counted subscribe/unsubscribe helper methods
///
/// Call [FirestoreModel.subscribe] and [FirestoreModel.unsubscribe]
/// accordingly
abstract class FirestoreModel<T> extends _FirestoreModel<T> with _$FirestoreModel<T> {
  /// Build package included models first, then anything else.
  static D build<D>(DocumentReference reference, [DocumentSnapshot? snapshot]) =>
      FirebaseModel.build<D>(FirebaseModelType.firestore, reference.path, snapshot);

  /// Returns true, if the reference is cached in [ReferencedModel].
  static bool isReferenced(DocumentReference reference) => ReferencedModel.isReferenced(reference.path);

  /// Returns true, if the reference is cached in [ReferencedModel].
  static D? getReference<D extends FirebaseModel<D>>(DocumentReference reference) =>
      ReferencedModel.getRef<D>(reference.path);

  /// Shortcut for calling [ReferencedModel.addRef].
  ///
  /// Make sure the models, referenced this way, are disposed properly.
  static void addReference<D extends FirebaseModel<D>>(DocumentReference reference, D object) =>
      FirebaseModel.addReference<D>(reference.path, object);

  /// Fetches the [DocumentReference] trough a transaction or a regular get and converts it to a model.
  ///
  /// This is not reference counted.
  static Future<D> fetch<D extends FirestoreModel<D>>(DocumentReference reference, [Transaction? transaction]) =>
      FirebaseModel.fetch(FirebaseModelType.firestore, reference.path);

  /// Retrieve a [FirestoreModel] from this reference, optionally subscribing.
  static Future<D> from<D extends FirebaseModel<D>>(DocumentReference reference, {bool subscribe = false}) =>
      ReferencedModel.reference<D>(FirebaseModelType.firestore, reference.path, subscribe: subscribe);

  /// Deserialize and reference a [FirestoreModel] with an already fetched
  /// snapshot, like from a list query.
  ///
  /// If the reference already exists, passed `snapshot` is ignored and the
  /// old reference data is reused instead.
  static Future<D> withReference<D extends FirebaseModel<D>>(DocumentReference reference, DocumentSnapshot snapshot) =>
      ReferencedModel.referenceWithSnapshot<D>(
        FirebaseModelType.firestore,
        reference.path,
        () => FirestoreModel.build<D>(reference, snapshot),
      );

  /// Reference by overriding the `builder`, which builds the object,
  /// when there are previous references available
  static Future<D> referenceWithBuilder<D extends FirebaseModel<D>>(
    DocumentReference reference,
    D Function() builder,
  ) =>
      ReferencedModel.referenceWithSnapshot<D>(FirebaseModelType.firestore, reference.path, builder);
}

abstract class _FirestoreModel<T> extends FirebaseModel<T> with ReferencedModel, Store {
  /// Firestore reference of this model.
  late DocumentReference reference;

  /// Firestore document ID getter from the [reference].
  @override
  String get id => reference.id;

  /// Path of the [reference].
  @override
  String get path => reference.path;

  // Firebase model type.
  @override
  FirebaseModelType get modelType => FirebaseModelType.firestore;

  /// Last [DocumentSnapshot] that provided data to this model.
  @o DocumentSnapshot? snapshot;

  /// Returns true if the last [snapshot.exists] was true.
  /// Observable is null, until first [DocumentSnapshot].
  @c bool? get exists => snapshot?.exists;

  @override
  bool operator ==(dynamic other) => other.path == path;
  @override
  int get hashCode => path.hashCode;

  @override @protected @a
  void handleSnapshot(T model) {
    final firestoreModel = model as FirestoreModel<T>;

    print('Handling snapshot ${model.id} - snapshot: ${model.snapshot}');

    snapshot = firestoreModel.snapshot;
    onSnapshot(model);
    notifyListeners();

    assert(firestoreModel.snapshot == null || reference.path == firestoreModel.snapshot?.reference.path);
  }
}
