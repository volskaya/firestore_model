import 'dart:developer' as developer;

import 'package:firebase_database/firebase_database.dart';
import 'package:firestore_model/src/firebase_model.dart';
import 'package:firestore_model/src/referenced_model.dart';
import 'package:firestore_model/src/utils/future_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firestore_model/src/firestore_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:refresh_storage/refresh_storage.dart';

typedef FirebaseModelBuilderCallback<T extends FirebaseModel<T>> = Widget Function(BuildContext context, T data);

class _FirebaseModelBuilderBucket<T extends FirebaseModel<T>> {
  FutureItem<T> object;
}

/// Asynchronous widget builder of reference counted [FirebaseModel]s.
///
/// If the firestore reference is already fetched, the widget builds
/// synchronously.
class FirebaseModelBuilder<T extends FirebaseModel<T>> extends StatefulWidget {
  /// Creates Firestore version of [FirebaseModelBuilder].
  ///
  /// A generic type, that extends [FirestoreModel], must be provided!
  FirebaseModelBuilder.firestore({
    Key key,

    /// Firestore reference to build.
    @required DocumentReference reference,
    @required this.builder,
    @required this.bucket,
    this.subscribe = false,
    this.initialValue,
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
    @required this.builder,
    @required this.bucket,
    this.subscribe = false,
    this.initialValue,
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
  final FirebaseModelBuilderCallback<T> builder;

  /// Subscribe to realtime changes.
  final bool subscribe;

  /// Optional value to pass to [builder], while the [reference] is not fetched.
  final T initialValue;

  /// Allow overriding context of [MyApp.storage] to support building
  /// within an overlay.
  final BuildContext storageContext;

  /// Whether to automatically wrap the builder in an [Observer].
  final bool observe;

  /// Request the model to update, when this widget is built.
  final bool update;

  @override
  _FirebaseModelBuilderState<T> createState() => _FirebaseModelBuilderState<T>();
}

class _FirebaseModelBuilderState<T extends FirebaseModel<T>> extends State<FirebaseModelBuilder<T>> {
  bool _wasInitialValueAddedAsReference = false;
  _FirebaseModelBuilderBucket<T> _storage;

  /// If the object is already cached, build synchronously
  void _updateObject() {
    assert(widget._path != null);

    // Attempt to get cached object synchronously. If the object is not null,
    // build the widget without [FutureBuilder]
    //
    // This will increment the reference counter and instantiate the future item
    // as a "synchronous item". When the future item is disposed, this reference
    // will dispose as well.
    final object = ReferencedModel.getRef<T>(widget._path);

    if (object != null) {
      developer.log('Instantiated with a synchronous ${widget._path} (${widget._type})', name: 'firestore_model');
      _storage.object = FutureItem<T>.of(
        type: widget._type,
        item: object,
        subscribe: widget.subscribe,
        state: this,
      );

      // If an empty synchronous item is instantiated with subscription off,
      // it may never get data, so always request 1 update
      if (widget.update && !widget.subscribe) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) _storage.object.item?.update();
        });
      }
    } else {
      developer.log('Instantiating asynchronously ${widget._path} (${widget._type})', name: 'firestore_model');
      _storage.object = FutureItem<T>(
        type: widget._type,
        path: widget._path,
        subscribe: widget.subscribe,
        state: this,
      );
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_storage == null) {
      _storage = widget.bucket != null
          ? RefreshStorage.write(
              context: widget.storageContext ?? context,
              identifier: widget.bucket,
              builder: () => _FirebaseModelBuilderBucket<T>(),
              dispose: (storage) => storage.object?.dispose(),
            )
          : _FirebaseModelBuilderBucket<T>();

      if (widget._path != null) {
        /// Initial value will be added in [ReferencedModel], to allow
        /// `_updateObject` to build a synchronous future item. Consumers
        /// of this ReferencedBuilder can receive empty models, to which
        /// they need to subscribe or call document manually.
        final referenceExists = ReferencedModel.isReferenced(widget._path);
        if (widget.initialValue != null && !referenceExists) {
          developer.log('Initial value passed, adding it to [ReferencedModel]', name: 'firestore_model');

          // NOTE: Reference count is incremented. Decremented in [this.dispose].
          _wasInitialValueAddedAsReference = true;
          FirebaseModel.addReference<T>(widget._path, widget.initialValue);
        }

        if (_storage.object == null || _storage.object.path != widget._path) {
          developer.log('Bucket item null, creating: ${widget._path} (${widget._type})', name: 'firestore_model');

          if (_storage.object != null) {
            // Path changed, dispose the previous item.
            _storage.object?.dispose();
            _storage.object = null;
          }

          _updateObject();
        } else {
          developer.log('Reusing bucket storage: ${widget._path} (${widget._type})', name: 'firestore_model');
        }
      }
    }

    assert(_storage != null);
  }

  @override
  void didUpdateWidget(FirebaseModelBuilder<T> oldWidget) {
    assert(oldWidget.subscribe == widget.subscribe);
    assert(oldWidget.bucket == widget.bucket);
    assert(oldWidget._type == widget._type);

    if (oldWidget._path != widget._path) {
      developer.log('${oldWidget._path} changed to ${widget._path}', name: 'firestore_model');
      _storage.object?.dispose();
      _storage.object = null;
      if (widget._path != null) _updateObject();
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    if (_wasInitialValueAddedAsReference) widget.initialValue?.dispose();
    if (widget.bucket == null) _storage?.object?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => FutureBuilder<T>(
        future: _storage.object?.future,
        initialData: _storage.object?.item,
        builder: (context, snapshot) => widget.observe
            ? Observer(
                name: '${widget.bucket}_observer',
                builder: (context) => widget.builder(context, snapshot.hasData ? snapshot.data : null),
              )
            : widget.builder(context, snapshot.hasData ? snapshot.data : null),
      );
}
