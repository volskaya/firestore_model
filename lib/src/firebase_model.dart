import 'dart:async';
import 'dart:developer' as developer;

import 'package:firebase_database/firebase_database.dart';
import 'package:firestore_model/src/firestore_model.dart';
import 'package:firestore_model/src/models/realtime_variable.dart';
import 'package:firestore_model/src/models/toggle.dart';
import 'package:firestore_model/src/realtime_model.dart';
import 'package:firestore_model/src/referenced_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_model/src/utils/semaphore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// FirebaseModel types.
enum FirebaseModelType {
  /// Firestore.
  firestore,

  /// Realtime database.
  realtime,
}

/// Builder for Firestore models.
typedef FirestoreModelBuilder = T Function<T>([DocumentSnapshot snapshot]);

/// Builder for Realtime Database models.
typedef RealtimeDatabaseModelBuilder = T Function<T>([DataSnapshot snapshot]);

abstract class _FirebaseModelImpl<T> {
  /// Document path getter from the documents reference. Either [DocumentReference] or [DatabaseReference].
  String get path;

  /// Document ID getter from the [path].
  String get id;

  FirebaseModelType get modelType;

  /// Internal snapshot handler for both types of [FirebaseModelType].
  @protected
  void handleSnapshot(T model);

  /// Called after serializing a new snapshot update.
  void onSnapshot(T x);
}

/// Reference counter subscribe/unsubscribe helper methods
///
/// Call [FirebaseModel.subscribe] and [FirebaseModel.unsubscribe]
/// accordingly. If the model is subscribed to, it needs to be unsubscribed,
/// or else there will be unwanted reads in the background.
abstract class FirebaseModel<T> extends _FirebaseModel<T> {
  /// Model builder callback to register all your different models,
  /// that extend [FirebaseModel].
  ///
  /// A type is passed to the builder, to differentiate which model to return.
  /// Must not return null values!
  ///
  /// [FirestoreModelBuilder] must be set in your flutter main().
  static FirestoreModelBuilder firestoreBuilder;

  /// See [FirestoreModelBuilder].
  static RealtimeDatabaseModelBuilder realtimeDatabaseBuilder;

  /// Print the contents of [_cache].
  static void printReferences({int padding = 120}) => ReferencedModel.printReferences(padding: padding);

  /// Build package included models first, then anything else.
  static D build<D>(FirebaseModelType type, String path, [dynamic _snapshot]) {
    assert(path.isNotEmpty);

    switch (type) {
      case FirebaseModelType.firestore:
        final reference = FirebaseFirestore.instance.doc(path);
        final snapshot = _snapshot as DocumentSnapshot;
        assert(snapshot == null || snapshot.id == reference.id);

        final data = snapshot?.data();
        D model;
        switch (D) {
          case Toggle:
            model = (data != null ? Toggle.fromJson(data) : Toggle()) as D;
            break;
          default:
            assert(FirebaseModel.firestoreBuilder != null, '[FirebaseModel.firestoreBuilder] is not defined');
            model = FirebaseModel.firestoreBuilder?.call<D>(snapshot);
        }

        if (model == null) throw UnimplementedError();
        return ((model as FirestoreModel<D>)
          ..reference = reference
          ..snapshot = snapshot) as D;
      case FirebaseModelType.realtime:
        final reference = FirebaseDatabase.instance.reference().child(path);
        final snapshot = _snapshot as DataSnapshot;
        assert(snapshot == null || snapshot.key == reference.key);

        D model;
        switch (D) {
          case RealtimeVariable:
            model = RealtimeVariable.fromJson(snapshot?.value) as D;
            break;
          default:
            assert(
              FirebaseModel.realtimeDatabaseBuilder != null,
              '[FirebaseModel.realtimeDatabaseBuilder] is not defined',
            );
            model = FirebaseModel.realtimeDatabaseBuilder?.call<D>(snapshot);
        }

        if (model == null) throw UnimplementedError();
        return ((model as RealtimeModel<D>)
          ..reference = reference
          ..snapshot = snapshot) as D;
      default:
        throw UnimplementedError();
    }
  }

  /// Shortcut for calling [ReferencedModel.addRef].
  ///
  /// Make sure the models, referenced this way, are disposed properly.
  static void addReference<D extends FirebaseModel<D>>(String path, D object) =>
      ReferencedModel.addRef<D>(path: path, object: object);

  /// Fetches the [DocumentReference] trough a transaction or a regular get and converts it to a model.
  static Future<D> fetch<D extends FirebaseModel<D>>(
    FirebaseModelType type,
    String path, [
    Transaction transaction,
  ]) async {
    assert(transaction == null || type == FirebaseModelType.firestore, 'Transaction only supports Firestore models');

    dynamic snapshot;
    switch (type) {
      case FirebaseModelType.firestore:
        final reference = FirebaseFirestore.instance.doc(path);
        snapshot = await (transaction?.get(reference) ?? reference.get());
        break;
      case FirebaseModelType.realtime:
        final reference = FirebaseDatabase.instance.reference().child(path);
        snapshot = await reference.once();
        break;
    }

    return build<D>(type, path, snapshot);
  }

  /// Retrieve a [FirebaseModel] from this reference, optionally subscribing.
  static Future<D> from<D extends FirebaseModel<D>>(FirebaseModelType type, String path, {bool subscribe = false}) =>
      ReferencedModel.reference<D>(type, path, subscribe: subscribe);

  /// Deserialize and reference a [FirebaseModel] with an already fetched
  /// snapshot, like from a list query.
  ///
  /// If the reference already exists, passed `snapshot` is ignored and the
  /// old reference data is reused instead.
  static Future<D> withReference<D extends FirebaseModel<D>>(
          FirebaseModelType type, String path, DocumentSnapshot snapshot) =>
      ReferencedModel.referenceWithSnapshot<D>(type, path, () => FirebaseModel.build<D>(type, path, snapshot));

  /// Reference by overriding the `builder`, which builds the object,
  /// when there are previous references available
  static Future<D> referenceWithBuilder<D extends FirebaseModel<D>>(
          {FirebaseModelType type, String path, D Function() builder}) =>
      ReferencedModel.referenceWithSnapshot<D>(type, path, builder);
}

abstract class _FirebaseModel<T> with ReferencedModel, ChangeNotifier implements _FirebaseModelImpl<T> {
  final _firstSnapshotCompleter = Completer<void>();

  @override
  bool operator ==(dynamic other) => other.id == id;
  @override
  int get hashCode => id.hashCode;

  StreamSubscription<dynamic> _streamSubscription; // ignore:cancel_subscriptions
  int _subscribers = 0;
  bool get isSubscribed => _subscribers > 0;

  void _onData(dynamic snapshot, {bool singleUpdate = false}) {
    assert(snapshot is DocumentSnapshot || snapshot is DataSnapshot);
    final model = FirebaseModel.build<T>(modelType, path, snapshot);

    developer.log('Reacting to changes of ${T.toString()} - $id', name: 'firestore_model');
    handleSnapshot(model);
    notifyListeners();

    // Single updates don't touch the `_firstSnapshotCompleter`
    if (!singleUpdate && !_firstSnapshotCompleter.isCompleted) {
      _firstSnapshotCompleter.complete();
    }
  }

  /// Gets a single update
  Future update() async {
    assert(path != null);

    // Don't fetch updated document, if already subscribed
    if (_streamSubscription != null) return;

    dynamic snapshot;
    switch (modelType) {
      case FirebaseModelType.firestore:
        snapshot = await FirebaseFirestore.instance.doc(path).get();
        break;
      case FirebaseModelType.realtime:
        snapshot = await FirebaseDatabase.instance.reference().child(path).once();
        break;
    }

    _onData(snapshot, singleUpdate: true);
  }

  /// Manually feed the model data, when a redundant snapshot was fetched from a list
  /// and this model is already referenced, but not subscribed to.
  void feedData(T model) {
    assert(path == (model as FirebaseModel<T>).path);
    if (_streamSubscription == null) handleSnapshot(model);
  }

  /// Subscribe to the model for realtime updates from Firestore.
  ///
  /// It's your responsibility to call [unsubscribe] because subscriptions
  /// are reference counted and if you never unsubscribe, this model will
  /// to listening, while in the background.
  Future<void> subscribe() {
    assert(path != null);

    final shouldSubscribe = _subscribers == 0;
    _subscribers += 1;

    if (shouldSubscribe) {
      assert(_streamSubscription == null);

      // Start listening.
      switch (modelType) {
        case FirebaseModelType.firestore:
          _streamSubscription = FirebaseFirestore.instance.doc(path).snapshots().listen(_onData);
          break;
        case FirebaseModelType.realtime:
          _streamSubscription =
              FirebaseDatabase.instance.reference().child(path).onValue.listen((event) => _onData(event.snapshot));
          break;
      }

      developer.log('Subscribed to ${T.toString()} - $id', name: 'firestore_model');
    }

    // Future completes when the first snapshot arrives.
    // Only await if the initial future, after constructing
    // the model for the first time.
    return !_firstSnapshotCompleter.isCompleted ? _firstSnapshotCompleter.future : null;
  }

  /// Unsubscribe from the model.
  ///
  /// This is a reference counted dispose step and should not be called, if a
  /// widget or an action didn't call [subscribe] to begin with.
  void unsubscribe({bool force = false}) {
    assert(path != null);

    if (!force && !isSubscribed) return;
    if (!force && _subscribers > 0) {
      _subscribers -= 1;
      if (_subscribers > 0) return;
    }

    developer.log('Unsubscribing from ${T.toString()} - $id', name: 'firestore_model');
    final subscription = _streamSubscription;
    _streamSubscription = null;
    _subscribers = 0;
    subscription?.cancel();
  }

  @override
  void dispose({bool unsubscribe = false}) => releaseRef(
      model: this as FirebaseModel<T>,
      onDecremented: () => unsubscribe ? this.unsubscribe() : null,
      onInvalidated: () {
        developer.log('Disposing ${T.toString()} - $id', name: 'firestore_model');
        if (isSubscribed) this.unsubscribe(force: true);
        super.dispose();
      });
}
