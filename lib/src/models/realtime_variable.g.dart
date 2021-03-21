// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'realtime_variable.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RealtimeVariable on _RealtimeVariable, Store {
  final _$valueAtom = Atom(name: '_RealtimeVariable.value');

  @override
  dynamic get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(dynamic value) {
    if (super.value != value) {
      _$valueAtom.reportWrite<dynamic>(value, super.value, () {
        super.value = value;
      });
    }
  }

  final _$_RealtimeVariableActionController =
      ActionController(name: '_RealtimeVariable');

  @override
  void onSnapshot(RealtimeVariable x) {
    final _$actionInfo = _$_RealtimeVariableActionController.startAction(
        name: '_RealtimeVariable.onSnapshot');
    try {
      return super.onSnapshot(x);
    } finally {
      _$_RealtimeVariableActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
