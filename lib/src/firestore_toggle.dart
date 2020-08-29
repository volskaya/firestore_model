import 'dart:async';
import 'dart:developer' as developer;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_model/firestore_model.dart';
import 'package:firestore_model/src/models/toggle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

typedef ToggleBuilder = Widget Function(
  BuildContext context,
  bool ready,
  bool toggled,
  VoidCallback handler,
);

/// Toggleable button, which is handled by adding or removing a document
/// to a firebase collection
class FirestoreToggle extends StatefulObserverWidget {
  /// Creates [FirestoreToggle].
  FirestoreToggle({
    Key key,
    @required this.builder,

    /// Subcollection of the [Toggle] documents.
    @required CollectionReference toggle,

    /// ID of this toggle, usually users auth uid.
    @required String id,

    /// Subcollection of [toggle] mirror. Like `dislikes` to `likes`.
    CollectionReference mirror,

    /// Subcollection of duplicate [Toggle]s of [toggle].
    CollectionReference duplicate,

    /// Subcollection of [duplicate] mirror.
    CollectionReference duplicateMirror,
    this.enabled = true,
    this.countToggle = false,
    this.countDuplicate = false,
    this.createDuplicate = true,
    this.onToggled,
  })  : assert(mirror == null || mirror.path == toggle.path),
        assert(duplicateMirror == null || duplicateMirror.parent.path == duplicate?.parent?.path),
        _parent = toggle.parent,
        _toggle = toggle.doc(id),
        _mirror = mirror?.doc(id),
        _duplicate = duplicate?.doc(toggle.parent.id),
        _duplicateParent = duplicate?.parent,
        _duplicateMirror = duplicate?.doc(mirror?.parent?.id),
        super(
          key: key,
          name: 'collection_toggle_observer',
        );

  /// Parent document of [toggle].
  final DocumentReference _parent;

  /// [DocumentReference] where this [FirestoreToggle] will write data.
  final DocumentReference _toggle;

  /// [DocumentReference] where this [FirestoreToggle] will unset mirror toggles.
  final DocumentReference _mirror;

  /// [DocumentReference] where this [FirestoreToggle] will write duplicate data.
  ///
  /// For example if [toggle] points to a, lets say, photo document, your [toggle]
  /// will be written to a subcollection in that photos document, but you would
  /// also want to maintain a users own collection of favorite photos. In that
  /// case this [duplicate] should point to a collection in the user document.
  final DocumentReference _duplicate;

  /// Parent document of [duplicate]
  final DocumentReference _duplicateParent;

  /// Mirror of [duplicate]
  final DocumentReference _duplicateMirror;

  /// Update a field with the same name as [_toggle] collection id in the [_parent] document;
  final bool countToggle;

  /// Update a field with the same name as [_duplicate] collection id in the [_duplicateParent] document;
  final bool countDuplicate;

  /// Optionally control whether duplicate documents are created.
  /// Useful for when you want only the duplicate counters to update.
  final bool createDuplicate;

  /// Builder with the current toggle state.
  final ToggleBuilder builder;

  /// Callback on toggle change.
  final ValueChanged<bool> onToggled;

  /// Whether this toggle should deliver events.
  ///
  /// For example disabled when the user is not authenticated.
  final bool enabled;

  @override
  _FirestoreToggleState createState() => _FirestoreToggleState();
}

class _FirestoreToggleState extends State<FirestoreToggle> {
  Toggle _toggle;
  Toggle _mirror;

  bool get areTogglesReady => _toggle != null && (widget._mirror != null ? _mirror != null : true);
  bool get isReady => areTogglesReady;

  Future _usingBatch() async {
    assert(_toggle != null, 'Disable button until the document is ready');
    final on = !_toggle.exists;
    final decrementMirror = on && widget._mirror != null ? _mirror.exists : false;
    final batch = FirebaseFirestore.instance.batch();

    // Untoggle the mirror document.
    if (decrementMirror) {
      batch.delete(_mirror.reference);
      if (widget._duplicateMirror != null && widget.createDuplicate) batch.delete(widget._duplicateMirror);
    }

    developer.log('Toggling ${on ? "on" : "off"} ${_toggle.reference.path}', name: 'firestore_collection_toggle');

    if (on) {
      final data = <String, dynamic>{'createTime': FieldValue.serverTimestamp()};
      batch.set(_toggle.reference, data);
      if (widget._duplicate != null && widget.createDuplicate) batch.set(widget._duplicate, data);
    } else {
      batch.delete(_toggle.reference);
      if (widget._duplicate != null && widget.createDuplicate) batch.delete(widget._duplicate);
    }

    // Counter update for parent document
    if (widget.countToggle) {
      batch.update(
        widget._parent,
        decrementMirror
            ? <String, dynamic>{
                'updateTime': FieldValue.serverTimestamp(),
                widget._toggle.parent.id: FieldValue.increment(1),
                widget._mirror.parent.id: FieldValue.increment(-1),
              }
            : <String, dynamic>{
                'updateTime': FieldValue.serverTimestamp(),
                widget._toggle.parent.id: FieldValue.increment(!on ? -1 : 1),
              },
      );
    }

    if (widget.countDuplicate) {
      batch.update(
        widget._duplicateParent,
        decrementMirror
            ? <String, dynamic>{
                'updateTime': FieldValue.serverTimestamp(),
                widget._duplicate.parent.id: FieldValue.increment(1),
                widget._duplicateMirror.parent.id: FieldValue.increment(-1),
              }
            : <String, dynamic>{
                'updateTime': FieldValue.serverTimestamp(),
                widget._duplicate.parent.id: FieldValue.increment(!on ? -1 : 1),
              },
      );
    }

    try {
      await batch.commit();
    } on PlatformException catch (e) {
      developer.log('Couldn\'t commit batch', name: 'firestore_collection_toggle', error: e);
    }

    widget.onToggled?.call(on);
  }

  Future toggle() async {
    assert(isReady);
    await _usingBatch();
  }

  Future _deferredState() async {
    if (!widget.enabled) return; // Deferred too late

    final models = await Future.wait([
      FirestoreModel.from<Toggle>(widget._toggle, subscribe: true),
      if (widget._mirror != null) FirestoreModel.from<Toggle>(widget._mirror, subscribe: true),
    ]);

    final toggle = models.first;
    final mirror = widget._mirror != null ? models[1] : null;

    if (mounted) {
      setState(() {
        _toggle = toggle;
        _mirror = mirror;
      });
    } else {
      toggle.dispose(unsubscribe: true);
      mirror?.dispose(unsubscribe: true);
    }
  }

  static void _defer(State state, VoidCallback callback) {
    if (!state.mounted) {
      callback();
    } else if (Scrollable.recommendDeferredLoadingForContext(state.context)) {
      SchedulerBinding.instance.scheduleFrameCallback((_) => _defer(state, callback));
    } else {
      callback();
    }
  }

  @override
  void initState() {
    if (widget.enabled) _defer(this, _deferredState);
    super.initState();
  }

  @override
  void didUpdateWidget(FirestoreToggle oldWidget) {
    assert(oldWidget._parent?.path == widget._parent?.path, 'Usa a key to construct a new FirestoreToggle');
    assert(oldWidget._duplicateParent?.path == widget._duplicateParent?.path,
        'Usa a key to construct a new FirestoreToggle');

    if (oldWidget.enabled != widget.enabled) {
      if (widget.enabled) {
        _deferredState();
      } else {
        _toggle?.dispose(unsubscribe: true);
        _mirror?.dispose(unsubscribe: true);
        _toggle = null;
        _mirror = null;
      }
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _toggle?.dispose(unsubscribe: true);
    _mirror?.dispose(unsubscribe: true);
    _toggle = null;
    _mirror = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.builder(context, isReady, _toggle?.exists ?? false, toggle);
}
