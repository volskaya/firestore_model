// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firestore_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FirestoreModel<T> on _FirestoreModel<T>, Store {
  final _$existsAtom = Atom(name: '_FirestoreModel.exists');

  @override
  bool? get exists {
    _$existsAtom.reportRead();
    return super.exists;
  }

  @override
  set exists(bool? value) {
    if (super.exists != value) {
      _$existsAtom.reportWrite(value, super.exists, () {
        super.exists = value;
      });
    }
  }

  final _$_FirestoreModelActionController =
      ActionController(name: '_FirestoreModel');

  @override
  void handleSnapshot(T model) {
    final _$actionInfo = _$_FirestoreModelActionController.startAction(
        name: '_FirestoreModel.handleSnapshot');
    try {
      return super.handleSnapshot(model);
    } finally {
      _$_FirestoreModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
exists: ${exists}
    ''';
  }
}
