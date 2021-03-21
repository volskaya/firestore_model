// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'toggle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Toggle _$ToggleFromJson(Map json) {
  return Toggle()
    ..createTime =
        const FirestoreTimestampConverter().fromJson(json['createTime'])
    ..updateTime =
        const FirestoreTimestampConverter().fromJson(json['updateTime']);
}

Map<String, dynamic> _$ToggleToJson(Toggle instance) => <String, dynamic>{
      'createTime':
          const FirestoreTimestampConverter().toJson(instance.createTime),
      'updateTime':
          const FirestoreTimestampConverter().toJson(instance.updateTime),
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
