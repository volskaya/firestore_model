import 'dart:async';
import 'dart:developer' as developer;

import 'package:firestore_model/src/converters.dart';
import 'package:firestore_model/src/models/toggle.dart';
import 'package:firestore_model/src/referenced_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_model/src/utils/semaphore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'firestore_model.g.dart';

// FIXME: Passing [T] to [FirestoreModel] throws "Type 'T' not found",
// from the compiler
typedef FirestoreModelBuilder = T Function<T>([DocumentSnapshot snapshot]);

abstract class _FirestoreModelImpl<T> {
  /// Called after serializing a new snapshot update
  void onSnapshot(T x);
}

/// Reference counter subscribe/unsubscribe helper methods
///
/// Call [FirestoreModel.subscribe] and [FirestoreModel.unsubscribe]
/// accordingly
abstract class FirestoreModel<T> extends _FirestoreModel<T> with _$FirestoreModel<T> {
  /// Model builder callback to register all your different models,
  /// that extend [FirestoreModel].
  ///
  /// A type is passed to the builder, to differentiate which model to return.
  /// Must not return null values!
  ///
  /// [FirestoreModelBuilder] must be set in your flutter main().
  static FirestoreModelBuilder builder;

  /// Build package included models first, then anything else.
  static D build<D>(DocumentReference reference, [DocumentSnapshot snapshot]) {
    assert(reference.id.isNotEmpty);
    assert(snapshot == null || snapshot.id == reference.id);

    final data = snapshot?.data();
    D model;
    switch (D) {
      case Toggle:
        model = (data != null ? Toggle.fromJson(data) : Toggle()) as D;
        break;
      default:
        assert(FirestoreModel.builder != null, '[FirestoreModel.builder] is not defined');
        model = FirestoreModel.builder?.call<D>(snapshot);
    }

    if (model == null) throw UnimplementedError();
    return ((model as FirestoreModel<D>)
      ..reference = reference
      ..snapshot = snapshot) as D;
  }

  /// Fetches the [DocumentReference] trough a transaction or a regular get and converts it to a model.
  static Future<D> fetch<D extends FirestoreModel<D>>(DocumentReference reference, [Transaction transaction]) async =>
      build<D>(reference, await (transaction?.get(reference) ?? reference.get()));

  /// Retrieve a [FirestoreModel] from this reference, optionally subscribing.
  static Future<D> from<D extends FirestoreModel<D>>(
    DocumentReference reference, {
    bool subscribe = false,
  }) =>
      ReferencedModel.reference<D>(reference: reference, subscribe: subscribe);

  /// Deserialize and reference a [FirestoreModel] with an already fetched
  /// snapshot, like from a list query.
  ///
  /// If the reference already exists, passed `snapshot` is ignored and the
  /// old reference data is reused instead.
  static Future<D> withReference<D extends FirestoreModel<D>>(
    DocumentReference reference,
    DocumentSnapshot snapshot,
  ) =>
      ReferencedModel.referenceWithSnapshot<D>(
        reference: reference,
        newObject: () => FirestoreModel.build<D>(reference, snapshot),
      );

  /// Reference by overriding the `builder`, which builds the object,
  /// when there are previous references available
  static Future<D> referenceWithBuilder<D extends FirestoreModel<D>>({
    @required DocumentReference reference,
    @required D Function() builder,
  }) =>
      ReferencedModel.referenceWithSnapshot<D>(
        reference: reference,
        newObject: builder,
      );
}

abstract class _FirestoreModel<T> with ReferencedModel, ChangeNotifier, Store implements _FirestoreModelImpl<T> {
  final _firstSnapshotCompleter = Completer<void>();
  final _semaphore = Semaphore(1);

  /// Firestore reference of this model.
  DocumentReference reference;

  /// Last [DocumentSnapshot] that provided data to this model.
  @observable
  DocumentSnapshot snapshot;

  /// Create timestamp of this model.
  @observable
  @JsonKey()
  @FirestoreTimestampConverter()
  Timestamp createTime;

  /// Update timestamp of this model
  @observable
  @JsonKey()
  @FirestoreTimestampConverter()
  Timestamp updateTime;

  /// Firestore document ID getter from the [reference].
  String get id => reference?.id;

  /// Returns true if the last [snapshot.exists] was true.
  /// Observable is null, until first [DocumentSnapshot].
  @computed
  bool get exists => snapshot?.exists;

  /// Returns true, if the document was deleted since its last data was fetched.
  @computed
  bool get deleted => createTime != null && exists == false;

  /// Returns true, if [createTime] is not older than 1 day.
  @computed
  bool get isNew => (createTime?.toDate()?.add(const Duration(days: 1)))?.isAfter(DateTime.now()) ?? false;

  @override
  bool operator ==(dynamic other) => other.id == id;
  @override
  int get hashCode => id.hashCode;

  StreamSubscription<DocumentSnapshot> _streamSubscription;
  int _subscribers = 0;
  bool get isSubscribed => _subscribers > 0;

  bool _shouldSubscribe() {
    final shouldSubscribe = _subscribers == 0;
    _subscribers += 1;
    return shouldSubscribe;
  }

  bool _shouldUnsubscribe() {
    if (_subscribers > 0) _subscribers -= 1;
    return _subscribers == 0;
  }

  void _handleSnapshot(T model) {
    final firestoreModel = model as FirestoreModel<T>;
    final deleted = this.deleted || (exists == true && firestoreModel.exists == false);
    assert(reference == firestoreModel.snapshot.reference);

    snapshot = firestoreModel.snapshot;

    // Don't update data, if the document was deleted during this models lifecycle.
    // [exists] will still update by updating [snapshot] above.
    if (!deleted) {
      createTime = firestoreModel.createTime;
      updateTime = firestoreModel.updateTime;
      onSnapshot(model);
    }

    notifyListeners();
  }

  void _onData(DocumentSnapshot snapshot, {bool singleUpdate = false}) {
    assert(snapshot.id.isNotEmpty);
    final model = FirestoreModel.build<T>(snapshot.reference, snapshot);

    developer.log('Reacting to changes of ${T.toString()} - $id', name: 'firestore_model');
    _handleSnapshot(model);

    // Single updates don't touch the `_firstSnapshotCompleter`
    if (!singleUpdate && !_firstSnapshotCompleter.isCompleted) {
      _firstSnapshotCompleter.complete();
    }
  }

  /// Gets a single update
  Future update() async {
    assert(reference != null);
    await _semaphore.acquire();

    try {
      // Don't fetch updated document, if already subscribed
      if (_streamSubscription != null) return;

      final data = await reference.get();
      _onData(data, singleUpdate: true);
    } finally {
      _semaphore.release();
    }
  }

  /// Manually feed the model data, when a redundant snapshot was fetched from a list
  /// and this model is already referenced, but not subscribed to.
  void feedData(T model) {
    assert(reference.path == (model as FirestoreModel<T>).reference.path);
    if (_streamSubscription == null) _handleSnapshot(model);
  }

  /// Subscribe to the model for realtime updates from Firestore.
  ///
  /// It's your responsibility to call [unsubscribe] because subscriptions
  /// are reference counted and if you never unsubscribe, this model will
  /// to listening, while in the background.
  Future<void> subscribe() async {
    assert(reference != null);
    await _semaphore.acquire();

    try {
      if (_shouldSubscribe()) {
        assert(reference != null);
        assert(_streamSubscription == null);

        // Start listening
        _streamSubscription = reference.snapshots().listen(_onData);
        developer.log('Subscribed to ${T.toString()} - $id', name: 'firestore_model');
      }

      // Future completes when the first snapshot arrives.
      // Only await if the initial future, after constructing
      // the model for the first time
      return !_firstSnapshotCompleter.isCompleted ? _firstSnapshotCompleter.future : null;
    } catch (e) {
      developer.log('Couldn\'t subscribe to ${T.toString()} - $id', name: 'firestore_model', error: e);
    } finally {
      _semaphore.release();
    }
  }

  /// Unsubscribe from the model.
  ///
  /// This is a reference counted dispose step and should not be called, if a
  /// widget or an action didn't call [subscribe] to begin with.
  Future<void> unsubscribe({bool force = false}) async {
    assert(reference != null);
    await _semaphore.acquire();

    try {
      if (!force && !isSubscribed) return;
      if (!force && !_shouldUnsubscribe()) return;

      developer.log('Unsubscribing from ${T.toString()} - $id', name: 'firestore_model');
      await _streamSubscription?.cancel();
      _streamSubscription = null;
      _subscribers = 0;
    } finally {
      _semaphore.release();
    }
  }

  @override
  void dispose({bool unsubscribe = false}) => releaseRef(
      model: this as FirestoreModel<T>,
      onDecremented: () => unsubscribe ? this.unsubscribe() : null,
      onInvalidated: () async {
        developer.log('Disposing ${T.toString()} - $id', name: 'firestore_model');
        if (isSubscribed) await this.unsubscribe();
        super.dispose();
      });
}
