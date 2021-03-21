import 'dart:async';

// ignore:import_of_legacy_library_into_null_safe
import 'package:firebase_database/firebase_database.dart';
import 'package:firestore_model/src/firebase_model.dart';
import 'package:firestore_model/src/referenced_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'realtime_model.g.dart';

/// Reference counter subscribe/unsubscribe helper methods
///
/// Call [RealtimeModel.subscribe] and [RealtimeModel.unsubscribe]
/// accordingly
abstract class RealtimeModel<T> extends _RealtimeModel<T> with _$RealtimeModel<T> {
  /// Build package included models first, then anything else.
  static D build<D>(DatabaseReference reference, [DataSnapshot? snapshot]) =>
      FirebaseModel.build<D>(FirebaseModelType.realtime, reference.path, snapshot);

  /// Returns true, if the reference is cached in [ReferencedModel].
  static bool isReferenced(DatabaseReference reference) => ReferencedModel.isReferenced(reference.path);

  /// Returns true, if the reference is cached in [ReferencedModel].
  static D? getReference<D extends FirebaseModel<D>>(DatabaseReference reference) =>
      ReferencedModel.getRef<D>(reference.path);

  /// Shortcut for calling [ReferencedModel.addRef].
  ///
  /// Make sure the models, referenced this way, are disposed properly.
  static void addReference<D extends FirebaseModel<D>>(DatabaseReference reference, D object) =>
      FirebaseModel.addReference<D>(reference.path, object);

  /// Fetches the [DatabaseReference] trough a transaction or a regular get and converts it to a model.
  static Future<D> fetch<D extends RealtimeModel<D>>(DatabaseReference reference) =>
      FirebaseModel.fetch(FirebaseModelType.realtime, reference.path);

  /// Retrieve a [RealtimeModel] from this reference, optionally subscribing.
  static Future<D> from<D extends FirebaseModel<D>>(DatabaseReference reference, {bool subscribe = false}) =>
      ReferencedModel.reference<D>(FirebaseModelType.realtime, reference.path, subscribe: subscribe);

  /// Deserialize and reference a [RealtimeModel] with an already fetched
  /// snapshot, like from a list query.
  ///
  /// If the reference already exists, passed `snapshot` is ignored and the
  /// old reference data is reused instead.
  static Future<D> withReference<D extends FirebaseModel<D>>(DatabaseReference reference, DataSnapshot snapshot) =>
      ReferencedModel.referenceWithSnapshot<D>(
        FirebaseModelType.realtime,
        reference.path,
        () => RealtimeModel.build<D>(reference, snapshot),
      );

  /// Reference by overriding the `builder`, which builds the object,
  /// when there are previous references available
  static Future<D> referenceWithBuilder<D extends FirebaseModel<D>>(
          DatabaseReference reference, D Function() builder) =>
      ReferencedModel.referenceWithSnapshot<D>(FirebaseModelType.realtime, reference.path, builder);
}

abstract class _RealtimeModel<T> extends FirebaseModel<T> with ReferencedModel, Store {
  /// Realtime database reference of this model.
  late DatabaseReference reference;

  /// Realtime database key getter from the [reference].
  @override
  String get id => reference.key;

  /// Path of the [reference].
  @override
  String get path => reference.path;

  // Firebase model type.
  @override
  FirebaseModelType get modelType => FirebaseModelType.realtime;

  /// Last [DocumentSnapshot] that provided data to this model.
  @observable
  DataSnapshot? snapshot;

  /// Returns true if the last [snapshot.exists] was true.
  /// Observable is null, until the first [DocumentSnapshot].
  ///
  /// Snapshot's value is not considered, to keep this closer to Firestore's
  /// behavior. Instead, if a snapshot was returned with no error, e.g. missing
  /// permissions, then it exists, even if its value is null.
  @computed
  bool? get exists => snapshot != null ? snapshot!.value != null : null;

  @override
  bool operator ==(dynamic other) => other.path == path;
  @override
  int get hashCode => path.hashCode;

  @override
  @protected
  @action
  void handleSnapshot(T model) {
    final realtimeModel = model as RealtimeModel<T>;

    snapshot = realtimeModel.snapshot;
    onSnapshot(model);
    notifyListeners();

    assert(reference.path == realtimeModel.reference.path);
    assert(realtimeModel.snapshot != null);
    assert(snapshot != null);
    assert(snapshot == realtimeModel.snapshot);
  }
}
