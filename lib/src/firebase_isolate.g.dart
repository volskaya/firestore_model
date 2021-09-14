// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_isolate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FirebaseIsolateSnapshotData _$$_FirebaseIsolateSnapshotDataFromJson(
        Map json) =>
    _$_FirebaseIsolateSnapshotData(
      id: json['id'] as String,
      path: json['path'] as String,
      exists: json['exists'] as bool,
      data: (json['data'] as Map?)?.map(
            (k, e) => MapEntry(k as String, e),
          ) ??
          const <String, dynamic>{},
    );

Map<String, dynamic> _$$_FirebaseIsolateSnapshotDataToJson(
        _$_FirebaseIsolateSnapshotData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'path': instance.path,
      'exists': instance.exists,
      'data': instance.data,
    };

_$_QueryOrder _$$_QueryOrderFromJson(Map json) => _$_QueryOrder(
      json['name'] as String,
      descending: json['descending'] as bool? ?? false,
    );

Map<String, dynamic> _$$_QueryOrderToJson(_$_QueryOrder instance) =>
    <String, dynamic>{
      'name': instance.name,
      'descending': instance.descending,
    };

_$_QueryOrderUserId _$$_QueryOrderUserIdFromJson(Map json) =>
    _$_QueryOrderUserId();

Map<String, dynamic> _$$_QueryOrderUserIdToJson(_$_QueryOrderUserId instance) =>
    <String, dynamic>{};

_$_QueryOrderFieldPath _$$_QueryOrderFieldPathFromJson(Map json) =>
    _$_QueryOrderFieldPath(
      _$enumDecode(_$QueryFieldPathEnumMap, json['path']),
      descending: json['descending'] as bool? ?? false,
    );

Map<String, dynamic> _$$_QueryOrderFieldPathToJson(
        _$_QueryOrderFieldPath instance) =>
    <String, dynamic>{
      'path': _$QueryFieldPathEnumMap[instance.path],
      'descending': instance.descending,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$QueryFieldPathEnumMap = {
  QueryFieldPath.documentId: 0,
};

_$_QueryValue _$$_QueryValueFromJson(Map json) => _$_QueryValue(
      json['value'] as Object,
    );

Map<String, dynamic> _$$_QueryValueToJson(_$_QueryValue instance) =>
    <String, dynamic>{
      'value': instance.value,
    };

_$_QueryValueTimestamp _$$_QueryValueTimestampFromJson(Map json) =>
    _$_QueryValueTimestamp(
      const TimestampCJ().fromJson(json['timestamp']),
    );

Map<String, dynamic> _$$_QueryValueTimestampToJson(
        _$_QueryValueTimestamp instance) =>
    <String, dynamic>{
      'timestamp': const TimestampCJ().toJson(instance.timestamp),
    };

_$_QueryValuesStartAfter _$$_QueryValuesStartAfterFromJson(Map json) =>
    _$_QueryValuesStartAfter(
      (json['values'] as List<dynamic>)
          .map((e) => QueryValue.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$_QueryValuesStartAfterToJson(
        _$_QueryValuesStartAfter instance) =>
    <String, dynamic>{
      'values': instance.values.map((e) => e.toJson()).toList(),
    };

_$_QueryValuesStartBefore _$$_QueryValuesStartBeforeFromJson(Map json) =>
    _$_QueryValuesStartBefore(
      (json['values'] as List<dynamic>)
          .map((e) => QueryValue.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$_QueryValuesStartBeforeToJson(
        _$_QueryValuesStartBefore instance) =>
    <String, dynamic>{
      'values': instance.values.map((e) => e.toJson()).toList(),
    };

_$_QueryValuesStartNone _$$_QueryValuesStartNoneFromJson(Map json) =>
    _$_QueryValuesStartNone();

Map<String, dynamic> _$$_QueryValuesStartNoneToJson(
        _$_QueryValuesStartNone instance) =>
    <String, dynamic>{};

_$_QueryFieldIsEqualTo _$$_QueryFieldIsEqualToFromJson(Map json) =>
    _$_QueryFieldIsEqualTo(
      json['field'] as String,
      json['value'],
    );

Map<String, dynamic> _$$_QueryFieldIsEqualToToJson(
        _$_QueryFieldIsEqualTo instance) =>
    <String, dynamic>{
      'field': instance.field,
      'value': instance.value,
    };

_$_QueryFieldIsNotEqualTo _$$_QueryFieldIsNotEqualToFromJson(Map json) =>
    _$_QueryFieldIsNotEqualTo(
      json['field'] as String,
      json['value'],
    );

Map<String, dynamic> _$$_QueryFieldIsNotEqualToToJson(
        _$_QueryFieldIsNotEqualTo instance) =>
    <String, dynamic>{
      'field': instance.field,
      'value': instance.value,
    };

_$_QueryFieldIsLessThan _$$_QueryFieldIsLessThanFromJson(Map json) =>
    _$_QueryFieldIsLessThan(
      json['field'] as String,
      json['value'],
    );

Map<String, dynamic> _$$_QueryFieldIsLessThanToJson(
        _$_QueryFieldIsLessThan instance) =>
    <String, dynamic>{
      'field': instance.field,
      'value': instance.value,
    };

_$_QueryFieldIsLessThanOrEqualTo _$$_QueryFieldIsLessThanOrEqualToFromJson(
        Map json) =>
    _$_QueryFieldIsLessThanOrEqualTo(
      json['field'] as String,
      json['value'],
    );

Map<String, dynamic> _$$_QueryFieldIsLessThanOrEqualToToJson(
        _$_QueryFieldIsLessThanOrEqualTo instance) =>
    <String, dynamic>{
      'field': instance.field,
      'value': instance.value,
    };

_$_QueryFieldIsGreaterThan _$$_QueryFieldIsGreaterThanFromJson(Map json) =>
    _$_QueryFieldIsGreaterThan(
      json['field'] as String,
      json['value'],
    );

Map<String, dynamic> _$$_QueryFieldIsGreaterThanToJson(
        _$_QueryFieldIsGreaterThan instance) =>
    <String, dynamic>{
      'field': instance.field,
      'value': instance.value,
    };

_$_QueryFieldIsGreaterThanOrEqualTo
    _$$_QueryFieldIsGreaterThanOrEqualToFromJson(Map json) =>
        _$_QueryFieldIsGreaterThanOrEqualTo(
          json['field'] as String,
          json['value'],
        );

Map<String, dynamic> _$$_QueryFieldIsGreaterThanOrEqualToToJson(
        _$_QueryFieldIsGreaterThanOrEqualTo instance) =>
    <String, dynamic>{
      'field': instance.field,
      'value': instance.value,
    };

_$_QueryFieldArrayContains _$$_QueryFieldArrayContainsFromJson(Map json) =>
    _$_QueryFieldArrayContains(
      json['field'] as String,
      json['value'],
    );

Map<String, dynamic> _$$_QueryFieldArrayContainsToJson(
        _$_QueryFieldArrayContains instance) =>
    <String, dynamic>{
      'field': instance.field,
      'value': instance.value,
    };

_$_QueryFieldArrayContainsAny _$$_QueryFieldArrayContainsAnyFromJson(
        Map json) =>
    _$_QueryFieldArrayContainsAny(
      json['field'] as String,
      json['value'] as List<dynamic>?,
    );

Map<String, dynamic> _$$_QueryFieldArrayContainsAnyToJson(
        _$_QueryFieldArrayContainsAny instance) =>
    <String, dynamic>{
      'field': instance.field,
      'value': instance.value,
    };

_$_QueryFieldWhereIn _$$_QueryFieldWhereInFromJson(Map json) =>
    _$_QueryFieldWhereIn(
      json['field'] as String,
      json['value'] as List<dynamic>?,
    );

Map<String, dynamic> _$$_QueryFieldWhereInToJson(
        _$_QueryFieldWhereIn instance) =>
    <String, dynamic>{
      'field': instance.field,
      'value': instance.value,
    };

_$_QueryFieldWhereNotIn _$$_QueryFieldWhereNotInFromJson(Map json) =>
    _$_QueryFieldWhereNotIn(
      json['field'] as String,
      json['value'] as List<dynamic>?,
    );

Map<String, dynamic> _$$_QueryFieldWhereNotInToJson(
        _$_QueryFieldWhereNotIn instance) =>
    <String, dynamic>{
      'field': instance.field,
      'value': instance.value,
    };

_$_QueryFieldIsNull _$$_QueryFieldIsNullFromJson(Map json) =>
    _$_QueryFieldIsNull(
      json['field'] as String,
      json['value'] as bool,
    );

Map<String, dynamic> _$$_QueryFieldIsNullToJson(_$_QueryFieldIsNull instance) =>
    <String, dynamic>{
      'field': instance.field,
      'value': instance.value,
    };

_$_FirebaseIsolateBaseQuery _$$_FirebaseIsolateBaseQueryFromJson(Map json) =>
    _$_FirebaseIsolateBaseQuery(
      collectionPath: json['collectionPath'] as String,
      fields: (json['fields'] as List<dynamic>)
          .map((e) => QueryField.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$_FirebaseIsolateBaseQueryToJson(
        _$_FirebaseIsolateBaseQuery instance) =>
    <String, dynamic>{
      'collectionPath': instance.collectionPath,
      'fields': instance.fields.map((e) => e.toJson()).toList(),
    };

_$_FirebaseIsolateQuery _$$_FirebaseIsolateQueryFromJson(Map json) =>
    _$_FirebaseIsolateQuery(
      base: FirebaseIsolateBaseQuery.fromJson(
          Map<String, dynamic>.from(json['base'] as Map)),
      orders: (json['orders'] as List<dynamic>)
          .map((e) => QueryOrder.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      values: QueryValues.fromJson(
          Map<String, dynamic>.from(json['values'] as Map)),
      limit: json['limit'] as int?,
    );

Map<String, dynamic> _$$_FirebaseIsolateQueryToJson(
        _$_FirebaseIsolateQuery instance) =>
    <String, dynamic>{
      'base': instance.base.toJson(),
      'orders': instance.orders.map((e) => e.toJson()).toList(),
      'values': instance.values.toJson(),
      'limit': instance.limit,
    };

_$_FirebaseIsolateRequestGet _$$_FirebaseIsolateRequestGetFromJson(Map json) =>
    _$_FirebaseIsolateRequestGet(
      json['path'] as String,
    );

Map<String, dynamic> _$$_FirebaseIsolateRequestGetToJson(
        _$_FirebaseIsolateRequestGet instance) =>
    <String, dynamic>{
      'path': instance.path,
    };

_$_FirebaseIsolateRequestQuery _$$_FirebaseIsolateRequestQueryFromJson(
        Map json) =>
    _$_FirebaseIsolateRequestQuery(
      path: json['path'] as String,
      query: FirebaseIsolateQuery.fromJson(
          Map<String, dynamic>.from(json['query'] as Map)),
    );

Map<String, dynamic> _$$_FirebaseIsolateRequestQueryToJson(
        _$_FirebaseIsolateRequestQuery instance) =>
    <String, dynamic>{
      'path': instance.path,
      'query': instance.query.toJson(),
    };

_$_FirebaseIsolateResponseGet _$$_FirebaseIsolateResponseGetFromJson(
        Map json) =>
    _$_FirebaseIsolateResponseGet(
      key: json['key'] as String,
      snapshot: FirebaseIsolateSnapshotData.fromJson(
          Map<String, dynamic>.from(json['snapshot'] as Map)),
    );

Map<String, dynamic> _$$_FirebaseIsolateResponseGetToJson(
        _$_FirebaseIsolateResponseGet instance) =>
    <String, dynamic>{
      'key': instance.key,
      'snapshot': instance.snapshot.toJson(),
    };

_$_FirebaseIsolateResponseQuery _$$_FirebaseIsolateResponseQueryFromJson(
        Map json) =>
    _$_FirebaseIsolateResponseQuery(
      key: json['key'] as String,
      snapshots: (json['snapshots'] as List<dynamic>)
          .map((e) => FirebaseIsolateSnapshotData.fromJson(
              Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$_FirebaseIsolateResponseQueryToJson(
        _$_FirebaseIsolateResponseQuery instance) =>
    <String, dynamic>{
      'key': instance.key,
      'snapshots': instance.snapshots.map((e) => e.toJson()).toList(),
    };
