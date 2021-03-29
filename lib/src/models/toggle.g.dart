// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'toggle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Toggle _$ToggleFromJson(Map json) {
  return Toggle()
    ..createTime = const FirestoreTimestampConverterNullable()
        .fromJson(json['createTime']);
}

Map<String, dynamic> _$ToggleToJson(Toggle instance) => <String, dynamic>{
      'createTime': const FirestoreTimestampConverterNullable()
          .toJson(instance.createTime),
    };

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Toggle on _Toggle, Store {
  final _$createTimeAtom = Atom(name: '_Toggle.createTime');

  @override
  Timestamp? get createTime {
    _$createTimeAtom.reportRead();
    return super.createTime;
  }

  @override
  set createTime(Timestamp? value) {
    if (super.createTime != value) {
      _$createTimeAtom.reportWrite(value, super.createTime, () {
        super.createTime = value;
      });
    }
  }

  @override
  String toString() {
    return '''
createTime: ${createTime}
    ''';
  }
}
