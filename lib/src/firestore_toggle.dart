import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_model/firestore_model.dart';
import 'package:firestore_model/src/models/toggle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:log/log.dart';

/// Widget builder callback of [FirestoreToggle].
typedef ToggleBuilder = Widget Function(
  BuildContext context,
  bool ready,
  bool toggled,
  VoidCallback? handler,
);

/// Toggleable button, which is handled by adding or removing a document
/// to a firebase collection
class FirestoreToggle extends StatefulObserverWidget {
  /// Creates [FirestoreToggle].
  FirestoreToggle({
    Key? key,
    required this.builder,

    /// Subcollection of the [Toggle] documents.
    required CollectionReference toggle,

    /// ID of this toggle, usually users auth uid.
    required String id,

    /// Subcollection of [toggle] mirror. Like `dislikes` to `likes`.
    CollectionReference? mirror,

    /// Subcollection of duplicate [Toggle]s of [toggle].
    CollectionReference? duplicate,

    /// Subcollection of [duplicate] mirror.
    CollectionReference? duplicateMirror,
    this.enabled = true,
    this.countToggle = false,
    this.countDuplicate = false,
    this.createDuplicate = true,
    this.onToggled,
    this.onError,
    this.onToggleTransaction,
  })  : assert(mirror == null || mirror.path == toggle.path),
        assert(duplicateMirror == null || duplicateMirror.parent?.path == duplicate?.parent?.path),
        _parent = toggle.parent,
        _toggle = toggle.doc(id),
        _mirror = mirror?.doc(id),
        _duplicate = toggle.parent != null ? duplicate?.doc(toggle.parent!.id) : null,
        _duplicateParent = duplicate?.parent,
        _duplicateMirror = duplicate?.doc(mirror?.parent?.id),
        super(
          key: key,
          name: 'collection_toggle_observer',
        );

  /// [DocumentReference] where this [FirestoreToggle] will write data.
  final DocumentReference _toggle;

  /// Parent document of [toggle].
  final DocumentReference? _parent;

  /// [DocumentReference] where this [FirestoreToggle] will unset mirror toggles.
  final DocumentReference? _mirror;

  /// [DocumentReference] where this [FirestoreToggle] will write duplicate data.
  ///
  /// For example if [toggle] points to a, lets say, photo document, your [toggle]
  /// will be written to a subcollection in that photos document, but you would
  /// also want to maintain a users own collection of favorite photos. In that
  /// case this [duplicate] should point to a collection in the user document.
  final DocumentReference? _duplicate;

  /// Parent document of [duplicate]
  final DocumentReference? _duplicateParent;

  /// Mirror of [duplicate]
  final DocumentReference? _duplicateMirror;

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
  final ValueChanged<bool>? onToggled;

  /// Callback on toggle error.
  final void Function(bool toggled, Object error, StackTrace stacktrace)? onError;

  /// Operation in the middle of the toggle transaction.
  ///
  /// [shouldToggle] will indicate the new status of the toggle, if the transaction is successful.
  /// Returning true will intercept the transaction.
  final Future<bool> Function(Transaction transaction, bool shouldToggle)? onToggleTransaction;

  /// Whether this toggle should deliver events.
  ///
  /// For example disabled when the user is not authenticated.
  final bool enabled;

  @override
  _FirestoreToggleState createState() => _FirestoreToggleState();
}

class _FirestoreToggleState extends State<FirestoreToggle> {
  static final _log = Log.named('FirestoreToggle');

  Toggle? _toggle;
  Toggle? _mirror;

  bool get areTogglesReady => _toggle != null && (widget._mirror != null ? _mirror != null : true);
  bool get isReady => areTogglesReady;
  bool _transactionInProgress = false;

  /// Using a batch supports instant update on the UI, so this method is only
  /// enabled when [widget.onToggleTransaction] is NOT defined.
  Future<void> _usingBatch() async {
    assert(_toggle != null, 'Disable button until the toggle reference is ready');

    final shouldToggle = _toggle?.exists == false;
    final decrementMirror = shouldToggle && widget._mirror != null ? _mirror?.exists == true : false;
    final batch = FirebaseModel.store.batch();

    // Untoggle the mirror document.
    if (decrementMirror) {
      batch.delete(_mirror!.reference);
      if (widget._duplicateMirror != null && widget.createDuplicate) batch.delete(widget._duplicateMirror!);
    }

    _log.v('Toggling ${shouldToggle ? "on" : "off"} ${_toggle?.reference.path}');

    if (shouldToggle) {
      final data = <String, dynamic>{'createTime': FieldValue.serverTimestamp()};
      batch.set(_toggle!.reference, data);
      if (widget._duplicate != null && widget.createDuplicate) batch.set(widget._duplicate!, data);
    } else {
      batch.delete(_toggle!.reference);
      if (widget._duplicate != null && widget.createDuplicate) batch.delete(widget._duplicate!);
    }

    // Counter update for parent document
    if (widget.countToggle) {
      batch.update(
        widget._parent!,
        decrementMirror
            ? <String, dynamic>{
                'updateTime': FieldValue.serverTimestamp(),
                widget._toggle.parent.id: FieldValue.increment(1),
                widget._mirror!.parent.id: FieldValue.increment(-1),
              }
            : <String, dynamic>{
                'updateTime': FieldValue.serverTimestamp(),
                widget._toggle.parent.id: FieldValue.increment(!shouldToggle ? -1 : 1),
              },
      );
    }

    if (widget.countDuplicate && widget._duplicateParent != null) {
      batch.update(
        widget._duplicateParent!,
        decrementMirror && widget._duplicateMirror != null
            ? <String, dynamic>{
                'updateTime': FieldValue.serverTimestamp(),
                widget._duplicateParent!.id: FieldValue.increment(1),
                widget._duplicateMirror!.parent.id: FieldValue.increment(-1),
              }
            : <String, dynamic>{
                'updateTime': FieldValue.serverTimestamp(),
                widget._duplicateParent!.id: FieldValue.increment(!shouldToggle ? -1 : 1),
              },
      );
    }

    try {
      await batch.commit();
      widget.onToggled?.call(shouldToggle);
    } catch (e, t) {
      widget.onError?.call(_toggle?.exists ?? false, e, t);
      rethrow;
    }
  }

  /// Using a transaction won't support instant update on the UI, so this method is only
  /// enabled when [widget.onToggleTransaction] is defined.
  Future<void> _usingTransaction() async {
    assert(_toggle != null, 'Disable button until the toggle reference is ready');
    assert(!_transactionInProgress);

    setState(() => _transactionInProgress = true);

    try {
      final toggled = await FirebaseModel.store.runTransaction<bool?>((transaction) async {
        final toggle = await transaction.get(widget._toggle);
        final shouldToggle = !toggle.exists;
        final decrementMirror = shouldToggle && widget._mirror != null ? _mirror?.exists == true : false;
        final intercepted = await widget.onToggleTransaction?.call(transaction, shouldToggle) ?? false;

        if (intercepted) return null;

        if (decrementMirror) {
          transaction.delete(_mirror!.reference);
          if (widget._duplicateMirror != null && widget.createDuplicate) transaction.delete(widget._duplicateMirror!);
        }

        _log.v('Toggling ${shouldToggle ? "on" : "off"} ${_toggle!.reference.path}');

        if (shouldToggle) {
          final data = <String, dynamic>{'createTime': FieldValue.serverTimestamp()};
          transaction.set(_toggle!.reference, data);
          if (widget._duplicate != null && widget.createDuplicate) transaction.set(widget._duplicate!, data);
        } else {
          transaction.delete(_toggle!.reference);
          if (widget._duplicate != null && widget.createDuplicate) transaction.delete(widget._duplicate!);
        }

        // Counter update for parent document
        if (widget.countToggle && widget._parent != null) {
          transaction.update(
            widget._parent!,
            decrementMirror
                ? <String, dynamic>{
                    'updateTime': FieldValue.serverTimestamp(),
                    widget._toggle.parent.id: FieldValue.increment(1),
                    widget._mirror!.parent.id: FieldValue.increment(-1),
                  }
                : <String, dynamic>{
                    'updateTime': FieldValue.serverTimestamp(),
                    widget._toggle.parent.id: FieldValue.increment(!shouldToggle ? -1 : 1),
                  },
          );
        }

        if (widget.countDuplicate && widget._duplicateParent != null) {
          transaction.update(
            widget._duplicateParent!,
            decrementMirror && widget._duplicateMirror != null
                ? <String, dynamic>{
                    'updateTime': FieldValue.serverTimestamp(),
                    widget._duplicateParent!.id: FieldValue.increment(1),
                    widget._duplicateMirror!.parent.id: FieldValue.increment(-1),
                  }
                : <String, dynamic>{
                    'updateTime': FieldValue.serverTimestamp(),
                    widget._duplicate!.parent.id: FieldValue.increment(!shouldToggle ? -1 : 1),
                  },
          );
        }

        return shouldToggle;
      });

      if (toggled != null) widget.onToggled?.call(toggled);
    } catch (e, t) {
      widget.onError?.call(_toggle?.exists ?? false, e, t);
      rethrow;
    } finally {
      setState(() => _transactionInProgress = false);
    }
  }

  Future<void> toggle() async {
    assert(isReady);
    if (widget.onToggleTransaction != null) {
      await _usingTransaction();
    } else {
      await _usingBatch();
    }
  }

  Future<void> _deferredState() async {
    if (!widget.enabled) return; // Deferred too late

    final toggleRef = widget._toggle;
    final mirrorRef = widget._mirror;

    final models = await Future.wait([
      FirestoreModel.from<Toggle>(toggleRef, subscribe: true),
      if (mirrorRef != null) FirestoreModel.from<Toggle>(mirrorRef, subscribe: true),
    ]);

    final toggle = models.first;
    final mirror = mirrorRef != null ? models[1] : null;
    final stillRelevant = toggleRef.path == widget._toggle.path && mirrorRef?.path == widget._mirror?.path;

    if (mounted && stillRelevant) {
      setState(() {
        _toggle = toggle;
        _mirror = mirror;
      });
    } else {
      toggle.dispose(unsubscribe: true);
      mirror?.dispose(unsubscribe: true);
    }
  }

  @override
  void initState() {
    if (widget.enabled) _deferredState();
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
  Widget build(BuildContext context) => widget.builder(
        context,
        isReady,
        _toggle?.exists ?? false,
        !_transactionInProgress ? toggle : null,
      );
}
