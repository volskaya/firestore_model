// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'toggle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Toggle _$ToggleFromJson(Map json) {
  return Toggle()
    ..createTime =
        const FirestoreTimestampConverterNullable().fromJson(json['createTime'])
    ..updateTime = const FirestoreTimestampConverterNullable()
        .fromJson(json['updateTime']);
}

Map<String, dynamic> _$ToggleToJson(Toggle instance) => <String, dynamic>{
      'createTime': const FirestoreTimestampConverterNullable()
          .toJson(instance.createTime),
      'updateTime': const FirestoreTimestampConverterNullable()
          .toJson(instance.updateTime),
    };

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Toggle on _Toggle, Store {
  @override
  String toString() {
    return '''

    ''';
  }
}
