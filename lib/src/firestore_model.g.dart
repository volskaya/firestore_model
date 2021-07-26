// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firestore_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FirestoreModel<T> on _FirestoreModel<T>, Store {
  Computed<bool?>? _$existsComputed;

  @override
  bool? get exists => (_$existsComputed ??=
          Computed<bool?>(() => super.exists, name: '_FirestoreModel.exists'))
      .value;

  final _$snapshotAtom = Atom(name: '_FirestoreModel.snapshot');

  @override
  DocumentSnapshot<Object?>? get snapshot {
    _$snapshotAtom.reportRead();
    return super.snapshot;
  }

  @override
  set snapshot(DocumentSnapshot<Object?>? value) {
    if (super.snapshot != value) {
      _$snapshotAtom.reportWrite(value, super.snapshot, () {
        super.snapshot = value;
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
snapshot: ${snapshot},
exists: ${exists}
    ''';
  }
}
