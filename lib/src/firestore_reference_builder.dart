import 'dart:developer' as developer;

import 'package:firestore_model/src/firebase_model.dart';
import 'package:firestore_model/src/utils/future_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firestore_model/src/firestore_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:refresh_storage/refresh_storage.dart';

/// -
typedef FirestoreReferenceBuilderCallback<T extends FirestoreModel<T>> = Widget Function(BuildContext context, T data);

class _FirestoreReferenceBuilderBucket<T extends FirestoreModel<T>> {
  FutureItem<T> item;
}

/// Asynchronous widget builder of reference counted [FirestoreModel]s.
///
/// If the firestore reference is already fetched, the widget builds
/// synchronously.
@Deprecated('Use FirebaseModelBuilder instead')
class FirestoreReferenceBuilder<T extends FirestoreModel<T>> extends StatefulWidget {
  /// Creates [FirstoreReferenceBuilder].
  ///
  /// A generic type, that extends [FirestoreModel], must be provided!
  const FirestoreReferenceBuilder({
    Key key,
    @required this.reference,
    @required this.builder,
    this.bucket,
    this.subscribe = false,
    this.initialValue,
    this.storageContext,
    this.observe = true,
  })  : assert(initialValue == null || reference != null),
        super(key: key);

  /// Firestore reference to build.
  final DocumentReference reference;

  /// [RefreshStorage] bucket identifier of this widgets storage.
  ///
  /// If null, [RefreshStorage] won't be used.
  final String bucket;

  /// Asynchronous widget builder.
  final FirestoreReferenceBuilderCallback<T> builder;

  /// Subscribe to realtime changes.
  final bool subscribe;

  /// Optional value to pass to [builder], while the [reference] is not fetched.
  final T initialValue;

  /// Allow overriding context of [MyApp.storage] to support building
  /// within an overlay.
  final BuildContext storageContext;

  /// Whether to automatically wrap the builder in an [Observer].
  final bool observe;

  @override
  _FirestoreReferenceBuilderState<T> createState() => _FirestoreReferenceBuilderState<T>();
}

class _FirestoreReferenceBuilderState<T extends FirestoreModel<T>> extends State<FirestoreReferenceBuilder<T>> {
  bool _wasInitialValueAddedAsReference = false;
  _FirestoreReferenceBuilderBucket<T> _bucket;
  FutureItem<T> get _futureObject => _bucket.item;
  set _futureObject(FutureItem<T> value) => _bucket.item = value;

  /// If the object is already cached, build synchronously
  void _updateObject() {
    assert(widget.reference != null);

    // Attempt to get cached object synchronously. If the object is not null,
    // build the widget without [FutureBuilder]
    //
    // NOTE: If `widget.initialValue` != null, its reference will be prepared
    // in `initState` and synchronously gotten here
    final object = FirestoreModel.getReference<T>(widget.reference);

    if (object != null) {
      developer.log('Instantiated with a synchronous ${widget.reference?.path}', name: 'firestore_model');
      _futureObject = FutureItem<T>.of(
        type: FirebaseModelType.firestore,
        item: object,
        subscribe: widget.subscribe,
        state: this,
      );

      // If an empty synchronous item is instantiated with subscription off,
      // it may never get data, so always request 1 update
      if (!widget.subscribe) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted && _futureObject.item != null) _futureObject.item.update();
        });
      }
    } else {
      developer.log('Instantiating asynchronously ${widget.reference?.path}', name: 'firestore_model');
      _futureObject = FutureItem<T>(
        type: FirebaseModelType.firestore,
        path: widget.reference?.path,
        subscribe: widget.subscribe,
        state: this,
      );
    }
  }

  @override
  void initState() {
    _bucket = widget.bucket != null
        ? RefreshStorage.write(
            context: widget.storageContext ?? context,
            identifier: widget.bucket,
            builder: () => _FirestoreReferenceBuilderBucket<T>(),
            dispose: (storage) => storage.item?.dispose(),
          )
        : _FirestoreReferenceBuilderBucket<T>();

    if (widget.reference != null) {
      /// Initial value will be added in [ReferencedModel], to allow
      /// `_updateObject` to build a synchronous future item. Consumers
      /// of this ReferencedBuilder can receive empty models, to which
      /// they need to subscribe or call document manually
      final referenceExists = FirestoreModel.isReferenced(widget.reference);
      if (widget.initialValue != null && !referenceExists) {
        developer.log('Initial value passed, adding it to [ReferencedModel]', name: 'firestore_model');

        // NOTE: Reference count is incremented
        _wasInitialValueAddedAsReference = true;
        FirestoreModel.addReference<T>(widget.reference, widget.initialValue);
      }

      if (_bucket.item == null) {
        developer.log('Bucket storage item null, creating: ${widget.reference?.path}', name: 'firestore_model');
        _updateObject();
      } else {
        developer.log('Reusing bucket storage: ${widget.reference?.path}', name: 'firestore_model');
      }
    }

    super.initState();
  }

  @override
  void didUpdateWidget(FirestoreReferenceBuilder<T> oldWidget) {
    assert(oldWidget.subscribe == widget.subscribe);
    assert(oldWidget.bucket == widget.bucket);

    if (oldWidget.reference?.path != widget.reference?.path) {
      developer.log('${oldWidget.reference?.path} changed to ${widget.reference?.path}', name: 'firestore_model');
      _futureObject?.dispose();
      _futureObject = null;
      if (widget.reference != null) _updateObject();
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    if (_wasInitialValueAddedAsReference) widget.initialValue?.dispose();
    if (widget.bucket == null) _bucket?.item?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => FutureBuilder<T>(
        future: _futureObject?.future,
        initialData: _futureObject?.item,
        builder: (context, snapshot) => widget.observe
            ? Observer(
                name: '${widget.bucket}_observer',
                builder: (context, __) => widget.builder(context, snapshot.hasData ? snapshot.data : null),
              )
            : widget.builder(context, snapshot.hasData ? snapshot.data : null),
      );
}
