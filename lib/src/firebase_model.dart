import 'dart:async';

// ignore:import_of_legacy_library_into_null_safe
import 'package:firebase_database/firebase_database.dart';
import 'package:firestore_model/src/firestore_model.dart';
import 'package:firestore_model/src/models/realtime_variable.dart';
import 'package:firestore_model/src/models/toggle.dart';
import 'package:firestore_model/src/realtime_model.dart';
import 'package:firestore_model/src/referenced_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:log/log.dart';

/// The delay before the [FirebaseModel] attempts to resubscribe, when a subscription
/// value failed with an error, e.g. a permission error.
Duration kFirebaseModelResubDelay = const Duration(seconds: 5);

/// FirebaseModel types.
enum FirebaseModelType {
  /// Firestore.
  firestore,

  /// Realtime database.
  realtime,
}

/// Builder for both Firestore and Realtime Database models. Json map could be null.
typedef FirebaseModelBuilderCallback = T Function<T>([Map? data]);

/// Test builder for both Firestore and Realtime Database models. Json map could be null.
typedef FirebaseModelTestBuilderCallback = T Function<T>(FirebaseModelType type, String path);

abstract class _FirebaseModelImpl<T> {
  /// Document path getter from the documents reference. Either [DocumentReference] or [DatabaseReference].
  String get path;

  /// Document ID getter from the [path].
  String get id;

  /// Either a firestore or realtime database type.
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
  /// Override for the default [FirebaseFirestore] used by this package.
  static FirebaseFirestore store = FirebaseFirestore.instance;

  /// Override for the default [FirebaseDatabase] used by this package.
  static FirebaseDatabase database = FirebaseDatabase.instance;

  /// Model builder callback to register all your different models,
  /// that extend [FirestoreModel] or [RealtimeModel].
  ///
  /// A type is passed to the builder, to differentiate which model to return.
  /// Must not return null values!
  ///
  /// [FirebaseModelBuilderCallback] must be set in your flutter main().
  static FirebaseModelBuilderCallback? builder;

  /// A builder for tests  to intercept a getter callback and return a model
  /// without calling Firebase.
  @visibleForTesting static FirebaseModelTestBuilderCallback? testBuilder;

  /// Will avoid touching Firebase, when a subscription should be established,
  /// but the subscription counters and other behavior will still continue to work.
  @visibleForTesting static bool emptySubscriptions = false;

  /// Print the contents of [_cache].
  static void printReferences() => ReferencedModel.printReferences();

  /// Build package included models first, then anything else.
  static D build<D>(FirebaseModelType type, String path, [dynamic _snapshot]) {
    assert(path.isNotEmpty);

    // Prioritize the test builder or passtrough, if it didn't build anything.
    final testModel = FirebaseModel.testBuilder?.call<D>(type, path);
    if (testModel != null) return testModel;

    switch (type) {
      case FirebaseModelType.firestore:
        final reference = FirebaseModel.store.doc(path);
        final snapshot = _snapshot as DocumentSnapshot<Map<String, dynamic>>?;
        assert(snapshot == null || snapshot.id == reference.id);

        final data = snapshot?.data();
        D? model;
        switch (D) {
          case Toggle:
            model = (data != null ? Toggle.fromJson(data) : Toggle()) as D;
            break;
          default:
            assert(FirebaseModel.builder != null, '[FirebaseModel.builder] is not defined');
            model = FirebaseModel.builder?.call<D>(snapshot?.data());
        }

        if (model == null) throw UnimplementedError('Model builder for ${D.toString()} is not defined');
        return ((model as FirestoreModel<D>)
          ..reference = reference
          ..snapshot = snapshot) as D;
      case FirebaseModelType.realtime:
        final reference = FirebaseModel.database.reference().child(path);
        final snapshot = _snapshot as DataSnapshot?;
        assert(snapshot == null || snapshot.key == reference.key);

        D? model;
        switch (D) {
          case RealtimeVariable:
            model = RealtimeVariable.fromJson(snapshot?.value) as D;
            break;
          default:
            assert(FirebaseModel.builder != null, '[FirebaseModel.builder] is not defined');
            model = FirebaseModel.builder?.call<D>(snapshot?.value as Map?);
        }

        if (model == null) throw UnimplementedError('Model builder for ${D.toString()} is not defined');
        return ((model as RealtimeModel<D>)
          ..reference = reference
          ..snapshot = snapshot) as D;
      default:
        throw UnimplementedError('Type: $type, ${D.toString()}');
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
    Transaction? transaction,
  ]) async {
    assert(transaction == null || type == FirebaseModelType.firestore, 'Transaction only supports Firestore models');

    dynamic snapshot;
    switch (type) {
      case FirebaseModelType.firestore:
        final reference = FirebaseModel.store.doc(path);
        snapshot = await (transaction?.get(reference) ?? reference.get());
        break;
      case FirebaseModelType.realtime:
        final reference = FirebaseModel.database.reference().child(path);
        snapshot = await reference.once();
        break;
    }

    return build<D>(type, path, snapshot);
  }

  /// Retrieve a [FirebaseModel] from this reference, optionally subscribing.
  static Future<D> from<D extends FirebaseModel<D>>(FirebaseModelType type, String path, {bool subscribe = false}) =>
      // If it's already referenced, the other call with return the correct model.
      FirebaseModel.testBuilder != null && !ReferencedModel.isReferenced(path)
          ? ReferencedModel.referenceWithSnapshot<D>(type, path, () => FirebaseModel.testBuilder!<D>(type, path))
          : ReferencedModel.reference<D>(type, path, subscribe: subscribe);

  /// Deserialize and reference a [FirebaseModel] with an already fetched
  /// snapshot, like from a list query.
  ///
  /// If the reference already exists, passed `snapshot` is ignored and the
  /// old reference data is reused instead.
  static Future<D> withReference<D extends FirebaseModel<D>>(FirebaseModelType type, String path,
          DocumentSnapshot snapshot) =>
      ReferencedModel.referenceWithSnapshot<D>(type, path, () => FirebaseModel.build<D>(type, path, snapshot));

  /// Reference by overriding the `builder`, which builds the object,
  /// when there are previous references available
  static Future<D> referenceWithBuilder<D extends FirebaseModel<D>>({
    required FirebaseModelType type,
    required String path,
    required D Function() builder,
  }) =>
      ReferencedModel.referenceWithSnapshot<D>(type, path, builder);
}

abstract class _FirebaseModel<T> with ReferencedModel, ChangeNotifier implements _FirebaseModelImpl<T> {
  static final _log = Log.named('FirebaseModel');

  final _firstSnapshotCompleter = Completer<void>();

  StreamSubscription<dynamic>? _streamSubscription; // ignore:cancel_subscriptions
  int _subscribers = 0;
  int get subscribers => _subscribers;
  bool get isSubscribed => _subscribers > 0;

  void _onData(dynamic snapshot, {bool singleUpdate = false}) {
    assert(snapshot is DocumentSnapshot || snapshot is DataSnapshot);
    final model = FirebaseModel.build<T>(modelType, path, snapshot);

    _log.v('Reacting to changes of ${T.toString()} - $id');
    handleSnapshot(model);
    notifyListeners();

    // Single updates don't touch the `_firstSnapshotCompleter`
    if (!singleUpdate && !_firstSnapshotCompleter.isCompleted) {
      _firstSnapshotCompleter.complete();
    }
  }

  /// Gets a single update
  Future<void> update() async {
    // Don't fetch updated document, if already subscribed
    if (_streamSubscription != null) return;

    try {
      dynamic snapshot;
      switch (modelType) {
        case FirebaseModelType.firestore:
          snapshot = await FirebaseModel.store.doc(path).get();
          break;
        case FirebaseModelType.realtime:
          snapshot = await FirebaseModel.database.reference().child(path).once();
          break;
      }

      _onData(snapshot, singleUpdate: true);
    } catch (e, t) {
      _log.e('Failed to update ${T.toString()} - $id', e, t);
    }
  }

  /// Manually feed the model data, when a redundant snapshot was fetched from a list
  /// and this model is already referenced, but not subscribed to.
  void feedData(T model) {
    assert(path == (model as FirebaseModel<T>).path);
    if (_streamSubscription == null) handleSnapshot(model);
  }

  /// Call [onSnapshot] if there's no active subscription.
  ///
  /// The [model] is allowed to ignore `reference` and `snapshot` fields.
  void feedFields(T model) {
    if (_streamSubscription == null) {
      onSnapshot(model);
      notifyListeners();
    }
  }

  void _handleRealtimeDatabaseData(Event event) => _onData(event.snapshot);

  void _handleRealtimeDatabaseSubscriptionError(Object e, StackTrace t) {
    _log.e('Error in RTDB subscription of ${T.toString()} - $id', e, t);
    if (!_firstSnapshotCompleter.isCompleted) _firstSnapshotCompleter.complete();
    _scheduleResubscribeAttempt();
  }

  void _handleFirestoreSubscriptionError(Object e, StackTrace t) {
    _log.e('Error in Firestore subscription of ${T.toString()} - $id', e, t);
    if (!_firstSnapshotCompleter.isCompleted) _firstSnapshotCompleter.complete();
    _scheduleResubscribeAttempt();
  }

  Timer? _resubTimer;
  void _scheduleResubscribeAttempt() {
    _log.i('Scheduling resubscribe for ${T.toString()} - $id');
    _streamSubscription?.cancel();
    _streamSubscription = null;
    _resubTimer?.cancel();
    _resubTimer = Timer(kFirebaseModelResubDelay, () {
      if (isSubscribed && _streamSubscription == null) {
        try {
          _log.i('Attempting to resubscribe to ${T.toString()} - $id');
          _startSubscription();
        } catch (_) {
          _scheduleResubscribeAttempt();
        }
      }
    });
  }

  void _startSubscription() {
    assert(_streamSubscription == null);

    try {
      if (!FirebaseModel.emptySubscriptions) {
        // Start listening.
        switch (modelType) {
          case FirebaseModelType.firestore:
            _streamSubscription = FirebaseModel.store.doc(path).snapshots().listen(
                  _onData,
                  cancelOnError: false,
                  onError: _handleFirestoreSubscriptionError,
                );
            break;
          case FirebaseModelType.realtime:
            _streamSubscription = FirebaseModel.database.reference().child(path).onValue.listen(
                  _handleRealtimeDatabaseData,
                  cancelOnError: false,
                  onError: _handleRealtimeDatabaseSubscriptionError,
                );
            break;
        }
      } else {
        // Subscribe with an empty "test" subscription.
        _streamSubscription = Stream.value(null).listen((_) {});
      }

      _log.v('Subscribed to ${T.toString()} - $id');
    } catch (e, t) {
      // Unblock the completer, in case something is awaiting the completer
      // and expecting data from first subscription.
      if (!_firstSnapshotCompleter.isCompleted) _firstSnapshotCompleter.complete();
      _log.e('Failed to suscribe to ${T.toString()} - $id', e, t);
      rethrow;
    }
  }

  /// Subscribe to the model for realtime updates from Firestore.
  ///
  /// It's your responsibility to call [unsubscribe] because subscriptions
  /// are reference counted and if you never unsubscribe, this model will
  /// to listening, while in the background.
  Future<void> subscribe() {
    final shouldSubscribe = _subscribers == 0;
    _subscribers += 1;

    if (shouldSubscribe) {
      assert(_streamSubscription == null);

      try {
        _startSubscription();
      } catch (_) {
        _subscribers -= 1;
      }
    }

    // Future completes when the first snapshot arrives.
    // Only await if the initial future, after constructing
    // the model for the first time.
    return !_firstSnapshotCompleter.isCompleted && !FirebaseModel.emptySubscriptions
        ? _firstSnapshotCompleter.future
        : SynchronousFuture<void>(null);
  }

  /// Unsubscribe from the model.
  ///
  /// This is a reference counted dispose step and should not be called, if a
  /// widget or an action didn't call [subscribe] to begin with.
  void unsubscribe({bool force = false}) {
    if (!force && !isSubscribed) return;
    if (!force && _subscribers > 0) {
      _subscribers -= 1;
      if (_subscribers > 0) return;
    }

    _log.v('Unsubscribing from ${T.toString()} - $id');
    _streamSubscription?.cancel();
    _streamSubscription = null;
    _subscribers = 0;
  }

  @override
  void dispose({bool unsubscribe = false}) => releaseRef(
      model: this as FirebaseModel<T>,
      onDecremented: unsubscribe ? this.unsubscribe : null,
      onInvalidated: () {
        _log.v('Disposing ${T.toString()} - $id');
        if (isSubscribed) this.unsubscribe(force: true);
        super.dispose();
      });

  @override
  bool operator ==(dynamic other) => other.path == path;

  @override
  int get hashCode => path.hashCode;
}
