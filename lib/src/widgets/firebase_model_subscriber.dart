import 'package:firestore_model/src/firebase_model.dart';
import 'package:flutter/material.dart';

/// Lightweight proxy widget that will subscribe to the passed [FirebaseModel]
/// while mounted.
class FirebaseModelSubscriber extends ProxyWidget {
  /// Creates [FirebaseModelSubscriber].
  const FirebaseModelSubscriber({
    required this.model,
    required Widget child,
    this.subscribe = true,
  }) : super(child: child);

  /// The model [FirebaseModelSubscriber] will subscribe to.
  final FirebaseModel model;

  /// Optional toggle of the subscription.
  ///
  /// This is only checked when the element is first mounted.
  final bool subscribe;

  @override
  Element createElement() => _Element(model: model, widget: this);
}

class _Element extends ProxyElement {
  _Element({
    required ProxyWidget widget,
    required this.model,
    this.subscribe = true,
  }) : super(widget);

  final FirebaseModel model;
  final bool subscribe;

  bool _mounted = false;
  bool _subscribed = false;

  void _unsubscribe() {
    assert(_subscribed);
    model.unsubscribe();
    _subscribed = false;
  }

  Future<void> _subscribe() async {
    await model.subscribe();
    _subscribed = true;
    if (!_mounted) _unsubscribe();
  }

  @override
  void notifyClients(covariant ProxyWidget oldWidget) {}

  @override
  void mount(Element? parent, dynamic newSlot) {
    super.mount(parent, newSlot);
    _mounted = true;
    _subscribe();
  }

  @override
  void unmount() {
    if (_subscribed) _unsubscribe();
    super.unmount();
  }
}
