import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// Provides non-leaking access to a [BuildContext].
///
/// A [BuildContext] is only valid if it is pointing to an active [Element].
/// Once the [Element] is unmounted, the [BuildContext] should not be accessed
/// further. This class makes it possible for a [StatefulWidget] to share its
/// build context safely with other objects.
///
/// Creators of this object must guarantee the following:
///
///   1. They create this object at or after [State.initState] but before
///      [State.dispose]. In particular, do not attempt to create this from the
///      constructor of a state.
///   2. They call [dispose] from [State.dispose].
///
/// This object will not hold on to the [State] after disposal.
class DisposableHookContext {
  /// Creates an object that provides access to a [BuildContext] without leaking
  /// a [State].
  ///
  /// Creators must call [dispose] when the [State] is disposed.
  ///
  /// The [State] must not be null, and [State.mounted] must be true.
  DisposableHookContext(this._state) : assert(_state != null);

  HookState? _state;

  /// Provides safe access to the build context.
  ///
  /// If [dispose] has been called, will return null.
  ///
  /// Otherwise, asserts the [_state] is still mounted and returns its context.
  BuildContext? get context => _state == null ? null : _state?.context; // ignore:invalid_use_of_protected_member

  /// Marks the [BuildContext] as disposed.
  ///
  /// Creators of this object must call [dispose] when their [Element] is
  /// unmounted, i.e. when [State.dispose] is called.
  void dispose() {
    _state = null;
  }
}
