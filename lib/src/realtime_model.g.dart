// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'realtime_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RealtimeModel<T> on _RealtimeModel<T>, Store {
  Computed<bool> _$existsComputed;

  @override
  bool get exists => (_$existsComputed ??=
          Computed<bool>(() => super.exists, name: '_RealtimeModel.exists'))
      .value;

  final _$snapshotAtom = Atom(name: '_RealtimeModel.snapshot');

  @override
  DataSnapshot get snapshot {
    _$snapshotAtom.reportRead();
    return super.snapshot;
  }

  @override
  set snapshot(DataSnapshot value) {
    _$snapshotAtom.reportWrite(value, super.snapshot, () {
      super.snapshot = value;
    });
  }

  final _$_RealtimeModelActionController =
      ActionController(name: '_RealtimeModel');

  @override
  void handleSnapshot(T model) {
    final _$actionInfo = _$_RealtimeModelActionController.startAction(
        name: '_RealtimeModel.handleSnapshot');
    try {
      return super.handleSnapshot(model);
    } finally {
      _$_RealtimeModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
snapshot: ${snapshot},
exists: ${exists}
    ''';
  }
}
