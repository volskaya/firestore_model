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
  Computed<bool>? _$deletedComputed;

  @override
  bool get deleted => (_$deletedComputed ??=
          Computed<bool>(() => super.deleted, name: '_FirestoreModel.deleted'))
      .value;
  Computed<bool>? _$isNewComputed;

  @override
  bool get isNew => (_$isNewComputed ??=
          Computed<bool>(() => super.isNew, name: '_FirestoreModel.isNew'))
      .value;

  final _$snapshotAtom = Atom(name: '_FirestoreModel.snapshot');

  @override
  DocumentSnapshot? get snapshot {
    _$snapshotAtom.reportRead();
    return super.snapshot;
  }

  @override
  set snapshot(DocumentSnapshot? value) {
    if (super.snapshot != value) {
      _$snapshotAtom.reportWrite(value, super.snapshot, () {
        super.snapshot = value;
      });
    }
  }

  final _$createTimeAtom = Atom(name: '_FirestoreModel.createTime');

  @JsonKey()
  @FirestoreTimestampConverterNullable()
  @override
  Timestamp? get createTime {
    _$createTimeAtom.reportRead();
    return super.createTime;
  }

  @JsonKey()
  @FirestoreTimestampConverterNullable()
  @override
  set createTime(Timestamp? value) {
    if (super.createTime != value) {
      _$createTimeAtom.reportWrite(value, super.createTime, () {
        super.createTime = value;
      });
    }
  }

  final _$updateTimeAtom = Atom(name: '_FirestoreModel.updateTime');

  @JsonKey()
  @FirestoreTimestampConverterNullable()
  @override
  Timestamp? get updateTime {
    _$updateTimeAtom.reportRead();
    return super.updateTime;
  }

  @JsonKey()
  @FirestoreTimestampConverterNullable()
  @override
  set updateTime(Timestamp? value) {
    if (super.updateTime != value) {
      _$updateTimeAtom.reportWrite(value, super.updateTime, () {
        super.updateTime = value;
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
createTime: ${createTime},
updateTime: ${updateTime},
exists: ${exists},
deleted: ${deleted},
isNew: ${isNew}
    ''';
  }
}
