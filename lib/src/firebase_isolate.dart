// ignore_for_file: invalid_annotation_target,import_of_legacy_library_into_null_safe

import 'dart:async';
import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firedart/firedart.dart';
import 'package:firedart/firestore/firestore_gateway.dart';
import 'package:flutter/scheduler.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isolate_handler/isolate_handler.dart';

part 'firebase_isolate.freezed.dart';
part 'firebase_isolate.g.dart';

enum QueryFieldPath {
  @JsonValue(0) documentId,
}

class TimestampCJ implements JsonConverter<Timestamp, dynamic> {
  /// Creates [TimestampCJ].
  const TimestampCJ();

  /// Convert json to firestore [Timestamp].
  @override
  Timestamp fromJson(dynamic json) {
    if (json is Timestamp) {
      return json;
    } else if (json is num) {
      return Timestamp.fromMillisecondsSinceEpoch(json.toInt());
    } else if (json is Map<String, dynamic>) {
      final seconds = json['_seconds'] as int?;
      final nanoseconds = json['_nanoseconds'] as int?;

      return Timestamp(seconds ?? 0, nanoseconds ?? 0);
    }

    return Timestamp(0, 0);
  }

  @override
  dynamic toJson(Timestamp object) => object.millisecondsSinceEpoch;
}

@freezed
class FirebaseIsolateSnapshotData with _$FirebaseIsolateSnapshotData {
  const factory FirebaseIsolateSnapshotData({
    @JsonKey() required String id,
    @JsonKey() required String path,
    @JsonKey() required bool exists,
    @JsonKey() @Default(<String, dynamic>{}) Map<String, dynamic> data,
  }) = _FirebaseIsolateSnapshotData;

  factory FirebaseIsolateSnapshotData.fromJson(Map<String, dynamic> json) =>
      _$FirebaseIsolateSnapshotDataFromJson(json);
}

@freezed
class QueryOrder with _$QueryOrder {
  const factory QueryOrder(
    @JsonKey() String name, {
    @JsonKey() @Default(false) bool descending,
  }) = _QueryOrder;

  const factory QueryOrder.userId() = _QueryOrderUserId;
  const factory QueryOrder.fieldPath(
    @JsonKey() QueryFieldPath path, {
    @JsonKey() @Default(false) bool descending,
  }) = _QueryOrderFieldPath;

  factory QueryOrder.fromJson(Map<String, dynamic> json) => _$QueryOrderFromJson(json);
}

@freezed
class QueryValue with _$QueryValue {
  factory QueryValue(@JsonKey() Object value) = _QueryValue;
  factory QueryValue.timestamp(@JsonKey() @TimestampCJ() Timestamp timestamp) = _QueryValueTimestamp;

  QueryValue._();
  factory QueryValue.fromJson(Map<String, dynamic> json) => _$QueryValueFromJson(json);

  late final Object effectiveValue = map(
    (v) => v.value,
    timestamp: (v) => v.timestamp,
  );
}

@freezed
class QueryValues with _$QueryValues {
  const factory QueryValues.startAfter(@JsonKey() List<QueryValue> values) = _QueryValuesStartAfter;
  const factory QueryValues.startBefore(@JsonKey() List<QueryValue> values) = _QueryValuesStartBefore;
  const factory QueryValues.none() = _QueryValuesStartNone;

  const QueryValues._();
  factory QueryValues.fromJson(Map<String, dynamic> json) => _$QueryValuesFromJson(json);

  Query apply(Query query) {
    final values = map(
      startAfter: (v) => v.values.map((e) => e.effectiveValue).toList(growable: false),
      startBefore: (v) => v.values.map((e) => e.effectiveValue).toList(growable: false),
      none: (_) => const <dynamic>[],
    );

    return map(
      startAfter: (v) => values.isNotEmpty ? query.startAfter(values) : query,
      startBefore: (v) => values.isNotEmpty ? query.startAt(values) : query,
      none: (_) => query,
    );
  }

  QueryReference applyTo(QueryReference query) {
    final values = map(
      startAfter: (v) => v.values.map((e) => e.effectiveValue).toList(growable: false),
      startBefore: (v) => v.values.map((e) => e.effectiveValue).toList(growable: false),
      none: (_) => const <dynamic>[],
    );

    return map(
      startAfter: (v) => values.isNotEmpty ? query.startAfter(values) : query,
      // startBefore: (v) => values.isNotEmpty ? query.startAt(values) : query,
      startBefore: (v) => throw UnimplementedError(),
      none: (_) => query,
    );
  }
}

@freezed
class QueryField with _$QueryField {
  const factory QueryField.isEqualTo(@JsonKey() String field, @JsonKey() Object? value) = _QueryFieldIsEqualTo;
  const factory QueryField.isNotEqualTo(@JsonKey() String field, @JsonKey() Object? value) = _QueryFieldIsNotEqualTo;
  const factory QueryField.isLessThan(@JsonKey() String field, @JsonKey() Object? value) = _QueryFieldIsLessThan;
  const factory QueryField.isLessThanOrEqualTo(@JsonKey() String field, @JsonKey() Object? value) =
      _QueryFieldIsLessThanOrEqualTo;
  const factory QueryField.isGreaterThan(@JsonKey() String field, @JsonKey() Object? value) = _QueryFieldIsGreaterThan;
  const factory QueryField.isGreaterThanOrEqualTo(@JsonKey() String field, @JsonKey() Object? value) =
      _QueryFieldIsGreaterThanOrEqualTo;
  const factory QueryField.arrayContains(@JsonKey() String field, @JsonKey() Object? value) = _QueryFieldArrayContains;
  const factory QueryField.arrayContainsAny(@JsonKey() String field, @JsonKey() List<Object?>? value) =
      _QueryFieldArrayContainsAny;
  const factory QueryField.whereIn(@JsonKey() String field, @JsonKey() List<Object?>? value) = _QueryFieldWhereIn;
  const factory QueryField.whereNotIn(@JsonKey() String field, @JsonKey() List<Object?>? value) = _QueryFieldWhereNotIn;
  const factory QueryField.isNull(@JsonKey() String field, @JsonKey() bool value) = _QueryFieldIsNull;

  const QueryField._();
  factory QueryField.fromJson(Map<String, dynamic> json) => _$QueryFieldFromJson(json);

  Query apply(Query query) => map(
        isEqualTo: (v) => query.where(field, isEqualTo: v.value),
        isNotEqualTo: (v) => query.where(field, isNotEqualTo: v.value),
        isLessThan: (v) => query.where(field, isLessThan: v.value),
        isLessThanOrEqualTo: (v) => query.where(field, isLessThanOrEqualTo: v.value),
        isGreaterThan: (v) => query.where(field, isGreaterThan: v.value),
        isGreaterThanOrEqualTo: (v) => query.where(field, isGreaterThanOrEqualTo: v.value),
        arrayContains: (v) => query.where(field, arrayContains: v.value),
        arrayContainsAny: (v) => query.where(field, arrayContainsAny: v.value),
        whereIn: (v) => query.where(field, whereIn: v.value),
        whereNotIn: (v) => query.where(field, whereNotIn: v.value),
        isNull: (v) => query.where(field, isNull: v.value),
      );

  QueryReference applyTo(QueryReference query) => maybeMap(
        isEqualTo: (v) => query.where(field, isEqualTo: v.value),
        // isNotEqualTo: (v) => query.where(field, isNotEqualTo: v.value),
        isLessThan: (v) => query.where(field, isLessThan: v.value),
        isLessThanOrEqualTo: (v) => query.where(field, isLessThanOrEqualTo: v.value),
        isGreaterThan: (v) => query.where(field, isGreaterThan: v.value),
        isGreaterThanOrEqualTo: (v) => query.where(field, isGreaterThanOrEqualTo: v.value),
        arrayContains: (v) => query.where(field, arrayContains: v.value),
        arrayContainsAny: (v) => query.where(field, arrayContainsAny: v.value),
        whereIn: (v) => query.where(field, whereIn: v.value),
        // whereNotIn: (v) => query.where(field, whereNotIn: v.value),
        isNull: (v) => query.where(field, isNull: v.value),
        orElse: () => throw UnimplementedError(),
      );
}

@freezed
class FirebaseIsolateBaseQuery with _$FirebaseIsolateBaseQuery {
  const factory FirebaseIsolateBaseQuery({
    @JsonKey() required String collectionPath,
    @JsonKey() required List<QueryField> fields,
  }) = _FirebaseIsolateBaseQuery;

  const FirebaseIsolateBaseQuery._();
  factory FirebaseIsolateBaseQuery.fromJson(Map<String, dynamic> json) => _$FirebaseIsolateBaseQueryFromJson(json);

  Query apply(Query _query) {
    Query query = FirebaseFirestore.instance.collection(collectionPath);
    for (final field in fields) query = field.apply(query);
    return query;
  }

  QueryReference applyTo(QueryReference _query) {
    QueryReference query = _query;
    for (final field in fields) query = field.applyTo(query);
    return query;
  }
}

@freezed
class FirebaseIsolateQuery with _$FirebaseIsolateQuery {
  const factory FirebaseIsolateQuery({
    @JsonKey() required FirebaseIsolateBaseQuery base,
    @JsonKey() required List<QueryOrder> orders,
    @JsonKey() required QueryValues values,
    @JsonKey() int? limit,
  }) = _FirebaseIsolateQuery;

  const FirebaseIsolateQuery._();
  factory FirebaseIsolateQuery.fromJson(Map<String, dynamic> json) => _$FirebaseIsolateQueryFromJson(json);

  Query construct() {
    Query query = FirebaseFirestore.instance.collection(base.collectionPath);

    query = base.apply(query);
    query = orders.apply(query);
    query = values.apply(query);

    if (limit != null) query = query.limit(limit!);
    return query;
  }

  QueryReference build() {
    // final token = await firebase.FirebaseAuth.instance.currentUser?.getIdToken();
    // final projectId = Firestore.instance.gateway.projectId;
    final gateway = FirestoreGateway('napy-app');
    QueryReference query = QueryReference(gateway, base.collectionPath);

    query = base.applyTo(query);
    query = orders.applyTo(query);
    query = values.applyTo(query);

    if (limit != null) query = query.limit(limit!);
    return query;
  }

  Query apply(Query _query) {
    Query query = _query;

    for (final order in orders) {
      order.map(
        (v) => query = query.orderBy(v.name, descending: v.descending),
        userId: (v) => query = query.orderBy(FieldPath.documentId, descending: true),
        fieldPath: (v) {
          final Object path;
          switch (v.path) {
            case QueryFieldPath.documentId:
              path = FieldPath.documentId;
              break;
          }
          return query = query.orderBy(path, descending: v.descending);
        },
      );
    }

    query = values.apply(query);
    if (limit != null) query = query.limit(limit!);

    return query;
  }
}

@freezed
class FirebaseIsolateRequest with _$FirebaseIsolateRequest {
  factory FirebaseIsolateRequest.get(@JsonKey() String path) = _FirebaseIsolateRequestGet;
  factory FirebaseIsolateRequest.query({
    @JsonKey() required String path, // Collection path.
    @JsonKey() required FirebaseIsolateQuery query,
  }) = _FirebaseIsolateRequestQuery;

  FirebaseIsolateRequest._();

  factory FirebaseIsolateRequest.fromJson(Map<String, dynamic> json) => _$FirebaseIsolateRequestFromJson(json);

  late final String key = map(
    get: (v) => v.path,
    query: (v) => v.path,
  );

  void send() => FirebaseIsolate.instance.isolates.send(toJson(), to: 'fetchDocument');
}

@freezed
class FirebaseIsolateResponse with _$FirebaseIsolateResponse {
  factory FirebaseIsolateResponse.get({
    @JsonKey() required String key,
    @JsonKey() required FirebaseIsolateSnapshotData snapshot,
  }) = _FirebaseIsolateResponseGet;

  factory FirebaseIsolateResponse.query({
    @JsonKey() required String key,
    @JsonKey() required List<FirebaseIsolateSnapshotData> snapshots,
  }) = _FirebaseIsolateResponseQuery;

  FirebaseIsolateResponse._();

  factory FirebaseIsolateResponse.fromJson(Map<String, dynamic> json) => _$FirebaseIsolateResponseFromJson(json);

  void send(HandledIsolateMessenger messenger) => messenger.send(toJson());

  @override late final String key = map(
    get: (v) => v.key,
    query: (v) => v.key,
  );
}

Future entryPoint(Map<String, dynamic> context) async {
  await Firebase.initializeApp();
  final messenger = HandledIsolate.initialize(context);

  messenger.listen((dynamic _request) async {
    final request = FirebaseIsolateRequest.fromJson(_request as Map<String, dynamic>);

    await request.map(
      get: (v) async {
        final reference = FirebaseFirestore.instance.doc(v.path);
        try {
          final snapshot = await reference.get();
          final data = FirebaseIsolateSnapshotData(
            id: snapshot.reference.id,
            path: snapshot.reference.path,
            exists: snapshot.exists,
            data: snapshot.data() ?? const <String, dynamic>{},
          );

          FirebaseIsolateResponse.get(key: v.path, snapshot: data).send(messenger);
        } catch (_) {
          final data = FirebaseIsolateSnapshotData(
            id: reference.id,
            path: reference.path,
            exists: false,
            data: const <String, dynamic>{},
          );

          FirebaseIsolateResponse.get(key: v.path, snapshot: data).send(messenger);
          rethrow;
        }
      },
      query: (v) async {
        final query = v.query.construct();
        QuerySnapshot? snapshots;
        try {
          snapshots = await query.get();
        } finally {
          final data = snapshots?.docs
                  .map(
                    (snapshot) => FirebaseIsolateSnapshotData(
                      id: snapshot.reference.id,
                      path: snapshot.reference.path,
                      exists: snapshot.exists,
                      data: (snapshot.data() as Map<String, dynamic>?) ?? const <String, dynamic>{},
                    ),
                  )
                  .toList(growable: false) ??
              const <FirebaseIsolateSnapshotData>[];

          FirebaseIsolateResponse.query(key: v.path, snapshots: data).send(messenger);
        }
      },
    );
  });
}

class FirebaseIsolate {
  static final instance = FirebaseIsolate();
  static final completers = HashMap<String, Completer<FirebaseIsolateResponse>>();

  static Future completeCompleter(Map<String, dynamic> data) async {
    final runtimeType = data['runtimeType'] as String;

    if (runtimeType == 'query') {
      // It's expected that the data field will contain a list of [FirebaseIsolateSnapshotData] maps.
      final snapshotList = data['snapshots'] as List<Map<String, dynamic>>;
      final snapshots = await Future.wait(
        snapshotList.map(
          (v) => SchedulerBinding.instance!.scheduleTask(
            () => FirebaseIsolateSnapshotData.fromJson(v),
            Priority.touch,
          ),
        ),
      );

      final snapshotData = FirebaseIsolateResponse.query(
        key: data['key'] as String,
        snapshots: snapshots,
      );

      completers.remove(snapshotData.key)?.complete(snapshotData);
    } else {
      final snapshotData = FirebaseIsolateResponse.fromJson(data);
      completers.remove(snapshotData.key)?.complete(snapshotData);
    }
  }

  final isolates = IsolateHandler();
  HandledIsolate? handler;
  bool _disposed = false;

  Future initialize() async {
    final handler = isolates.spawn<Map<String, dynamic>>(
      entryPoint,
      name: 'fetchDocument',
      onReceive: completeCompleter,
    );

    if (!_disposed) {
      this.handler = handler;
    } else {
      handler.dispose();
    }
  }

  void dispose() {
    handler?.dispose();
    _disposed = true;
  }

  Future<FirebaseIsolateSnapshotData> get(String path) async {
    final request = FirebaseIsolateRequest.get(path);
    final response = await _fetch(request);

    return response.map(
      get: (v) => v.snapshot,
      query: (_) => throw UnimplementedError(),
    );
  }

  Future<List<FirebaseIsolateSnapshotData>> query({
    required String path,
    required FirebaseIsolateQuery query,
  }) async {
    final request = FirebaseIsolateRequest.query(path: path, query: query);
    final response = await _fetch(request);

    return response.map(
      get: (v) => throw UnimplementedError(),
      query: (v) => v.snapshots,
    );
  }

  Future<FirebaseIsolateResponse> _fetch(FirebaseIsolateRequest request) {
    if (completers.containsKey(request.key)) {
      return completers[request.key]!.future;
    }

    final completer = Completer<FirebaseIsolateResponse>();
    completers[request.key] = completer;

    try {
      request.send();
    } catch (e, t) {
      completer.completeError(e, t);
    }

    return completer.future;
  }
}

extension _QueryOrderList on List<QueryOrder> {
  Query apply(Query query) {
    Query _query = query;
    for (final order in this) {
      order.map(
        (v) => _query = _query.orderBy(v.name, descending: v.descending),
        userId: (v) => _query = _query.orderBy(FieldPath.documentId, descending: true),
        fieldPath: (v) {
          final Object path;
          switch (v.path) {
            case QueryFieldPath.documentId:
              path = FieldPath.documentId;
              break;
          }
          return _query = _query.orderBy(path, descending: v.descending);
        },
      );
    }
    return _query;
  }

  QueryReference applyTo(QueryReference query) {
    QueryReference _query = query;
    for (final order in this) {
      order.map(
        (v) => _query = _query.orderBy(v.name, descending: v.descending),
        userId: (v) => _query = _query.orderBy('__name__', descending: true),
        fieldPath: (v) {
          switch (v.path) {
            case QueryFieldPath.documentId:
              return _query = _query.orderBy('__name__', descending: v.descending);
          }
        },
      );
    }
    return _query;
  }
}
