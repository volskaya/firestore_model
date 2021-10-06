// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'firebase_isolate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FirebaseIsolateSnapshotData _$FirebaseIsolateSnapshotDataFromJson(
    Map<String, dynamic> json) {
  return _FirebaseIsolateSnapshotData.fromJson(json);
}

/// @nodoc
class _$FirebaseIsolateSnapshotDataTearOff {
  const _$FirebaseIsolateSnapshotDataTearOff();

  _FirebaseIsolateSnapshotData call(
      {@JsonKey() required String id,
      @JsonKey() required String path,
      @JsonKey() required bool exists,
      @JsonKey() Map<String, dynamic> data = const <String, dynamic>{}}) {
    return _FirebaseIsolateSnapshotData(
      id: id,
      path: path,
      exists: exists,
      data: data,
    );
  }

  FirebaseIsolateSnapshotData fromJson(Map<String, Object> json) {
    return FirebaseIsolateSnapshotData.fromJson(json);
  }
}

/// @nodoc
const $FirebaseIsolateSnapshotData = _$FirebaseIsolateSnapshotDataTearOff();

/// @nodoc
mixin _$FirebaseIsolateSnapshotData {
  @JsonKey()
  String get id => throw _privateConstructorUsedError;
  @JsonKey()
  String get path => throw _privateConstructorUsedError;
  @JsonKey()
  bool get exists => throw _privateConstructorUsedError;
  @JsonKey()
  Map<String, dynamic> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FirebaseIsolateSnapshotDataCopyWith<FirebaseIsolateSnapshotData>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FirebaseIsolateSnapshotDataCopyWith<$Res> {
  factory $FirebaseIsolateSnapshotDataCopyWith(
          FirebaseIsolateSnapshotData value,
          $Res Function(FirebaseIsolateSnapshotData) then) =
      _$FirebaseIsolateSnapshotDataCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey() String id,
      @JsonKey() String path,
      @JsonKey() bool exists,
      @JsonKey() Map<String, dynamic> data});
}

/// @nodoc
class _$FirebaseIsolateSnapshotDataCopyWithImpl<$Res>
    implements $FirebaseIsolateSnapshotDataCopyWith<$Res> {
  _$FirebaseIsolateSnapshotDataCopyWithImpl(this._value, this._then);

  final FirebaseIsolateSnapshotData _value;
  // ignore: unused_field
  final $Res Function(FirebaseIsolateSnapshotData) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? path = freezed,
    Object? exists = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      path: path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      exists: exists == freezed
          ? _value.exists
          : exists // ignore: cast_nullable_to_non_nullable
              as bool,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
abstract class _$FirebaseIsolateSnapshotDataCopyWith<$Res>
    implements $FirebaseIsolateSnapshotDataCopyWith<$Res> {
  factory _$FirebaseIsolateSnapshotDataCopyWith(
          _FirebaseIsolateSnapshotData value,
          $Res Function(_FirebaseIsolateSnapshotData) then) =
      __$FirebaseIsolateSnapshotDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey() String id,
      @JsonKey() String path,
      @JsonKey() bool exists,
      @JsonKey() Map<String, dynamic> data});
}

/// @nodoc
class __$FirebaseIsolateSnapshotDataCopyWithImpl<$Res>
    extends _$FirebaseIsolateSnapshotDataCopyWithImpl<$Res>
    implements _$FirebaseIsolateSnapshotDataCopyWith<$Res> {
  __$FirebaseIsolateSnapshotDataCopyWithImpl(
      _FirebaseIsolateSnapshotData _value,
      $Res Function(_FirebaseIsolateSnapshotData) _then)
      : super(_value, (v) => _then(v as _FirebaseIsolateSnapshotData));

  @override
  _FirebaseIsolateSnapshotData get _value =>
      super._value as _FirebaseIsolateSnapshotData;

  @override
  $Res call({
    Object? id = freezed,
    Object? path = freezed,
    Object? exists = freezed,
    Object? data = freezed,
  }) {
    return _then(_FirebaseIsolateSnapshotData(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      path: path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      exists: exists == freezed
          ? _value.exists
          : exists // ignore: cast_nullable_to_non_nullable
              as bool,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FirebaseIsolateSnapshotData implements _FirebaseIsolateSnapshotData {
  const _$_FirebaseIsolateSnapshotData(
      {@JsonKey() required this.id,
      @JsonKey() required this.path,
      @JsonKey() required this.exists,
      @JsonKey() this.data = const <String, dynamic>{}});

  factory _$_FirebaseIsolateSnapshotData.fromJson(Map<String, dynamic> json) =>
      _$$_FirebaseIsolateSnapshotDataFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String path;
  @override
  @JsonKey()
  final bool exists;
  @override
  @JsonKey()
  final Map<String, dynamic> data;

  @override
  String toString() {
    return 'FirebaseIsolateSnapshotData(id: $id, path: $path, exists: $exists, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FirebaseIsolateSnapshotData &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.path, path) ||
                const DeepCollectionEquality().equals(other.path, path)) &&
            (identical(other.exists, exists) ||
                const DeepCollectionEquality().equals(other.exists, exists)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(path) ^
      const DeepCollectionEquality().hash(exists) ^
      const DeepCollectionEquality().hash(data);

  @JsonKey(ignore: true)
  @override
  _$FirebaseIsolateSnapshotDataCopyWith<_FirebaseIsolateSnapshotData>
      get copyWith => __$FirebaseIsolateSnapshotDataCopyWithImpl<
          _FirebaseIsolateSnapshotData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FirebaseIsolateSnapshotDataToJson(this);
  }
}

abstract class _FirebaseIsolateSnapshotData
    implements FirebaseIsolateSnapshotData {
  const factory _FirebaseIsolateSnapshotData(
      {@JsonKey() required String id,
      @JsonKey() required String path,
      @JsonKey() required bool exists,
      @JsonKey() Map<String, dynamic> data}) = _$_FirebaseIsolateSnapshotData;

  factory _FirebaseIsolateSnapshotData.fromJson(Map<String, dynamic> json) =
      _$_FirebaseIsolateSnapshotData.fromJson;

  @override
  @JsonKey()
  String get id => throw _privateConstructorUsedError;
  @override
  @JsonKey()
  String get path => throw _privateConstructorUsedError;
  @override
  @JsonKey()
  bool get exists => throw _privateConstructorUsedError;
  @override
  @JsonKey()
  Map<String, dynamic> get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FirebaseIsolateSnapshotDataCopyWith<_FirebaseIsolateSnapshotData>
      get copyWith => throw _privateConstructorUsedError;
}

QueryOrder _$QueryOrderFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType'] as String?) {
    case 'default':
      return _QueryOrder.fromJson(json);
    case 'userId':
      return _QueryOrderUserId.fromJson(json);
    case 'fieldPath':
      return _QueryOrderFieldPath.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'QueryOrder',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
class _$QueryOrderTearOff {
  const _$QueryOrderTearOff();

  _QueryOrder call(@JsonKey() String name,
      {@JsonKey() bool descending = false}) {
    return _QueryOrder(
      name,
      descending: descending,
    );
  }

  _QueryOrderUserId userId() {
    return const _QueryOrderUserId();
  }

  _QueryOrderFieldPath fieldPath(@JsonKey() QueryFieldPath path,
      {@JsonKey() bool descending = false}) {
    return _QueryOrderFieldPath(
      path,
      descending: descending,
    );
  }

  QueryOrder fromJson(Map<String, Object> json) {
    return QueryOrder.fromJson(json);
  }
}

/// @nodoc
const $QueryOrder = _$QueryOrderTearOff();

/// @nodoc
mixin _$QueryOrder {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(@JsonKey() String name, @JsonKey() bool descending)
        $default, {
    required TResult Function() userId,
    required TResult Function(
            @JsonKey() QueryFieldPath path, @JsonKey() bool descending)
        fieldPath,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(@JsonKey() String name, @JsonKey() bool descending)?
        $default, {
    TResult Function()? userId,
    TResult Function(
            @JsonKey() QueryFieldPath path, @JsonKey() bool descending)?
        fieldPath,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(@JsonKey() String name, @JsonKey() bool descending)?
        $default, {
    TResult Function()? userId,
    TResult Function(
            @JsonKey() QueryFieldPath path, @JsonKey() bool descending)?
        fieldPath,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_QueryOrder value) $default, {
    required TResult Function(_QueryOrderUserId value) userId,
    required TResult Function(_QueryOrderFieldPath value) fieldPath,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_QueryOrder value)? $default, {
    TResult Function(_QueryOrderUserId value)? userId,
    TResult Function(_QueryOrderFieldPath value)? fieldPath,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_QueryOrder value)? $default, {
    TResult Function(_QueryOrderUserId value)? userId,
    TResult Function(_QueryOrderFieldPath value)? fieldPath,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QueryOrderCopyWith<$Res> {
  factory $QueryOrderCopyWith(
          QueryOrder value, $Res Function(QueryOrder) then) =
      _$QueryOrderCopyWithImpl<$Res>;
}

/// @nodoc
class _$QueryOrderCopyWithImpl<$Res> implements $QueryOrderCopyWith<$Res> {
  _$QueryOrderCopyWithImpl(this._value, this._then);

  final QueryOrder _value;
  // ignore: unused_field
  final $Res Function(QueryOrder) _then;
}

/// @nodoc
abstract class _$QueryOrderCopyWith<$Res> {
  factory _$QueryOrderCopyWith(
          _QueryOrder value, $Res Function(_QueryOrder) then) =
      __$QueryOrderCopyWithImpl<$Res>;
  $Res call({@JsonKey() String name, @JsonKey() bool descending});
}

/// @nodoc
class __$QueryOrderCopyWithImpl<$Res> extends _$QueryOrderCopyWithImpl<$Res>
    implements _$QueryOrderCopyWith<$Res> {
  __$QueryOrderCopyWithImpl(
      _QueryOrder _value, $Res Function(_QueryOrder) _then)
      : super(_value, (v) => _then(v as _QueryOrder));

  @override
  _QueryOrder get _value => super._value as _QueryOrder;

  @override
  $Res call({
    Object? name = freezed,
    Object? descending = freezed,
  }) {
    return _then(_QueryOrder(
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      descending: descending == freezed
          ? _value.descending
          : descending // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QueryOrder implements _QueryOrder {
  const _$_QueryOrder(@JsonKey() this.name,
      {@JsonKey() this.descending = false});

  factory _$_QueryOrder.fromJson(Map<String, dynamic> json) =>
      _$$_QueryOrderFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final bool descending;

  @override
  String toString() {
    return 'QueryOrder(name: $name, descending: $descending)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _QueryOrder &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.descending, descending) ||
                const DeepCollectionEquality()
                    .equals(other.descending, descending)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(descending);

  @JsonKey(ignore: true)
  @override
  _$QueryOrderCopyWith<_QueryOrder> get copyWith =>
      __$QueryOrderCopyWithImpl<_QueryOrder>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(@JsonKey() String name, @JsonKey() bool descending)
        $default, {
    required TResult Function() userId,
    required TResult Function(
            @JsonKey() QueryFieldPath path, @JsonKey() bool descending)
        fieldPath,
  }) {
    return $default(name, descending);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(@JsonKey() String name, @JsonKey() bool descending)?
        $default, {
    TResult Function()? userId,
    TResult Function(
            @JsonKey() QueryFieldPath path, @JsonKey() bool descending)?
        fieldPath,
  }) {
    return $default?.call(name, descending);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(@JsonKey() String name, @JsonKey() bool descending)?
        $default, {
    TResult Function()? userId,
    TResult Function(
            @JsonKey() QueryFieldPath path, @JsonKey() bool descending)?
        fieldPath,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(name, descending);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_QueryOrder value) $default, {
    required TResult Function(_QueryOrderUserId value) userId,
    required TResult Function(_QueryOrderFieldPath value) fieldPath,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_QueryOrder value)? $default, {
    TResult Function(_QueryOrderUserId value)? userId,
    TResult Function(_QueryOrderFieldPath value)? fieldPath,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_QueryOrder value)? $default, {
    TResult Function(_QueryOrderUserId value)? userId,
    TResult Function(_QueryOrderFieldPath value)? fieldPath,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_QueryOrderToJson(this)..['runtimeType'] = 'default';
  }
}

abstract class _QueryOrder implements QueryOrder {
  const factory _QueryOrder(@JsonKey() String name,
      {@JsonKey() bool descending}) = _$_QueryOrder;

  factory _QueryOrder.fromJson(Map<String, dynamic> json) =
      _$_QueryOrder.fromJson;

  @JsonKey()
  String get name => throw _privateConstructorUsedError;
  @JsonKey()
  bool get descending => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$QueryOrderCopyWith<_QueryOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$QueryOrderUserIdCopyWith<$Res> {
  factory _$QueryOrderUserIdCopyWith(
          _QueryOrderUserId value, $Res Function(_QueryOrderUserId) then) =
      __$QueryOrderUserIdCopyWithImpl<$Res>;
}

/// @nodoc
class __$QueryOrderUserIdCopyWithImpl<$Res>
    extends _$QueryOrderCopyWithImpl<$Res>
    implements _$QueryOrderUserIdCopyWith<$Res> {
  __$QueryOrderUserIdCopyWithImpl(
      _QueryOrderUserId _value, $Res Function(_QueryOrderUserId) _then)
      : super(_value, (v) => _then(v as _QueryOrderUserId));

  @override
  _QueryOrderUserId get _value => super._value as _QueryOrderUserId;
}

/// @nodoc
@JsonSerializable()
class _$_QueryOrderUserId implements _QueryOrderUserId {
  const _$_QueryOrderUserId();

  factory _$_QueryOrderUserId.fromJson(Map<String, dynamic> json) =>
      _$$_QueryOrderUserIdFromJson(json);

  @override
  String toString() {
    return 'QueryOrder.userId()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _QueryOrderUserId);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(@JsonKey() String name, @JsonKey() bool descending)
        $default, {
    required TResult Function() userId,
    required TResult Function(
            @JsonKey() QueryFieldPath path, @JsonKey() bool descending)
        fieldPath,
  }) {
    return userId();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(@JsonKey() String name, @JsonKey() bool descending)?
        $default, {
    TResult Function()? userId,
    TResult Function(
            @JsonKey() QueryFieldPath path, @JsonKey() bool descending)?
        fieldPath,
  }) {
    return userId?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(@JsonKey() String name, @JsonKey() bool descending)?
        $default, {
    TResult Function()? userId,
    TResult Function(
            @JsonKey() QueryFieldPath path, @JsonKey() bool descending)?
        fieldPath,
    required TResult orElse(),
  }) {
    if (userId != null) {
      return userId();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_QueryOrder value) $default, {
    required TResult Function(_QueryOrderUserId value) userId,
    required TResult Function(_QueryOrderFieldPath value) fieldPath,
  }) {
    return userId(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_QueryOrder value)? $default, {
    TResult Function(_QueryOrderUserId value)? userId,
    TResult Function(_QueryOrderFieldPath value)? fieldPath,
  }) {
    return userId?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_QueryOrder value)? $default, {
    TResult Function(_QueryOrderUserId value)? userId,
    TResult Function(_QueryOrderFieldPath value)? fieldPath,
    required TResult orElse(),
  }) {
    if (userId != null) {
      return userId(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_QueryOrderUserIdToJson(this)..['runtimeType'] = 'userId';
  }
}

abstract class _QueryOrderUserId implements QueryOrder {
  const factory _QueryOrderUserId() = _$_QueryOrderUserId;

  factory _QueryOrderUserId.fromJson(Map<String, dynamic> json) =
      _$_QueryOrderUserId.fromJson;
}

/// @nodoc
abstract class _$QueryOrderFieldPathCopyWith<$Res> {
  factory _$QueryOrderFieldPathCopyWith(_QueryOrderFieldPath value,
          $Res Function(_QueryOrderFieldPath) then) =
      __$QueryOrderFieldPathCopyWithImpl<$Res>;
  $Res call({@JsonKey() QueryFieldPath path, @JsonKey() bool descending});
}

/// @nodoc
class __$QueryOrderFieldPathCopyWithImpl<$Res>
    extends _$QueryOrderCopyWithImpl<$Res>
    implements _$QueryOrderFieldPathCopyWith<$Res> {
  __$QueryOrderFieldPathCopyWithImpl(
      _QueryOrderFieldPath _value, $Res Function(_QueryOrderFieldPath) _then)
      : super(_value, (v) => _then(v as _QueryOrderFieldPath));

  @override
  _QueryOrderFieldPath get _value => super._value as _QueryOrderFieldPath;

  @override
  $Res call({
    Object? path = freezed,
    Object? descending = freezed,
  }) {
    return _then(_QueryOrderFieldPath(
      path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as QueryFieldPath,
      descending: descending == freezed
          ? _value.descending
          : descending // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QueryOrderFieldPath implements _QueryOrderFieldPath {
  const _$_QueryOrderFieldPath(@JsonKey() this.path,
      {@JsonKey() this.descending = false});

  factory _$_QueryOrderFieldPath.fromJson(Map<String, dynamic> json) =>
      _$$_QueryOrderFieldPathFromJson(json);

  @override
  @JsonKey()
  final QueryFieldPath path;
  @override
  @JsonKey()
  final bool descending;

  @override
  String toString() {
    return 'QueryOrder.fieldPath(path: $path, descending: $descending)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _QueryOrderFieldPath &&
            (identical(other.path, path) ||
                const DeepCollectionEquality().equals(other.path, path)) &&
            (identical(other.descending, descending) ||
                const DeepCollectionEquality()
                    .equals(other.descending, descending)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(path) ^
      const DeepCollectionEquality().hash(descending);

  @JsonKey(ignore: true)
  @override
  _$QueryOrderFieldPathCopyWith<_QueryOrderFieldPath> get copyWith =>
      __$QueryOrderFieldPathCopyWithImpl<_QueryOrderFieldPath>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(@JsonKey() String name, @JsonKey() bool descending)
        $default, {
    required TResult Function() userId,
    required TResult Function(
            @JsonKey() QueryFieldPath path, @JsonKey() bool descending)
        fieldPath,
  }) {
    return fieldPath(path, descending);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(@JsonKey() String name, @JsonKey() bool descending)?
        $default, {
    TResult Function()? userId,
    TResult Function(
            @JsonKey() QueryFieldPath path, @JsonKey() bool descending)?
        fieldPath,
  }) {
    return fieldPath?.call(path, descending);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(@JsonKey() String name, @JsonKey() bool descending)?
        $default, {
    TResult Function()? userId,
    TResult Function(
            @JsonKey() QueryFieldPath path, @JsonKey() bool descending)?
        fieldPath,
    required TResult orElse(),
  }) {
    if (fieldPath != null) {
      return fieldPath(path, descending);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_QueryOrder value) $default, {
    required TResult Function(_QueryOrderUserId value) userId,
    required TResult Function(_QueryOrderFieldPath value) fieldPath,
  }) {
    return fieldPath(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_QueryOrder value)? $default, {
    TResult Function(_QueryOrderUserId value)? userId,
    TResult Function(_QueryOrderFieldPath value)? fieldPath,
  }) {
    return fieldPath?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_QueryOrder value)? $default, {
    TResult Function(_QueryOrderUserId value)? userId,
    TResult Function(_QueryOrderFieldPath value)? fieldPath,
    required TResult orElse(),
  }) {
    if (fieldPath != null) {
      return fieldPath(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_QueryOrderFieldPathToJson(this)..['runtimeType'] = 'fieldPath';
  }
}

abstract class _QueryOrderFieldPath implements QueryOrder {
  const factory _QueryOrderFieldPath(@JsonKey() QueryFieldPath path,
      {@JsonKey() bool descending}) = _$_QueryOrderFieldPath;

  factory _QueryOrderFieldPath.fromJson(Map<String, dynamic> json) =
      _$_QueryOrderFieldPath.fromJson;

  @JsonKey()
  QueryFieldPath get path => throw _privateConstructorUsedError;
  @JsonKey()
  bool get descending => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$QueryOrderFieldPathCopyWith<_QueryOrderFieldPath> get copyWith =>
      throw _privateConstructorUsedError;
}

QueryValue _$QueryValueFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType'] as String?) {
    case 'default':
      return _QueryValue.fromJson(json);
    case 'timestamp':
      return _QueryValueTimestamp.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'QueryValue',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
class _$QueryValueTearOff {
  const _$QueryValueTearOff();

  _QueryValue call(@JsonKey() Object value) {
    return _QueryValue(
      value,
    );
  }

  _QueryValueTimestamp timestamp(
      @JsonKey() @TimestampCJ() Timestamp timestamp) {
    return _QueryValueTimestamp(
      timestamp,
    );
  }

  QueryValue fromJson(Map<String, Object> json) {
    return QueryValue.fromJson(json);
  }
}

/// @nodoc
const $QueryValue = _$QueryValueTearOff();

/// @nodoc
mixin _$QueryValue {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(@JsonKey() Object value) $default, {
    required TResult Function(@JsonKey() @TimestampCJ() Timestamp timestamp)
        timestamp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(@JsonKey() Object value)? $default, {
    TResult Function(@JsonKey() @TimestampCJ() Timestamp timestamp)? timestamp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(@JsonKey() Object value)? $default, {
    TResult Function(@JsonKey() @TimestampCJ() Timestamp timestamp)? timestamp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_QueryValue value) $default, {
    required TResult Function(_QueryValueTimestamp value) timestamp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_QueryValue value)? $default, {
    TResult Function(_QueryValueTimestamp value)? timestamp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_QueryValue value)? $default, {
    TResult Function(_QueryValueTimestamp value)? timestamp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QueryValueCopyWith<$Res> {
  factory $QueryValueCopyWith(
          QueryValue value, $Res Function(QueryValue) then) =
      _$QueryValueCopyWithImpl<$Res>;
}

/// @nodoc
class _$QueryValueCopyWithImpl<$Res> implements $QueryValueCopyWith<$Res> {
  _$QueryValueCopyWithImpl(this._value, this._then);

  final QueryValue _value;
  // ignore: unused_field
  final $Res Function(QueryValue) _then;
}

/// @nodoc
abstract class _$QueryValueCopyWith<$Res> {
  factory _$QueryValueCopyWith(
          _QueryValue value, $Res Function(_QueryValue) then) =
      __$QueryValueCopyWithImpl<$Res>;
  $Res call({@JsonKey() Object value});
}

/// @nodoc
class __$QueryValueCopyWithImpl<$Res> extends _$QueryValueCopyWithImpl<$Res>
    implements _$QueryValueCopyWith<$Res> {
  __$QueryValueCopyWithImpl(
      _QueryValue _value, $Res Function(_QueryValue) _then)
      : super(_value, (v) => _then(v as _QueryValue));

  @override
  _QueryValue get _value => super._value as _QueryValue;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_QueryValue(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as Object,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QueryValue extends _QueryValue {
  _$_QueryValue(@JsonKey() this.value) : super._();

  factory _$_QueryValue.fromJson(Map<String, dynamic> json) =>
      _$$_QueryValueFromJson(json);

  @override
  @JsonKey()
  final Object value;

  @override
  String toString() {
    return 'QueryValue(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _QueryValue &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$QueryValueCopyWith<_QueryValue> get copyWith =>
      __$QueryValueCopyWithImpl<_QueryValue>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(@JsonKey() Object value) $default, {
    required TResult Function(@JsonKey() @TimestampCJ() Timestamp timestamp)
        timestamp,
  }) {
    return $default(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(@JsonKey() Object value)? $default, {
    TResult Function(@JsonKey() @TimestampCJ() Timestamp timestamp)? timestamp,
  }) {
    return $default?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(@JsonKey() Object value)? $default, {
    TResult Function(@JsonKey() @TimestampCJ() Timestamp timestamp)? timestamp,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_QueryValue value) $default, {
    required TResult Function(_QueryValueTimestamp value) timestamp,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_QueryValue value)? $default, {
    TResult Function(_QueryValueTimestamp value)? timestamp,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_QueryValue value)? $default, {
    TResult Function(_QueryValueTimestamp value)? timestamp,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_QueryValueToJson(this)..['runtimeType'] = 'default';
  }
}

abstract class _QueryValue extends QueryValue {
  factory _QueryValue(@JsonKey() Object value) = _$_QueryValue;
  _QueryValue._() : super._();

  factory _QueryValue.fromJson(Map<String, dynamic> json) =
      _$_QueryValue.fromJson;

  @JsonKey()
  Object get value => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$QueryValueCopyWith<_QueryValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$QueryValueTimestampCopyWith<$Res> {
  factory _$QueryValueTimestampCopyWith(_QueryValueTimestamp value,
          $Res Function(_QueryValueTimestamp) then) =
      __$QueryValueTimestampCopyWithImpl<$Res>;
  $Res call({@JsonKey() @TimestampCJ() Timestamp timestamp});
}

/// @nodoc
class __$QueryValueTimestampCopyWithImpl<$Res>
    extends _$QueryValueCopyWithImpl<$Res>
    implements _$QueryValueTimestampCopyWith<$Res> {
  __$QueryValueTimestampCopyWithImpl(
      _QueryValueTimestamp _value, $Res Function(_QueryValueTimestamp) _then)
      : super(_value, (v) => _then(v as _QueryValueTimestamp));

  @override
  _QueryValueTimestamp get _value => super._value as _QueryValueTimestamp;

  @override
  $Res call({
    Object? timestamp = freezed,
  }) {
    return _then(_QueryValueTimestamp(
      timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QueryValueTimestamp extends _QueryValueTimestamp {
  _$_QueryValueTimestamp(@JsonKey() @TimestampCJ() this.timestamp) : super._();

  factory _$_QueryValueTimestamp.fromJson(Map<String, dynamic> json) =>
      _$$_QueryValueTimestampFromJson(json);

  @override
  @JsonKey()
  @TimestampCJ()
  final Timestamp timestamp;

  @override
  String toString() {
    return 'QueryValue.timestamp(timestamp: $timestamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _QueryValueTimestamp &&
            (identical(other.timestamp, timestamp) ||
                const DeepCollectionEquality()
                    .equals(other.timestamp, timestamp)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(timestamp);

  @JsonKey(ignore: true)
  @override
  _$QueryValueTimestampCopyWith<_QueryValueTimestamp> get copyWith =>
      __$QueryValueTimestampCopyWithImpl<_QueryValueTimestamp>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(@JsonKey() Object value) $default, {
    required TResult Function(@JsonKey() @TimestampCJ() Timestamp timestamp)
        timestamp,
  }) {
    return timestamp(this.timestamp);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(@JsonKey() Object value)? $default, {
    TResult Function(@JsonKey() @TimestampCJ() Timestamp timestamp)? timestamp,
  }) {
    return timestamp?.call(this.timestamp);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(@JsonKey() Object value)? $default, {
    TResult Function(@JsonKey() @TimestampCJ() Timestamp timestamp)? timestamp,
    required TResult orElse(),
  }) {
    if (timestamp != null) {
      return timestamp(this.timestamp);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_QueryValue value) $default, {
    required TResult Function(_QueryValueTimestamp value) timestamp,
  }) {
    return timestamp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_QueryValue value)? $default, {
    TResult Function(_QueryValueTimestamp value)? timestamp,
  }) {
    return timestamp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_QueryValue value)? $default, {
    TResult Function(_QueryValueTimestamp value)? timestamp,
    required TResult orElse(),
  }) {
    if (timestamp != null) {
      return timestamp(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_QueryValueTimestampToJson(this)..['runtimeType'] = 'timestamp';
  }
}

abstract class _QueryValueTimestamp extends QueryValue {
  factory _QueryValueTimestamp(@JsonKey() @TimestampCJ() Timestamp timestamp) =
      _$_QueryValueTimestamp;
  _QueryValueTimestamp._() : super._();

  factory _QueryValueTimestamp.fromJson(Map<String, dynamic> json) =
      _$_QueryValueTimestamp.fromJson;

  @JsonKey()
  @TimestampCJ()
  Timestamp get timestamp => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$QueryValueTimestampCopyWith<_QueryValueTimestamp> get copyWith =>
      throw _privateConstructorUsedError;
}

QueryValues _$QueryValuesFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType'] as String?) {
    case 'startAfter':
      return _QueryValuesStartAfter.fromJson(json);
    case 'startBefore':
      return _QueryValuesStartBefore.fromJson(json);
    case 'none':
      return _QueryValuesStartNone.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'QueryValues',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
class _$QueryValuesTearOff {
  const _$QueryValuesTearOff();

  _QueryValuesStartAfter startAfter(@JsonKey() List<QueryValue> values) {
    return _QueryValuesStartAfter(
      values,
    );
  }

  _QueryValuesStartBefore startBefore(@JsonKey() List<QueryValue> values) {
    return _QueryValuesStartBefore(
      values,
    );
  }

  _QueryValuesStartNone none() {
    return const _QueryValuesStartNone();
  }

  QueryValues fromJson(Map<String, Object> json) {
    return QueryValues.fromJson(json);
  }
}

/// @nodoc
const $QueryValues = _$QueryValuesTearOff();

/// @nodoc
mixin _$QueryValues {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@JsonKey() List<QueryValue> values) startAfter,
    required TResult Function(@JsonKey() List<QueryValue> values) startBefore,
    required TResult Function() none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(@JsonKey() List<QueryValue> values)? startAfter,
    TResult Function(@JsonKey() List<QueryValue> values)? startBefore,
    TResult Function()? none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@JsonKey() List<QueryValue> values)? startAfter,
    TResult Function(@JsonKey() List<QueryValue> values)? startBefore,
    TResult Function()? none,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_QueryValuesStartAfter value) startAfter,
    required TResult Function(_QueryValuesStartBefore value) startBefore,
    required TResult Function(_QueryValuesStartNone value) none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_QueryValuesStartAfter value)? startAfter,
    TResult Function(_QueryValuesStartBefore value)? startBefore,
    TResult Function(_QueryValuesStartNone value)? none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_QueryValuesStartAfter value)? startAfter,
    TResult Function(_QueryValuesStartBefore value)? startBefore,
    TResult Function(_QueryValuesStartNone value)? none,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QueryValuesCopyWith<$Res> {
  factory $QueryValuesCopyWith(
          QueryValues value, $Res Function(QueryValues) then) =
      _$QueryValuesCopyWithImpl<$Res>;
}

/// @nodoc
class _$QueryValuesCopyWithImpl<$Res> implements $QueryValuesCopyWith<$Res> {
  _$QueryValuesCopyWithImpl(this._value, this._then);

  final QueryValues _value;
  // ignore: unused_field
  final $Res Function(QueryValues) _then;
}

/// @nodoc
abstract class _$QueryValuesStartAfterCopyWith<$Res> {
  factory _$QueryValuesStartAfterCopyWith(_QueryValuesStartAfter value,
          $Res Function(_QueryValuesStartAfter) then) =
      __$QueryValuesStartAfterCopyWithImpl<$Res>;
  $Res call({@JsonKey() List<QueryValue> values});
}

/// @nodoc
class __$QueryValuesStartAfterCopyWithImpl<$Res>
    extends _$QueryValuesCopyWithImpl<$Res>
    implements _$QueryValuesStartAfterCopyWith<$Res> {
  __$QueryValuesStartAfterCopyWithImpl(_QueryValuesStartAfter _value,
      $Res Function(_QueryValuesStartAfter) _then)
      : super(_value, (v) => _then(v as _QueryValuesStartAfter));

  @override
  _QueryValuesStartAfter get _value => super._value as _QueryValuesStartAfter;

  @override
  $Res call({
    Object? values = freezed,
  }) {
    return _then(_QueryValuesStartAfter(
      values == freezed
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as List<QueryValue>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QueryValuesStartAfter extends _QueryValuesStartAfter {
  const _$_QueryValuesStartAfter(@JsonKey() this.values) : super._();

  factory _$_QueryValuesStartAfter.fromJson(Map<String, dynamic> json) =>
      _$$_QueryValuesStartAfterFromJson(json);

  @override
  @JsonKey()
  final List<QueryValue> values;

  @override
  String toString() {
    return 'QueryValues.startAfter(values: $values)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _QueryValuesStartAfter &&
            (identical(other.values, values) ||
                const DeepCollectionEquality().equals(other.values, values)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(values);

  @JsonKey(ignore: true)
  @override
  _$QueryValuesStartAfterCopyWith<_QueryValuesStartAfter> get copyWith =>
      __$QueryValuesStartAfterCopyWithImpl<_QueryValuesStartAfter>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@JsonKey() List<QueryValue> values) startAfter,
    required TResult Function(@JsonKey() List<QueryValue> values) startBefore,
    required TResult Function() none,
  }) {
    return startAfter(values);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(@JsonKey() List<QueryValue> values)? startAfter,
    TResult Function(@JsonKey() List<QueryValue> values)? startBefore,
    TResult Function()? none,
  }) {
    return startAfter?.call(values);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@JsonKey() List<QueryValue> values)? startAfter,
    TResult Function(@JsonKey() List<QueryValue> values)? startBefore,
    TResult Function()? none,
    required TResult orElse(),
  }) {
    if (startAfter != null) {
      return startAfter(values);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_QueryValuesStartAfter value) startAfter,
    required TResult Function(_QueryValuesStartBefore value) startBefore,
    required TResult Function(_QueryValuesStartNone value) none,
  }) {
    return startAfter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_QueryValuesStartAfter value)? startAfter,
    TResult Function(_QueryValuesStartBefore value)? startBefore,
    TResult Function(_QueryValuesStartNone value)? none,
  }) {
    return startAfter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_QueryValuesStartAfter value)? startAfter,
    TResult Function(_QueryValuesStartBefore value)? startBefore,
    TResult Function(_QueryValuesStartNone value)? none,
    required TResult orElse(),
  }) {
    if (startAfter != null) {
      return startAfter(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_QueryValuesStartAfterToJson(this)
      ..['runtimeType'] = 'startAfter';
  }
}

abstract class _QueryValuesStartAfter extends QueryValues {
  const factory _QueryValuesStartAfter(@JsonKey() List<QueryValue> values) =
      _$_QueryValuesStartAfter;
  const _QueryValuesStartAfter._() : super._();

  factory _QueryValuesStartAfter.fromJson(Map<String, dynamic> json) =
      _$_QueryValuesStartAfter.fromJson;

  @JsonKey()
  List<QueryValue> get values => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$QueryValuesStartAfterCopyWith<_QueryValuesStartAfter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$QueryValuesStartBeforeCopyWith<$Res> {
  factory _$QueryValuesStartBeforeCopyWith(_QueryValuesStartBefore value,
          $Res Function(_QueryValuesStartBefore) then) =
      __$QueryValuesStartBeforeCopyWithImpl<$Res>;
  $Res call({@JsonKey() List<QueryValue> values});
}

/// @nodoc
class __$QueryValuesStartBeforeCopyWithImpl<$Res>
    extends _$QueryValuesCopyWithImpl<$Res>
    implements _$QueryValuesStartBeforeCopyWith<$Res> {
  __$QueryValuesStartBeforeCopyWithImpl(_QueryValuesStartBefore _value,
      $Res Function(_QueryValuesStartBefore) _then)
      : super(_value, (v) => _then(v as _QueryValuesStartBefore));

  @override
  _QueryValuesStartBefore get _value => super._value as _QueryValuesStartBefore;

  @override
  $Res call({
    Object? values = freezed,
  }) {
    return _then(_QueryValuesStartBefore(
      values == freezed
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as List<QueryValue>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QueryValuesStartBefore extends _QueryValuesStartBefore {
  const _$_QueryValuesStartBefore(@JsonKey() this.values) : super._();

  factory _$_QueryValuesStartBefore.fromJson(Map<String, dynamic> json) =>
      _$$_QueryValuesStartBeforeFromJson(json);

  @override
  @JsonKey()
  final List<QueryValue> values;

  @override
  String toString() {
    return 'QueryValues.startBefore(values: $values)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _QueryValuesStartBefore &&
            (identical(other.values, values) ||
                const DeepCollectionEquality().equals(other.values, values)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(values);

  @JsonKey(ignore: true)
  @override
  _$QueryValuesStartBeforeCopyWith<_QueryValuesStartBefore> get copyWith =>
      __$QueryValuesStartBeforeCopyWithImpl<_QueryValuesStartBefore>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@JsonKey() List<QueryValue> values) startAfter,
    required TResult Function(@JsonKey() List<QueryValue> values) startBefore,
    required TResult Function() none,
  }) {
    return startBefore(values);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(@JsonKey() List<QueryValue> values)? startAfter,
    TResult Function(@JsonKey() List<QueryValue> values)? startBefore,
    TResult Function()? none,
  }) {
    return startBefore?.call(values);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@JsonKey() List<QueryValue> values)? startAfter,
    TResult Function(@JsonKey() List<QueryValue> values)? startBefore,
    TResult Function()? none,
    required TResult orElse(),
  }) {
    if (startBefore != null) {
      return startBefore(values);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_QueryValuesStartAfter value) startAfter,
    required TResult Function(_QueryValuesStartBefore value) startBefore,
    required TResult Function(_QueryValuesStartNone value) none,
  }) {
    return startBefore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_QueryValuesStartAfter value)? startAfter,
    TResult Function(_QueryValuesStartBefore value)? startBefore,
    TResult Function(_QueryValuesStartNone value)? none,
  }) {
    return startBefore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_QueryValuesStartAfter value)? startAfter,
    TResult Function(_QueryValuesStartBefore value)? startBefore,
    TResult Function(_QueryValuesStartNone value)? none,
    required TResult orElse(),
  }) {
    if (startBefore != null) {
      return startBefore(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_QueryValuesStartBeforeToJson(this)
      ..['runtimeType'] = 'startBefore';
  }
}

abstract class _QueryValuesStartBefore extends QueryValues {
  const factory _QueryValuesStartBefore(@JsonKey() List<QueryValue> values) =
      _$_QueryValuesStartBefore;
  const _QueryValuesStartBefore._() : super._();

  factory _QueryValuesStartBefore.fromJson(Map<String, dynamic> json) =
      _$_QueryValuesStartBefore.fromJson;

  @JsonKey()
  List<QueryValue> get values => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$QueryValuesStartBeforeCopyWith<_QueryValuesStartBefore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$QueryValuesStartNoneCopyWith<$Res> {
  factory _$QueryValuesStartNoneCopyWith(_QueryValuesStartNone value,
          $Res Function(_QueryValuesStartNone) then) =
      __$QueryValuesStartNoneCopyWithImpl<$Res>;
}

/// @nodoc
class __$QueryValuesStartNoneCopyWithImpl<$Res>
    extends _$QueryValuesCopyWithImpl<$Res>
    implements _$QueryValuesStartNoneCopyWith<$Res> {
  __$QueryValuesStartNoneCopyWithImpl(
      _QueryValuesStartNone _value, $Res Function(_QueryValuesStartNone) _then)
      : super(_value, (v) => _then(v as _QueryValuesStartNone));

  @override
  _QueryValuesStartNone get _value => super._value as _QueryValuesStartNone;
}

/// @nodoc
@JsonSerializable()
class _$_QueryValuesStartNone extends _QueryValuesStartNone {
  const _$_QueryValuesStartNone() : super._();

  factory _$_QueryValuesStartNone.fromJson(Map<String, dynamic> json) =>
      _$$_QueryValuesStartNoneFromJson(json);

  @override
  String toString() {
    return 'QueryValues.none()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _QueryValuesStartNone);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@JsonKey() List<QueryValue> values) startAfter,
    required TResult Function(@JsonKey() List<QueryValue> values) startBefore,
    required TResult Function() none,
  }) {
    return none();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(@JsonKey() List<QueryValue> values)? startAfter,
    TResult Function(@JsonKey() List<QueryValue> values)? startBefore,
    TResult Function()? none,
  }) {
    return none?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@JsonKey() List<QueryValue> values)? startAfter,
    TResult Function(@JsonKey() List<QueryValue> values)? startBefore,
    TResult Function()? none,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_QueryValuesStartAfter value) startAfter,
    required TResult Function(_QueryValuesStartBefore value) startBefore,
    required TResult Function(_QueryValuesStartNone value) none,
  }) {
    return none(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_QueryValuesStartAfter value)? startAfter,
    TResult Function(_QueryValuesStartBefore value)? startBefore,
    TResult Function(_QueryValuesStartNone value)? none,
  }) {
    return none?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_QueryValuesStartAfter value)? startAfter,
    TResult Function(_QueryValuesStartBefore value)? startBefore,
    TResult Function(_QueryValuesStartNone value)? none,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_QueryValuesStartNoneToJson(this)..['runtimeType'] = 'none';
  }
}

abstract class _QueryValuesStartNone extends QueryValues {
  const factory _QueryValuesStartNone() = _$_QueryValuesStartNone;
  const _QueryValuesStartNone._() : super._();

  factory _QueryValuesStartNone.fromJson(Map<String, dynamic> json) =
      _$_QueryValuesStartNone.fromJson;
}

QueryField _$QueryFieldFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType'] as String?) {
    case 'isEqualTo':
      return _QueryFieldIsEqualTo.fromJson(json);
    case 'isNotEqualTo':
      return _QueryFieldIsNotEqualTo.fromJson(json);
    case 'isLessThan':
      return _QueryFieldIsLessThan.fromJson(json);
    case 'isLessThanOrEqualTo':
      return _QueryFieldIsLessThanOrEqualTo.fromJson(json);
    case 'isGreaterThan':
      return _QueryFieldIsGreaterThan.fromJson(json);
    case 'isGreaterThanOrEqualTo':
      return _QueryFieldIsGreaterThanOrEqualTo.fromJson(json);
    case 'arrayContains':
      return _QueryFieldArrayContains.fromJson(json);
    case 'arrayContainsAny':
      return _QueryFieldArrayContainsAny.fromJson(json);
    case 'whereIn':
      return _QueryFieldWhereIn.fromJson(json);
    case 'whereNotIn':
      return _QueryFieldWhereNotIn.fromJson(json);
    case 'isNull':
      return _QueryFieldIsNull.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'QueryField',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
class _$QueryFieldTearOff {
  const _$QueryFieldTearOff();

  _QueryFieldIsEqualTo isEqualTo(
      @JsonKey() String field, @JsonKey() Object? value) {
    return _QueryFieldIsEqualTo(
      field,
      value,
    );
  }

  _QueryFieldIsNotEqualTo isNotEqualTo(
      @JsonKey() String field, @JsonKey() Object? value) {
    return _QueryFieldIsNotEqualTo(
      field,
      value,
    );
  }

  _QueryFieldIsLessThan isLessThan(
      @JsonKey() String field, @JsonKey() Object? value) {
    return _QueryFieldIsLessThan(
      field,
      value,
    );
  }

  _QueryFieldIsLessThanOrEqualTo isLessThanOrEqualTo(
      @JsonKey() String field, @JsonKey() Object? value) {
    return _QueryFieldIsLessThanOrEqualTo(
      field,
      value,
    );
  }

  _QueryFieldIsGreaterThan isGreaterThan(
      @JsonKey() String field, @JsonKey() Object? value) {
    return _QueryFieldIsGreaterThan(
      field,
      value,
    );
  }

  _QueryFieldIsGreaterThanOrEqualTo isGreaterThanOrEqualTo(
      @JsonKey() String field, @JsonKey() Object? value) {
    return _QueryFieldIsGreaterThanOrEqualTo(
      field,
      value,
    );
  }

  _QueryFieldArrayContains arrayContains(
      @JsonKey() String field, @JsonKey() Object? value) {
    return _QueryFieldArrayContains(
      field,
      value,
    );
  }

  _QueryFieldArrayContainsAny arrayContainsAny(
      @JsonKey() String field, @JsonKey() List<Object?>? value) {
    return _QueryFieldArrayContainsAny(
      field,
      value,
    );
  }

  _QueryFieldWhereIn whereIn(
      @JsonKey() String field, @JsonKey() List<Object?>? value) {
    return _QueryFieldWhereIn(
      field,
      value,
    );
  }

  _QueryFieldWhereNotIn whereNotIn(
      @JsonKey() String field, @JsonKey() List<Object?>? value) {
    return _QueryFieldWhereNotIn(
      field,
      value,
    );
  }

  _QueryFieldIsNull isNull(@JsonKey() String field, @JsonKey() bool value) {
    return _QueryFieldIsNull(
      field,
      value,
    );
  }

  QueryField fromJson(Map<String, Object> json) {
    return QueryField.fromJson(json);
  }
}

/// @nodoc
const $QueryField = _$QueryFieldTearOff();

/// @nodoc
mixin _$QueryField {
  @JsonKey()
  String get field => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isEqualTo,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isNotEqualTo,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isLessThan,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isLessThanOrEqualTo,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isGreaterThan,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isGreaterThanOrEqualTo,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        arrayContains,
    required TResult Function(
            @JsonKey() String field, @JsonKey() List<Object?>? value)
        arrayContainsAny,
    required TResult Function(
            @JsonKey() String field, @JsonKey() List<Object?>? value)
        whereIn,
    required TResult Function(
            @JsonKey() String field, @JsonKey() List<Object?>? value)
        whereNotIn,
    required TResult Function(@JsonKey() String field, @JsonKey() bool value)
        isNull,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isNotEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isLessThan,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isLessThanOrEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isGreaterThan,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isGreaterThanOrEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        arrayContains,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        arrayContainsAny,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        whereIn,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        whereNotIn,
    TResult Function(@JsonKey() String field, @JsonKey() bool value)? isNull,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isNotEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isLessThan,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isLessThanOrEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isGreaterThan,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isGreaterThanOrEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        arrayContains,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        arrayContainsAny,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        whereIn,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        whereNotIn,
    TResult Function(@JsonKey() String field, @JsonKey() bool value)? isNull,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_QueryFieldIsEqualTo value) isEqualTo,
    required TResult Function(_QueryFieldIsNotEqualTo value) isNotEqualTo,
    required TResult Function(_QueryFieldIsLessThan value) isLessThan,
    required TResult Function(_QueryFieldIsLessThanOrEqualTo value)
        isLessThanOrEqualTo,
    required TResult Function(_QueryFieldIsGreaterThan value) isGreaterThan,
    required TResult Function(_QueryFieldIsGreaterThanOrEqualTo value)
        isGreaterThanOrEqualTo,
    required TResult Function(_QueryFieldArrayContains value) arrayContains,
    required TResult Function(_QueryFieldArrayContainsAny value)
        arrayContainsAny,
    required TResult Function(_QueryFieldWhereIn value) whereIn,
    required TResult Function(_QueryFieldWhereNotIn value) whereNotIn,
    required TResult Function(_QueryFieldIsNull value) isNull,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_QueryFieldIsEqualTo value)? isEqualTo,
    TResult Function(_QueryFieldIsNotEqualTo value)? isNotEqualTo,
    TResult Function(_QueryFieldIsLessThan value)? isLessThan,
    TResult Function(_QueryFieldIsLessThanOrEqualTo value)? isLessThanOrEqualTo,
    TResult Function(_QueryFieldIsGreaterThan value)? isGreaterThan,
    TResult Function(_QueryFieldIsGreaterThanOrEqualTo value)?
        isGreaterThanOrEqualTo,
    TResult Function(_QueryFieldArrayContains value)? arrayContains,
    TResult Function(_QueryFieldArrayContainsAny value)? arrayContainsAny,
    TResult Function(_QueryFieldWhereIn value)? whereIn,
    TResult Function(_QueryFieldWhereNotIn value)? whereNotIn,
    TResult Function(_QueryFieldIsNull value)? isNull,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_QueryFieldIsEqualTo value)? isEqualTo,
    TResult Function(_QueryFieldIsNotEqualTo value)? isNotEqualTo,
    TResult Function(_QueryFieldIsLessThan value)? isLessThan,
    TResult Function(_QueryFieldIsLessThanOrEqualTo value)? isLessThanOrEqualTo,
    TResult Function(_QueryFieldIsGreaterThan value)? isGreaterThan,
    TResult Function(_QueryFieldIsGreaterThanOrEqualTo value)?
        isGreaterThanOrEqualTo,
    TResult Function(_QueryFieldArrayContains value)? arrayContains,
    TResult Function(_QueryFieldArrayContainsAny value)? arrayContainsAny,
    TResult Function(_QueryFieldWhereIn value)? whereIn,
    TResult Function(_QueryFieldWhereNotIn value)? whereNotIn,
    TResult Function(_QueryFieldIsNull value)? isNull,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QueryFieldCopyWith<QueryField> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QueryFieldCopyWith<$Res> {
  factory $QueryFieldCopyWith(
          QueryField value, $Res Function(QueryField) then) =
      _$QueryFieldCopyWithImpl<$Res>;
  $Res call({@JsonKey() String field});
}

/// @nodoc
class _$QueryFieldCopyWithImpl<$Res> implements $QueryFieldCopyWith<$Res> {
  _$QueryFieldCopyWithImpl(this._value, this._then);

  final QueryField _value;
  // ignore: unused_field
  final $Res Function(QueryField) _then;

  @override
  $Res call({
    Object? field = freezed,
  }) {
    return _then(_value.copyWith(
      field: field == freezed
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$QueryFieldIsEqualToCopyWith<$Res>
    implements $QueryFieldCopyWith<$Res> {
  factory _$QueryFieldIsEqualToCopyWith(_QueryFieldIsEqualTo value,
          $Res Function(_QueryFieldIsEqualTo) then) =
      __$QueryFieldIsEqualToCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey() String field, @JsonKey() Object? value});
}

/// @nodoc
class __$QueryFieldIsEqualToCopyWithImpl<$Res>
    extends _$QueryFieldCopyWithImpl<$Res>
    implements _$QueryFieldIsEqualToCopyWith<$Res> {
  __$QueryFieldIsEqualToCopyWithImpl(
      _QueryFieldIsEqualTo _value, $Res Function(_QueryFieldIsEqualTo) _then)
      : super(_value, (v) => _then(v as _QueryFieldIsEqualTo));

  @override
  _QueryFieldIsEqualTo get _value => super._value as _QueryFieldIsEqualTo;

  @override
  $Res call({
    Object? field = freezed,
    Object? value = freezed,
  }) {
    return _then(_QueryFieldIsEqualTo(
      field == freezed
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as String,
      value == freezed ? _value.value : value,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QueryFieldIsEqualTo extends _QueryFieldIsEqualTo {
  const _$_QueryFieldIsEqualTo(@JsonKey() this.field, @JsonKey() this.value)
      : super._();

  factory _$_QueryFieldIsEqualTo.fromJson(Map<String, dynamic> json) =>
      _$$_QueryFieldIsEqualToFromJson(json);

  @override
  @JsonKey()
  final String field;
  @override
  @JsonKey()
  final Object? value;

  @override
  String toString() {
    return 'QueryField.isEqualTo(field: $field, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _QueryFieldIsEqualTo &&
            (identical(other.field, field) ||
                const DeepCollectionEquality().equals(other.field, field)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(field) ^
      const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$QueryFieldIsEqualToCopyWith<_QueryFieldIsEqualTo> get copyWith =>
      __$QueryFieldIsEqualToCopyWithImpl<_QueryFieldIsEqualTo>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isEqualTo,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isNotEqualTo,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isLessThan,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isLessThanOrEqualTo,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isGreaterThan,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isGreaterThanOrEqualTo,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        arrayContains,
    required TResult Function(
            @JsonKey() String field, @JsonKey() List<Object?>? value)
        arrayContainsAny,
    required TResult Function(
            @JsonKey() String field, @JsonKey() List<Object?>? value)
        whereIn,
    required TResult Function(
            @JsonKey() String field, @JsonKey() List<Object?>? value)
        whereNotIn,
    required TResult Function(@JsonKey() String field, @JsonKey() bool value)
        isNull,
  }) {
    return isEqualTo(field, value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isNotEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isLessThan,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isLessThanOrEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isGreaterThan,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isGreaterThanOrEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        arrayContains,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        arrayContainsAny,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        whereIn,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        whereNotIn,
    TResult Function(@JsonKey() String field, @JsonKey() bool value)? isNull,
  }) {
    return isEqualTo?.call(field, value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isNotEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isLessThan,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isLessThanOrEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isGreaterThan,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isGreaterThanOrEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        arrayContains,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        arrayContainsAny,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        whereIn,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        whereNotIn,
    TResult Function(@JsonKey() String field, @JsonKey() bool value)? isNull,
    required TResult orElse(),
  }) {
    if (isEqualTo != null) {
      return isEqualTo(field, value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_QueryFieldIsEqualTo value) isEqualTo,
    required TResult Function(_QueryFieldIsNotEqualTo value) isNotEqualTo,
    required TResult Function(_QueryFieldIsLessThan value) isLessThan,
    required TResult Function(_QueryFieldIsLessThanOrEqualTo value)
        isLessThanOrEqualTo,
    required TResult Function(_QueryFieldIsGreaterThan value) isGreaterThan,
    required TResult Function(_QueryFieldIsGreaterThanOrEqualTo value)
        isGreaterThanOrEqualTo,
    required TResult Function(_QueryFieldArrayContains value) arrayContains,
    required TResult Function(_QueryFieldArrayContainsAny value)
        arrayContainsAny,
    required TResult Function(_QueryFieldWhereIn value) whereIn,
    required TResult Function(_QueryFieldWhereNotIn value) whereNotIn,
    required TResult Function(_QueryFieldIsNull value) isNull,
  }) {
    return isEqualTo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_QueryFieldIsEqualTo value)? isEqualTo,
    TResult Function(_QueryFieldIsNotEqualTo value)? isNotEqualTo,
    TResult Function(_QueryFieldIsLessThan value)? isLessThan,
    TResult Function(_QueryFieldIsLessThanOrEqualTo value)? isLessThanOrEqualTo,
    TResult Function(_QueryFieldIsGreaterThan value)? isGreaterThan,
    TResult Function(_QueryFieldIsGreaterThanOrEqualTo value)?
        isGreaterThanOrEqualTo,
    TResult Function(_QueryFieldArrayContains value)? arrayContains,
    TResult Function(_QueryFieldArrayContainsAny value)? arrayContainsAny,
    TResult Function(_QueryFieldWhereIn value)? whereIn,
    TResult Function(_QueryFieldWhereNotIn value)? whereNotIn,
    TResult Function(_QueryFieldIsNull value)? isNull,
  }) {
    return isEqualTo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_QueryFieldIsEqualTo value)? isEqualTo,
    TResult Function(_QueryFieldIsNotEqualTo value)? isNotEqualTo,
    TResult Function(_QueryFieldIsLessThan value)? isLessThan,
    TResult Function(_QueryFieldIsLessThanOrEqualTo value)? isLessThanOrEqualTo,
    TResult Function(_QueryFieldIsGreaterThan value)? isGreaterThan,
    TResult Function(_QueryFieldIsGreaterThanOrEqualTo value)?
        isGreaterThanOrEqualTo,
    TResult Function(_QueryFieldArrayContains value)? arrayContains,
    TResult Function(_QueryFieldArrayContainsAny value)? arrayContainsAny,
    TResult Function(_QueryFieldWhereIn value)? whereIn,
    TResult Function(_QueryFieldWhereNotIn value)? whereNotIn,
    TResult Function(_QueryFieldIsNull value)? isNull,
    required TResult orElse(),
  }) {
    if (isEqualTo != null) {
      return isEqualTo(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_QueryFieldIsEqualToToJson(this)..['runtimeType'] = 'isEqualTo';
  }
}

abstract class _QueryFieldIsEqualTo extends QueryField {
  const factory _QueryFieldIsEqualTo(
          @JsonKey() String field, @JsonKey() Object? value) =
      _$_QueryFieldIsEqualTo;
  const _QueryFieldIsEqualTo._() : super._();

  factory _QueryFieldIsEqualTo.fromJson(Map<String, dynamic> json) =
      _$_QueryFieldIsEqualTo.fromJson;

  @override
  @JsonKey()
  String get field => throw _privateConstructorUsedError;
  @JsonKey()
  Object? get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$QueryFieldIsEqualToCopyWith<_QueryFieldIsEqualTo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$QueryFieldIsNotEqualToCopyWith<$Res>
    implements $QueryFieldCopyWith<$Res> {
  factory _$QueryFieldIsNotEqualToCopyWith(_QueryFieldIsNotEqualTo value,
          $Res Function(_QueryFieldIsNotEqualTo) then) =
      __$QueryFieldIsNotEqualToCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey() String field, @JsonKey() Object? value});
}

/// @nodoc
class __$QueryFieldIsNotEqualToCopyWithImpl<$Res>
    extends _$QueryFieldCopyWithImpl<$Res>
    implements _$QueryFieldIsNotEqualToCopyWith<$Res> {
  __$QueryFieldIsNotEqualToCopyWithImpl(_QueryFieldIsNotEqualTo _value,
      $Res Function(_QueryFieldIsNotEqualTo) _then)
      : super(_value, (v) => _then(v as _QueryFieldIsNotEqualTo));

  @override
  _QueryFieldIsNotEqualTo get _value => super._value as _QueryFieldIsNotEqualTo;

  @override
  $Res call({
    Object? field = freezed,
    Object? value = freezed,
  }) {
    return _then(_QueryFieldIsNotEqualTo(
      field == freezed
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as String,
      value == freezed ? _value.value : value,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QueryFieldIsNotEqualTo extends _QueryFieldIsNotEqualTo {
  const _$_QueryFieldIsNotEqualTo(@JsonKey() this.field, @JsonKey() this.value)
      : super._();

  factory _$_QueryFieldIsNotEqualTo.fromJson(Map<String, dynamic> json) =>
      _$$_QueryFieldIsNotEqualToFromJson(json);

  @override
  @JsonKey()
  final String field;
  @override
  @JsonKey()
  final Object? value;

  @override
  String toString() {
    return 'QueryField.isNotEqualTo(field: $field, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _QueryFieldIsNotEqualTo &&
            (identical(other.field, field) ||
                const DeepCollectionEquality().equals(other.field, field)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(field) ^
      const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$QueryFieldIsNotEqualToCopyWith<_QueryFieldIsNotEqualTo> get copyWith =>
      __$QueryFieldIsNotEqualToCopyWithImpl<_QueryFieldIsNotEqualTo>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isEqualTo,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isNotEqualTo,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isLessThan,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isLessThanOrEqualTo,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isGreaterThan,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isGreaterThanOrEqualTo,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        arrayContains,
    required TResult Function(
            @JsonKey() String field, @JsonKey() List<Object?>? value)
        arrayContainsAny,
    required TResult Function(
            @JsonKey() String field, @JsonKey() List<Object?>? value)
        whereIn,
    required TResult Function(
            @JsonKey() String field, @JsonKey() List<Object?>? value)
        whereNotIn,
    required TResult Function(@JsonKey() String field, @JsonKey() bool value)
        isNull,
  }) {
    return isNotEqualTo(field, value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isNotEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isLessThan,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isLessThanOrEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isGreaterThan,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isGreaterThanOrEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        arrayContains,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        arrayContainsAny,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        whereIn,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        whereNotIn,
    TResult Function(@JsonKey() String field, @JsonKey() bool value)? isNull,
  }) {
    return isNotEqualTo?.call(field, value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isNotEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isLessThan,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isLessThanOrEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isGreaterThan,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isGreaterThanOrEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        arrayContains,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        arrayContainsAny,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        whereIn,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        whereNotIn,
    TResult Function(@JsonKey() String field, @JsonKey() bool value)? isNull,
    required TResult orElse(),
  }) {
    if (isNotEqualTo != null) {
      return isNotEqualTo(field, value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_QueryFieldIsEqualTo value) isEqualTo,
    required TResult Function(_QueryFieldIsNotEqualTo value) isNotEqualTo,
    required TResult Function(_QueryFieldIsLessThan value) isLessThan,
    required TResult Function(_QueryFieldIsLessThanOrEqualTo value)
        isLessThanOrEqualTo,
    required TResult Function(_QueryFieldIsGreaterThan value) isGreaterThan,
    required TResult Function(_QueryFieldIsGreaterThanOrEqualTo value)
        isGreaterThanOrEqualTo,
    required TResult Function(_QueryFieldArrayContains value) arrayContains,
    required TResult Function(_QueryFieldArrayContainsAny value)
        arrayContainsAny,
    required TResult Function(_QueryFieldWhereIn value) whereIn,
    required TResult Function(_QueryFieldWhereNotIn value) whereNotIn,
    required TResult Function(_QueryFieldIsNull value) isNull,
  }) {
    return isNotEqualTo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_QueryFieldIsEqualTo value)? isEqualTo,
    TResult Function(_QueryFieldIsNotEqualTo value)? isNotEqualTo,
    TResult Function(_QueryFieldIsLessThan value)? isLessThan,
    TResult Function(_QueryFieldIsLessThanOrEqualTo value)? isLessThanOrEqualTo,
    TResult Function(_QueryFieldIsGreaterThan value)? isGreaterThan,
    TResult Function(_QueryFieldIsGreaterThanOrEqualTo value)?
        isGreaterThanOrEqualTo,
    TResult Function(_QueryFieldArrayContains value)? arrayContains,
    TResult Function(_QueryFieldArrayContainsAny value)? arrayContainsAny,
    TResult Function(_QueryFieldWhereIn value)? whereIn,
    TResult Function(_QueryFieldWhereNotIn value)? whereNotIn,
    TResult Function(_QueryFieldIsNull value)? isNull,
  }) {
    return isNotEqualTo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_QueryFieldIsEqualTo value)? isEqualTo,
    TResult Function(_QueryFieldIsNotEqualTo value)? isNotEqualTo,
    TResult Function(_QueryFieldIsLessThan value)? isLessThan,
    TResult Function(_QueryFieldIsLessThanOrEqualTo value)? isLessThanOrEqualTo,
    TResult Function(_QueryFieldIsGreaterThan value)? isGreaterThan,
    TResult Function(_QueryFieldIsGreaterThanOrEqualTo value)?
        isGreaterThanOrEqualTo,
    TResult Function(_QueryFieldArrayContains value)? arrayContains,
    TResult Function(_QueryFieldArrayContainsAny value)? arrayContainsAny,
    TResult Function(_QueryFieldWhereIn value)? whereIn,
    TResult Function(_QueryFieldWhereNotIn value)? whereNotIn,
    TResult Function(_QueryFieldIsNull value)? isNull,
    required TResult orElse(),
  }) {
    if (isNotEqualTo != null) {
      return isNotEqualTo(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_QueryFieldIsNotEqualToToJson(this)
      ..['runtimeType'] = 'isNotEqualTo';
  }
}

abstract class _QueryFieldIsNotEqualTo extends QueryField {
  const factory _QueryFieldIsNotEqualTo(
          @JsonKey() String field, @JsonKey() Object? value) =
      _$_QueryFieldIsNotEqualTo;
  const _QueryFieldIsNotEqualTo._() : super._();

  factory _QueryFieldIsNotEqualTo.fromJson(Map<String, dynamic> json) =
      _$_QueryFieldIsNotEqualTo.fromJson;

  @override
  @JsonKey()
  String get field => throw _privateConstructorUsedError;
  @JsonKey()
  Object? get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$QueryFieldIsNotEqualToCopyWith<_QueryFieldIsNotEqualTo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$QueryFieldIsLessThanCopyWith<$Res>
    implements $QueryFieldCopyWith<$Res> {
  factory _$QueryFieldIsLessThanCopyWith(_QueryFieldIsLessThan value,
          $Res Function(_QueryFieldIsLessThan) then) =
      __$QueryFieldIsLessThanCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey() String field, @JsonKey() Object? value});
}

/// @nodoc
class __$QueryFieldIsLessThanCopyWithImpl<$Res>
    extends _$QueryFieldCopyWithImpl<$Res>
    implements _$QueryFieldIsLessThanCopyWith<$Res> {
  __$QueryFieldIsLessThanCopyWithImpl(
      _QueryFieldIsLessThan _value, $Res Function(_QueryFieldIsLessThan) _then)
      : super(_value, (v) => _then(v as _QueryFieldIsLessThan));

  @override
  _QueryFieldIsLessThan get _value => super._value as _QueryFieldIsLessThan;

  @override
  $Res call({
    Object? field = freezed,
    Object? value = freezed,
  }) {
    return _then(_QueryFieldIsLessThan(
      field == freezed
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as String,
      value == freezed ? _value.value : value,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QueryFieldIsLessThan extends _QueryFieldIsLessThan {
  const _$_QueryFieldIsLessThan(@JsonKey() this.field, @JsonKey() this.value)
      : super._();

  factory _$_QueryFieldIsLessThan.fromJson(Map<String, dynamic> json) =>
      _$$_QueryFieldIsLessThanFromJson(json);

  @override
  @JsonKey()
  final String field;
  @override
  @JsonKey()
  final Object? value;

  @override
  String toString() {
    return 'QueryField.isLessThan(field: $field, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _QueryFieldIsLessThan &&
            (identical(other.field, field) ||
                const DeepCollectionEquality().equals(other.field, field)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(field) ^
      const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$QueryFieldIsLessThanCopyWith<_QueryFieldIsLessThan> get copyWith =>
      __$QueryFieldIsLessThanCopyWithImpl<_QueryFieldIsLessThan>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isEqualTo,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isNotEqualTo,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isLessThan,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isLessThanOrEqualTo,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isGreaterThan,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isGreaterThanOrEqualTo,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        arrayContains,
    required TResult Function(
            @JsonKey() String field, @JsonKey() List<Object?>? value)
        arrayContainsAny,
    required TResult Function(
            @JsonKey() String field, @JsonKey() List<Object?>? value)
        whereIn,
    required TResult Function(
            @JsonKey() String field, @JsonKey() List<Object?>? value)
        whereNotIn,
    required TResult Function(@JsonKey() String field, @JsonKey() bool value)
        isNull,
  }) {
    return isLessThan(field, value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isNotEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isLessThan,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isLessThanOrEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isGreaterThan,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isGreaterThanOrEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        arrayContains,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        arrayContainsAny,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        whereIn,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        whereNotIn,
    TResult Function(@JsonKey() String field, @JsonKey() bool value)? isNull,
  }) {
    return isLessThan?.call(field, value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isNotEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isLessThan,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isLessThanOrEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isGreaterThan,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isGreaterThanOrEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        arrayContains,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        arrayContainsAny,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        whereIn,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        whereNotIn,
    TResult Function(@JsonKey() String field, @JsonKey() bool value)? isNull,
    required TResult orElse(),
  }) {
    if (isLessThan != null) {
      return isLessThan(field, value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_QueryFieldIsEqualTo value) isEqualTo,
    required TResult Function(_QueryFieldIsNotEqualTo value) isNotEqualTo,
    required TResult Function(_QueryFieldIsLessThan value) isLessThan,
    required TResult Function(_QueryFieldIsLessThanOrEqualTo value)
        isLessThanOrEqualTo,
    required TResult Function(_QueryFieldIsGreaterThan value) isGreaterThan,
    required TResult Function(_QueryFieldIsGreaterThanOrEqualTo value)
        isGreaterThanOrEqualTo,
    required TResult Function(_QueryFieldArrayContains value) arrayContains,
    required TResult Function(_QueryFieldArrayContainsAny value)
        arrayContainsAny,
    required TResult Function(_QueryFieldWhereIn value) whereIn,
    required TResult Function(_QueryFieldWhereNotIn value) whereNotIn,
    required TResult Function(_QueryFieldIsNull value) isNull,
  }) {
    return isLessThan(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_QueryFieldIsEqualTo value)? isEqualTo,
    TResult Function(_QueryFieldIsNotEqualTo value)? isNotEqualTo,
    TResult Function(_QueryFieldIsLessThan value)? isLessThan,
    TResult Function(_QueryFieldIsLessThanOrEqualTo value)? isLessThanOrEqualTo,
    TResult Function(_QueryFieldIsGreaterThan value)? isGreaterThan,
    TResult Function(_QueryFieldIsGreaterThanOrEqualTo value)?
        isGreaterThanOrEqualTo,
    TResult Function(_QueryFieldArrayContains value)? arrayContains,
    TResult Function(_QueryFieldArrayContainsAny value)? arrayContainsAny,
    TResult Function(_QueryFieldWhereIn value)? whereIn,
    TResult Function(_QueryFieldWhereNotIn value)? whereNotIn,
    TResult Function(_QueryFieldIsNull value)? isNull,
  }) {
    return isLessThan?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_QueryFieldIsEqualTo value)? isEqualTo,
    TResult Function(_QueryFieldIsNotEqualTo value)? isNotEqualTo,
    TResult Function(_QueryFieldIsLessThan value)? isLessThan,
    TResult Function(_QueryFieldIsLessThanOrEqualTo value)? isLessThanOrEqualTo,
    TResult Function(_QueryFieldIsGreaterThan value)? isGreaterThan,
    TResult Function(_QueryFieldIsGreaterThanOrEqualTo value)?
        isGreaterThanOrEqualTo,
    TResult Function(_QueryFieldArrayContains value)? arrayContains,
    TResult Function(_QueryFieldArrayContainsAny value)? arrayContainsAny,
    TResult Function(_QueryFieldWhereIn value)? whereIn,
    TResult Function(_QueryFieldWhereNotIn value)? whereNotIn,
    TResult Function(_QueryFieldIsNull value)? isNull,
    required TResult orElse(),
  }) {
    if (isLessThan != null) {
      return isLessThan(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_QueryFieldIsLessThanToJson(this)..['runtimeType'] = 'isLessThan';
  }
}

abstract class _QueryFieldIsLessThan extends QueryField {
  const factory _QueryFieldIsLessThan(
          @JsonKey() String field, @JsonKey() Object? value) =
      _$_QueryFieldIsLessThan;
  const _QueryFieldIsLessThan._() : super._();

  factory _QueryFieldIsLessThan.fromJson(Map<String, dynamic> json) =
      _$_QueryFieldIsLessThan.fromJson;

  @override
  @JsonKey()
  String get field => throw _privateConstructorUsedError;
  @JsonKey()
  Object? get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$QueryFieldIsLessThanCopyWith<_QueryFieldIsLessThan> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$QueryFieldIsLessThanOrEqualToCopyWith<$Res>
    implements $QueryFieldCopyWith<$Res> {
  factory _$QueryFieldIsLessThanOrEqualToCopyWith(
          _QueryFieldIsLessThanOrEqualTo value,
          $Res Function(_QueryFieldIsLessThanOrEqualTo) then) =
      __$QueryFieldIsLessThanOrEqualToCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey() String field, @JsonKey() Object? value});
}

/// @nodoc
class __$QueryFieldIsLessThanOrEqualToCopyWithImpl<$Res>
    extends _$QueryFieldCopyWithImpl<$Res>
    implements _$QueryFieldIsLessThanOrEqualToCopyWith<$Res> {
  __$QueryFieldIsLessThanOrEqualToCopyWithImpl(
      _QueryFieldIsLessThanOrEqualTo _value,
      $Res Function(_QueryFieldIsLessThanOrEqualTo) _then)
      : super(_value, (v) => _then(v as _QueryFieldIsLessThanOrEqualTo));

  @override
  _QueryFieldIsLessThanOrEqualTo get _value =>
      super._value as _QueryFieldIsLessThanOrEqualTo;

  @override
  $Res call({
    Object? field = freezed,
    Object? value = freezed,
  }) {
    return _then(_QueryFieldIsLessThanOrEqualTo(
      field == freezed
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as String,
      value == freezed ? _value.value : value,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QueryFieldIsLessThanOrEqualTo extends _QueryFieldIsLessThanOrEqualTo {
  const _$_QueryFieldIsLessThanOrEqualTo(
      @JsonKey() this.field, @JsonKey() this.value)
      : super._();

  factory _$_QueryFieldIsLessThanOrEqualTo.fromJson(
          Map<String, dynamic> json) =>
      _$$_QueryFieldIsLessThanOrEqualToFromJson(json);

  @override
  @JsonKey()
  final String field;
  @override
  @JsonKey()
  final Object? value;

  @override
  String toString() {
    return 'QueryField.isLessThanOrEqualTo(field: $field, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _QueryFieldIsLessThanOrEqualTo &&
            (identical(other.field, field) ||
                const DeepCollectionEquality().equals(other.field, field)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(field) ^
      const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$QueryFieldIsLessThanOrEqualToCopyWith<_QueryFieldIsLessThanOrEqualTo>
      get copyWith => __$QueryFieldIsLessThanOrEqualToCopyWithImpl<
          _QueryFieldIsLessThanOrEqualTo>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isEqualTo,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isNotEqualTo,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isLessThan,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isLessThanOrEqualTo,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isGreaterThan,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isGreaterThanOrEqualTo,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        arrayContains,
    required TResult Function(
            @JsonKey() String field, @JsonKey() List<Object?>? value)
        arrayContainsAny,
    required TResult Function(
            @JsonKey() String field, @JsonKey() List<Object?>? value)
        whereIn,
    required TResult Function(
            @JsonKey() String field, @JsonKey() List<Object?>? value)
        whereNotIn,
    required TResult Function(@JsonKey() String field, @JsonKey() bool value)
        isNull,
  }) {
    return isLessThanOrEqualTo(field, value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isNotEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isLessThan,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isLessThanOrEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isGreaterThan,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isGreaterThanOrEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        arrayContains,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        arrayContainsAny,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        whereIn,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        whereNotIn,
    TResult Function(@JsonKey() String field, @JsonKey() bool value)? isNull,
  }) {
    return isLessThanOrEqualTo?.call(field, value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isNotEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isLessThan,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isLessThanOrEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isGreaterThan,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isGreaterThanOrEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        arrayContains,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        arrayContainsAny,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        whereIn,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        whereNotIn,
    TResult Function(@JsonKey() String field, @JsonKey() bool value)? isNull,
    required TResult orElse(),
  }) {
    if (isLessThanOrEqualTo != null) {
      return isLessThanOrEqualTo(field, value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_QueryFieldIsEqualTo value) isEqualTo,
    required TResult Function(_QueryFieldIsNotEqualTo value) isNotEqualTo,
    required TResult Function(_QueryFieldIsLessThan value) isLessThan,
    required TResult Function(_QueryFieldIsLessThanOrEqualTo value)
        isLessThanOrEqualTo,
    required TResult Function(_QueryFieldIsGreaterThan value) isGreaterThan,
    required TResult Function(_QueryFieldIsGreaterThanOrEqualTo value)
        isGreaterThanOrEqualTo,
    required TResult Function(_QueryFieldArrayContains value) arrayContains,
    required TResult Function(_QueryFieldArrayContainsAny value)
        arrayContainsAny,
    required TResult Function(_QueryFieldWhereIn value) whereIn,
    required TResult Function(_QueryFieldWhereNotIn value) whereNotIn,
    required TResult Function(_QueryFieldIsNull value) isNull,
  }) {
    return isLessThanOrEqualTo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_QueryFieldIsEqualTo value)? isEqualTo,
    TResult Function(_QueryFieldIsNotEqualTo value)? isNotEqualTo,
    TResult Function(_QueryFieldIsLessThan value)? isLessThan,
    TResult Function(_QueryFieldIsLessThanOrEqualTo value)? isLessThanOrEqualTo,
    TResult Function(_QueryFieldIsGreaterThan value)? isGreaterThan,
    TResult Function(_QueryFieldIsGreaterThanOrEqualTo value)?
        isGreaterThanOrEqualTo,
    TResult Function(_QueryFieldArrayContains value)? arrayContains,
    TResult Function(_QueryFieldArrayContainsAny value)? arrayContainsAny,
    TResult Function(_QueryFieldWhereIn value)? whereIn,
    TResult Function(_QueryFieldWhereNotIn value)? whereNotIn,
    TResult Function(_QueryFieldIsNull value)? isNull,
  }) {
    return isLessThanOrEqualTo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_QueryFieldIsEqualTo value)? isEqualTo,
    TResult Function(_QueryFieldIsNotEqualTo value)? isNotEqualTo,
    TResult Function(_QueryFieldIsLessThan value)? isLessThan,
    TResult Function(_QueryFieldIsLessThanOrEqualTo value)? isLessThanOrEqualTo,
    TResult Function(_QueryFieldIsGreaterThan value)? isGreaterThan,
    TResult Function(_QueryFieldIsGreaterThanOrEqualTo value)?
        isGreaterThanOrEqualTo,
    TResult Function(_QueryFieldArrayContains value)? arrayContains,
    TResult Function(_QueryFieldArrayContainsAny value)? arrayContainsAny,
    TResult Function(_QueryFieldWhereIn value)? whereIn,
    TResult Function(_QueryFieldWhereNotIn value)? whereNotIn,
    TResult Function(_QueryFieldIsNull value)? isNull,
    required TResult orElse(),
  }) {
    if (isLessThanOrEqualTo != null) {
      return isLessThanOrEqualTo(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_QueryFieldIsLessThanOrEqualToToJson(this)
      ..['runtimeType'] = 'isLessThanOrEqualTo';
  }
}

abstract class _QueryFieldIsLessThanOrEqualTo extends QueryField {
  const factory _QueryFieldIsLessThanOrEqualTo(
          @JsonKey() String field, @JsonKey() Object? value) =
      _$_QueryFieldIsLessThanOrEqualTo;
  const _QueryFieldIsLessThanOrEqualTo._() : super._();

  factory _QueryFieldIsLessThanOrEqualTo.fromJson(Map<String, dynamic> json) =
      _$_QueryFieldIsLessThanOrEqualTo.fromJson;

  @override
  @JsonKey()
  String get field => throw _privateConstructorUsedError;
  @JsonKey()
  Object? get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$QueryFieldIsLessThanOrEqualToCopyWith<_QueryFieldIsLessThanOrEqualTo>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$QueryFieldIsGreaterThanCopyWith<$Res>
    implements $QueryFieldCopyWith<$Res> {
  factory _$QueryFieldIsGreaterThanCopyWith(_QueryFieldIsGreaterThan value,
          $Res Function(_QueryFieldIsGreaterThan) then) =
      __$QueryFieldIsGreaterThanCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey() String field, @JsonKey() Object? value});
}

/// @nodoc
class __$QueryFieldIsGreaterThanCopyWithImpl<$Res>
    extends _$QueryFieldCopyWithImpl<$Res>
    implements _$QueryFieldIsGreaterThanCopyWith<$Res> {
  __$QueryFieldIsGreaterThanCopyWithImpl(_QueryFieldIsGreaterThan _value,
      $Res Function(_QueryFieldIsGreaterThan) _then)
      : super(_value, (v) => _then(v as _QueryFieldIsGreaterThan));

  @override
  _QueryFieldIsGreaterThan get _value =>
      super._value as _QueryFieldIsGreaterThan;

  @override
  $Res call({
    Object? field = freezed,
    Object? value = freezed,
  }) {
    return _then(_QueryFieldIsGreaterThan(
      field == freezed
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as String,
      value == freezed ? _value.value : value,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QueryFieldIsGreaterThan extends _QueryFieldIsGreaterThan {
  const _$_QueryFieldIsGreaterThan(@JsonKey() this.field, @JsonKey() this.value)
      : super._();

  factory _$_QueryFieldIsGreaterThan.fromJson(Map<String, dynamic> json) =>
      _$$_QueryFieldIsGreaterThanFromJson(json);

  @override
  @JsonKey()
  final String field;
  @override
  @JsonKey()
  final Object? value;

  @override
  String toString() {
    return 'QueryField.isGreaterThan(field: $field, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _QueryFieldIsGreaterThan &&
            (identical(other.field, field) ||
                const DeepCollectionEquality().equals(other.field, field)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(field) ^
      const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$QueryFieldIsGreaterThanCopyWith<_QueryFieldIsGreaterThan> get copyWith =>
      __$QueryFieldIsGreaterThanCopyWithImpl<_QueryFieldIsGreaterThan>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isEqualTo,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isNotEqualTo,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isLessThan,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isLessThanOrEqualTo,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isGreaterThan,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isGreaterThanOrEqualTo,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        arrayContains,
    required TResult Function(
            @JsonKey() String field, @JsonKey() List<Object?>? value)
        arrayContainsAny,
    required TResult Function(
            @JsonKey() String field, @JsonKey() List<Object?>? value)
        whereIn,
    required TResult Function(
            @JsonKey() String field, @JsonKey() List<Object?>? value)
        whereNotIn,
    required TResult Function(@JsonKey() String field, @JsonKey() bool value)
        isNull,
  }) {
    return isGreaterThan(field, value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isNotEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isLessThan,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isLessThanOrEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isGreaterThan,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isGreaterThanOrEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        arrayContains,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        arrayContainsAny,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        whereIn,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        whereNotIn,
    TResult Function(@JsonKey() String field, @JsonKey() bool value)? isNull,
  }) {
    return isGreaterThan?.call(field, value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isNotEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isLessThan,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isLessThanOrEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isGreaterThan,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isGreaterThanOrEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        arrayContains,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        arrayContainsAny,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        whereIn,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        whereNotIn,
    TResult Function(@JsonKey() String field, @JsonKey() bool value)? isNull,
    required TResult orElse(),
  }) {
    if (isGreaterThan != null) {
      return isGreaterThan(field, value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_QueryFieldIsEqualTo value) isEqualTo,
    required TResult Function(_QueryFieldIsNotEqualTo value) isNotEqualTo,
    required TResult Function(_QueryFieldIsLessThan value) isLessThan,
    required TResult Function(_QueryFieldIsLessThanOrEqualTo value)
        isLessThanOrEqualTo,
    required TResult Function(_QueryFieldIsGreaterThan value) isGreaterThan,
    required TResult Function(_QueryFieldIsGreaterThanOrEqualTo value)
        isGreaterThanOrEqualTo,
    required TResult Function(_QueryFieldArrayContains value) arrayContains,
    required TResult Function(_QueryFieldArrayContainsAny value)
        arrayContainsAny,
    required TResult Function(_QueryFieldWhereIn value) whereIn,
    required TResult Function(_QueryFieldWhereNotIn value) whereNotIn,
    required TResult Function(_QueryFieldIsNull value) isNull,
  }) {
    return isGreaterThan(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_QueryFieldIsEqualTo value)? isEqualTo,
    TResult Function(_QueryFieldIsNotEqualTo value)? isNotEqualTo,
    TResult Function(_QueryFieldIsLessThan value)? isLessThan,
    TResult Function(_QueryFieldIsLessThanOrEqualTo value)? isLessThanOrEqualTo,
    TResult Function(_QueryFieldIsGreaterThan value)? isGreaterThan,
    TResult Function(_QueryFieldIsGreaterThanOrEqualTo value)?
        isGreaterThanOrEqualTo,
    TResult Function(_QueryFieldArrayContains value)? arrayContains,
    TResult Function(_QueryFieldArrayContainsAny value)? arrayContainsAny,
    TResult Function(_QueryFieldWhereIn value)? whereIn,
    TResult Function(_QueryFieldWhereNotIn value)? whereNotIn,
    TResult Function(_QueryFieldIsNull value)? isNull,
  }) {
    return isGreaterThan?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_QueryFieldIsEqualTo value)? isEqualTo,
    TResult Function(_QueryFieldIsNotEqualTo value)? isNotEqualTo,
    TResult Function(_QueryFieldIsLessThan value)? isLessThan,
    TResult Function(_QueryFieldIsLessThanOrEqualTo value)? isLessThanOrEqualTo,
    TResult Function(_QueryFieldIsGreaterThan value)? isGreaterThan,
    TResult Function(_QueryFieldIsGreaterThanOrEqualTo value)?
        isGreaterThanOrEqualTo,
    TResult Function(_QueryFieldArrayContains value)? arrayContains,
    TResult Function(_QueryFieldArrayContainsAny value)? arrayContainsAny,
    TResult Function(_QueryFieldWhereIn value)? whereIn,
    TResult Function(_QueryFieldWhereNotIn value)? whereNotIn,
    TResult Function(_QueryFieldIsNull value)? isNull,
    required TResult orElse(),
  }) {
    if (isGreaterThan != null) {
      return isGreaterThan(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_QueryFieldIsGreaterThanToJson(this)
      ..['runtimeType'] = 'isGreaterThan';
  }
}

abstract class _QueryFieldIsGreaterThan extends QueryField {
  const factory _QueryFieldIsGreaterThan(
          @JsonKey() String field, @JsonKey() Object? value) =
      _$_QueryFieldIsGreaterThan;
  const _QueryFieldIsGreaterThan._() : super._();

  factory _QueryFieldIsGreaterThan.fromJson(Map<String, dynamic> json) =
      _$_QueryFieldIsGreaterThan.fromJson;

  @override
  @JsonKey()
  String get field => throw _privateConstructorUsedError;
  @JsonKey()
  Object? get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$QueryFieldIsGreaterThanCopyWith<_QueryFieldIsGreaterThan> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$QueryFieldIsGreaterThanOrEqualToCopyWith<$Res>
    implements $QueryFieldCopyWith<$Res> {
  factory _$QueryFieldIsGreaterThanOrEqualToCopyWith(
          _QueryFieldIsGreaterThanOrEqualTo value,
          $Res Function(_QueryFieldIsGreaterThanOrEqualTo) then) =
      __$QueryFieldIsGreaterThanOrEqualToCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey() String field, @JsonKey() Object? value});
}

/// @nodoc
class __$QueryFieldIsGreaterThanOrEqualToCopyWithImpl<$Res>
    extends _$QueryFieldCopyWithImpl<$Res>
    implements _$QueryFieldIsGreaterThanOrEqualToCopyWith<$Res> {
  __$QueryFieldIsGreaterThanOrEqualToCopyWithImpl(
      _QueryFieldIsGreaterThanOrEqualTo _value,
      $Res Function(_QueryFieldIsGreaterThanOrEqualTo) _then)
      : super(_value, (v) => _then(v as _QueryFieldIsGreaterThanOrEqualTo));

  @override
  _QueryFieldIsGreaterThanOrEqualTo get _value =>
      super._value as _QueryFieldIsGreaterThanOrEqualTo;

  @override
  $Res call({
    Object? field = freezed,
    Object? value = freezed,
  }) {
    return _then(_QueryFieldIsGreaterThanOrEqualTo(
      field == freezed
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as String,
      value == freezed ? _value.value : value,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QueryFieldIsGreaterThanOrEqualTo
    extends _QueryFieldIsGreaterThanOrEqualTo {
  const _$_QueryFieldIsGreaterThanOrEqualTo(
      @JsonKey() this.field, @JsonKey() this.value)
      : super._();

  factory _$_QueryFieldIsGreaterThanOrEqualTo.fromJson(
          Map<String, dynamic> json) =>
      _$$_QueryFieldIsGreaterThanOrEqualToFromJson(json);

  @override
  @JsonKey()
  final String field;
  @override
  @JsonKey()
  final Object? value;

  @override
  String toString() {
    return 'QueryField.isGreaterThanOrEqualTo(field: $field, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _QueryFieldIsGreaterThanOrEqualTo &&
            (identical(other.field, field) ||
                const DeepCollectionEquality().equals(other.field, field)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(field) ^
      const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$QueryFieldIsGreaterThanOrEqualToCopyWith<_QueryFieldIsGreaterThanOrEqualTo>
      get copyWith => __$QueryFieldIsGreaterThanOrEqualToCopyWithImpl<
          _QueryFieldIsGreaterThanOrEqualTo>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isEqualTo,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isNotEqualTo,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isLessThan,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isLessThanOrEqualTo,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isGreaterThan,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isGreaterThanOrEqualTo,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        arrayContains,
    required TResult Function(
            @JsonKey() String field, @JsonKey() List<Object?>? value)
        arrayContainsAny,
    required TResult Function(
            @JsonKey() String field, @JsonKey() List<Object?>? value)
        whereIn,
    required TResult Function(
            @JsonKey() String field, @JsonKey() List<Object?>? value)
        whereNotIn,
    required TResult Function(@JsonKey() String field, @JsonKey() bool value)
        isNull,
  }) {
    return isGreaterThanOrEqualTo(field, value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isNotEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isLessThan,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isLessThanOrEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isGreaterThan,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isGreaterThanOrEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        arrayContains,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        arrayContainsAny,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        whereIn,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        whereNotIn,
    TResult Function(@JsonKey() String field, @JsonKey() bool value)? isNull,
  }) {
    return isGreaterThanOrEqualTo?.call(field, value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isNotEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isLessThan,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isLessThanOrEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isGreaterThan,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isGreaterThanOrEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        arrayContains,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        arrayContainsAny,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        whereIn,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        whereNotIn,
    TResult Function(@JsonKey() String field, @JsonKey() bool value)? isNull,
    required TResult orElse(),
  }) {
    if (isGreaterThanOrEqualTo != null) {
      return isGreaterThanOrEqualTo(field, value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_QueryFieldIsEqualTo value) isEqualTo,
    required TResult Function(_QueryFieldIsNotEqualTo value) isNotEqualTo,
    required TResult Function(_QueryFieldIsLessThan value) isLessThan,
    required TResult Function(_QueryFieldIsLessThanOrEqualTo value)
        isLessThanOrEqualTo,
    required TResult Function(_QueryFieldIsGreaterThan value) isGreaterThan,
    required TResult Function(_QueryFieldIsGreaterThanOrEqualTo value)
        isGreaterThanOrEqualTo,
    required TResult Function(_QueryFieldArrayContains value) arrayContains,
    required TResult Function(_QueryFieldArrayContainsAny value)
        arrayContainsAny,
    required TResult Function(_QueryFieldWhereIn value) whereIn,
    required TResult Function(_QueryFieldWhereNotIn value) whereNotIn,
    required TResult Function(_QueryFieldIsNull value) isNull,
  }) {
    return isGreaterThanOrEqualTo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_QueryFieldIsEqualTo value)? isEqualTo,
    TResult Function(_QueryFieldIsNotEqualTo value)? isNotEqualTo,
    TResult Function(_QueryFieldIsLessThan value)? isLessThan,
    TResult Function(_QueryFieldIsLessThanOrEqualTo value)? isLessThanOrEqualTo,
    TResult Function(_QueryFieldIsGreaterThan value)? isGreaterThan,
    TResult Function(_QueryFieldIsGreaterThanOrEqualTo value)?
        isGreaterThanOrEqualTo,
    TResult Function(_QueryFieldArrayContains value)? arrayContains,
    TResult Function(_QueryFieldArrayContainsAny value)? arrayContainsAny,
    TResult Function(_QueryFieldWhereIn value)? whereIn,
    TResult Function(_QueryFieldWhereNotIn value)? whereNotIn,
    TResult Function(_QueryFieldIsNull value)? isNull,
  }) {
    return isGreaterThanOrEqualTo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_QueryFieldIsEqualTo value)? isEqualTo,
    TResult Function(_QueryFieldIsNotEqualTo value)? isNotEqualTo,
    TResult Function(_QueryFieldIsLessThan value)? isLessThan,
    TResult Function(_QueryFieldIsLessThanOrEqualTo value)? isLessThanOrEqualTo,
    TResult Function(_QueryFieldIsGreaterThan value)? isGreaterThan,
    TResult Function(_QueryFieldIsGreaterThanOrEqualTo value)?
        isGreaterThanOrEqualTo,
    TResult Function(_QueryFieldArrayContains value)? arrayContains,
    TResult Function(_QueryFieldArrayContainsAny value)? arrayContainsAny,
    TResult Function(_QueryFieldWhereIn value)? whereIn,
    TResult Function(_QueryFieldWhereNotIn value)? whereNotIn,
    TResult Function(_QueryFieldIsNull value)? isNull,
    required TResult orElse(),
  }) {
    if (isGreaterThanOrEqualTo != null) {
      return isGreaterThanOrEqualTo(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_QueryFieldIsGreaterThanOrEqualToToJson(this)
      ..['runtimeType'] = 'isGreaterThanOrEqualTo';
  }
}

abstract class _QueryFieldIsGreaterThanOrEqualTo extends QueryField {
  const factory _QueryFieldIsGreaterThanOrEqualTo(
          @JsonKey() String field, @JsonKey() Object? value) =
      _$_QueryFieldIsGreaterThanOrEqualTo;
  const _QueryFieldIsGreaterThanOrEqualTo._() : super._();

  factory _QueryFieldIsGreaterThanOrEqualTo.fromJson(
      Map<String, dynamic> json) = _$_QueryFieldIsGreaterThanOrEqualTo.fromJson;

  @override
  @JsonKey()
  String get field => throw _privateConstructorUsedError;
  @JsonKey()
  Object? get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$QueryFieldIsGreaterThanOrEqualToCopyWith<_QueryFieldIsGreaterThanOrEqualTo>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$QueryFieldArrayContainsCopyWith<$Res>
    implements $QueryFieldCopyWith<$Res> {
  factory _$QueryFieldArrayContainsCopyWith(_QueryFieldArrayContains value,
          $Res Function(_QueryFieldArrayContains) then) =
      __$QueryFieldArrayContainsCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey() String field, @JsonKey() Object? value});
}

/// @nodoc
class __$QueryFieldArrayContainsCopyWithImpl<$Res>
    extends _$QueryFieldCopyWithImpl<$Res>
    implements _$QueryFieldArrayContainsCopyWith<$Res> {
  __$QueryFieldArrayContainsCopyWithImpl(_QueryFieldArrayContains _value,
      $Res Function(_QueryFieldArrayContains) _then)
      : super(_value, (v) => _then(v as _QueryFieldArrayContains));

  @override
  _QueryFieldArrayContains get _value =>
      super._value as _QueryFieldArrayContains;

  @override
  $Res call({
    Object? field = freezed,
    Object? value = freezed,
  }) {
    return _then(_QueryFieldArrayContains(
      field == freezed
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as String,
      value == freezed ? _value.value : value,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QueryFieldArrayContains extends _QueryFieldArrayContains {
  const _$_QueryFieldArrayContains(@JsonKey() this.field, @JsonKey() this.value)
      : super._();

  factory _$_QueryFieldArrayContains.fromJson(Map<String, dynamic> json) =>
      _$$_QueryFieldArrayContainsFromJson(json);

  @override
  @JsonKey()
  final String field;
  @override
  @JsonKey()
  final Object? value;

  @override
  String toString() {
    return 'QueryField.arrayContains(field: $field, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _QueryFieldArrayContains &&
            (identical(other.field, field) ||
                const DeepCollectionEquality().equals(other.field, field)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(field) ^
      const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$QueryFieldArrayContainsCopyWith<_QueryFieldArrayContains> get copyWith =>
      __$QueryFieldArrayContainsCopyWithImpl<_QueryFieldArrayContains>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isEqualTo,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isNotEqualTo,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isLessThan,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isLessThanOrEqualTo,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isGreaterThan,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isGreaterThanOrEqualTo,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        arrayContains,
    required TResult Function(
            @JsonKey() String field, @JsonKey() List<Object?>? value)
        arrayContainsAny,
    required TResult Function(
            @JsonKey() String field, @JsonKey() List<Object?>? value)
        whereIn,
    required TResult Function(
            @JsonKey() String field, @JsonKey() List<Object?>? value)
        whereNotIn,
    required TResult Function(@JsonKey() String field, @JsonKey() bool value)
        isNull,
  }) {
    return arrayContains(field, value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isNotEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isLessThan,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isLessThanOrEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isGreaterThan,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isGreaterThanOrEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        arrayContains,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        arrayContainsAny,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        whereIn,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        whereNotIn,
    TResult Function(@JsonKey() String field, @JsonKey() bool value)? isNull,
  }) {
    return arrayContains?.call(field, value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isNotEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isLessThan,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isLessThanOrEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isGreaterThan,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isGreaterThanOrEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        arrayContains,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        arrayContainsAny,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        whereIn,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        whereNotIn,
    TResult Function(@JsonKey() String field, @JsonKey() bool value)? isNull,
    required TResult orElse(),
  }) {
    if (arrayContains != null) {
      return arrayContains(field, value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_QueryFieldIsEqualTo value) isEqualTo,
    required TResult Function(_QueryFieldIsNotEqualTo value) isNotEqualTo,
    required TResult Function(_QueryFieldIsLessThan value) isLessThan,
    required TResult Function(_QueryFieldIsLessThanOrEqualTo value)
        isLessThanOrEqualTo,
    required TResult Function(_QueryFieldIsGreaterThan value) isGreaterThan,
    required TResult Function(_QueryFieldIsGreaterThanOrEqualTo value)
        isGreaterThanOrEqualTo,
    required TResult Function(_QueryFieldArrayContains value) arrayContains,
    required TResult Function(_QueryFieldArrayContainsAny value)
        arrayContainsAny,
    required TResult Function(_QueryFieldWhereIn value) whereIn,
    required TResult Function(_QueryFieldWhereNotIn value) whereNotIn,
    required TResult Function(_QueryFieldIsNull value) isNull,
  }) {
    return arrayContains(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_QueryFieldIsEqualTo value)? isEqualTo,
    TResult Function(_QueryFieldIsNotEqualTo value)? isNotEqualTo,
    TResult Function(_QueryFieldIsLessThan value)? isLessThan,
    TResult Function(_QueryFieldIsLessThanOrEqualTo value)? isLessThanOrEqualTo,
    TResult Function(_QueryFieldIsGreaterThan value)? isGreaterThan,
    TResult Function(_QueryFieldIsGreaterThanOrEqualTo value)?
        isGreaterThanOrEqualTo,
    TResult Function(_QueryFieldArrayContains value)? arrayContains,
    TResult Function(_QueryFieldArrayContainsAny value)? arrayContainsAny,
    TResult Function(_QueryFieldWhereIn value)? whereIn,
    TResult Function(_QueryFieldWhereNotIn value)? whereNotIn,
    TResult Function(_QueryFieldIsNull value)? isNull,
  }) {
    return arrayContains?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_QueryFieldIsEqualTo value)? isEqualTo,
    TResult Function(_QueryFieldIsNotEqualTo value)? isNotEqualTo,
    TResult Function(_QueryFieldIsLessThan value)? isLessThan,
    TResult Function(_QueryFieldIsLessThanOrEqualTo value)? isLessThanOrEqualTo,
    TResult Function(_QueryFieldIsGreaterThan value)? isGreaterThan,
    TResult Function(_QueryFieldIsGreaterThanOrEqualTo value)?
        isGreaterThanOrEqualTo,
    TResult Function(_QueryFieldArrayContains value)? arrayContains,
    TResult Function(_QueryFieldArrayContainsAny value)? arrayContainsAny,
    TResult Function(_QueryFieldWhereIn value)? whereIn,
    TResult Function(_QueryFieldWhereNotIn value)? whereNotIn,
    TResult Function(_QueryFieldIsNull value)? isNull,
    required TResult orElse(),
  }) {
    if (arrayContains != null) {
      return arrayContains(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_QueryFieldArrayContainsToJson(this)
      ..['runtimeType'] = 'arrayContains';
  }
}

abstract class _QueryFieldArrayContains extends QueryField {
  const factory _QueryFieldArrayContains(
          @JsonKey() String field, @JsonKey() Object? value) =
      _$_QueryFieldArrayContains;
  const _QueryFieldArrayContains._() : super._();

  factory _QueryFieldArrayContains.fromJson(Map<String, dynamic> json) =
      _$_QueryFieldArrayContains.fromJson;

  @override
  @JsonKey()
  String get field => throw _privateConstructorUsedError;
  @JsonKey()
  Object? get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$QueryFieldArrayContainsCopyWith<_QueryFieldArrayContains> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$QueryFieldArrayContainsAnyCopyWith<$Res>
    implements $QueryFieldCopyWith<$Res> {
  factory _$QueryFieldArrayContainsAnyCopyWith(
          _QueryFieldArrayContainsAny value,
          $Res Function(_QueryFieldArrayContainsAny) then) =
      __$QueryFieldArrayContainsAnyCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey() String field, @JsonKey() List<Object?>? value});
}

/// @nodoc
class __$QueryFieldArrayContainsAnyCopyWithImpl<$Res>
    extends _$QueryFieldCopyWithImpl<$Res>
    implements _$QueryFieldArrayContainsAnyCopyWith<$Res> {
  __$QueryFieldArrayContainsAnyCopyWithImpl(_QueryFieldArrayContainsAny _value,
      $Res Function(_QueryFieldArrayContainsAny) _then)
      : super(_value, (v) => _then(v as _QueryFieldArrayContainsAny));

  @override
  _QueryFieldArrayContainsAny get _value =>
      super._value as _QueryFieldArrayContainsAny;

  @override
  $Res call({
    Object? field = freezed,
    Object? value = freezed,
  }) {
    return _then(_QueryFieldArrayContainsAny(
      field == freezed
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as String,
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as List<Object?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QueryFieldArrayContainsAny extends _QueryFieldArrayContainsAny {
  const _$_QueryFieldArrayContainsAny(
      @JsonKey() this.field, @JsonKey() this.value)
      : super._();

  factory _$_QueryFieldArrayContainsAny.fromJson(Map<String, dynamic> json) =>
      _$$_QueryFieldArrayContainsAnyFromJson(json);

  @override
  @JsonKey()
  final String field;
  @override
  @JsonKey()
  final List<Object?>? value;

  @override
  String toString() {
    return 'QueryField.arrayContainsAny(field: $field, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _QueryFieldArrayContainsAny &&
            (identical(other.field, field) ||
                const DeepCollectionEquality().equals(other.field, field)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(field) ^
      const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$QueryFieldArrayContainsAnyCopyWith<_QueryFieldArrayContainsAny>
      get copyWith => __$QueryFieldArrayContainsAnyCopyWithImpl<
          _QueryFieldArrayContainsAny>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isEqualTo,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isNotEqualTo,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isLessThan,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isLessThanOrEqualTo,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isGreaterThan,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isGreaterThanOrEqualTo,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        arrayContains,
    required TResult Function(
            @JsonKey() String field, @JsonKey() List<Object?>? value)
        arrayContainsAny,
    required TResult Function(
            @JsonKey() String field, @JsonKey() List<Object?>? value)
        whereIn,
    required TResult Function(
            @JsonKey() String field, @JsonKey() List<Object?>? value)
        whereNotIn,
    required TResult Function(@JsonKey() String field, @JsonKey() bool value)
        isNull,
  }) {
    return arrayContainsAny(field, value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isNotEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isLessThan,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isLessThanOrEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isGreaterThan,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isGreaterThanOrEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        arrayContains,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        arrayContainsAny,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        whereIn,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        whereNotIn,
    TResult Function(@JsonKey() String field, @JsonKey() bool value)? isNull,
  }) {
    return arrayContainsAny?.call(field, value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isNotEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isLessThan,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isLessThanOrEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isGreaterThan,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isGreaterThanOrEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        arrayContains,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        arrayContainsAny,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        whereIn,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        whereNotIn,
    TResult Function(@JsonKey() String field, @JsonKey() bool value)? isNull,
    required TResult orElse(),
  }) {
    if (arrayContainsAny != null) {
      return arrayContainsAny(field, value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_QueryFieldIsEqualTo value) isEqualTo,
    required TResult Function(_QueryFieldIsNotEqualTo value) isNotEqualTo,
    required TResult Function(_QueryFieldIsLessThan value) isLessThan,
    required TResult Function(_QueryFieldIsLessThanOrEqualTo value)
        isLessThanOrEqualTo,
    required TResult Function(_QueryFieldIsGreaterThan value) isGreaterThan,
    required TResult Function(_QueryFieldIsGreaterThanOrEqualTo value)
        isGreaterThanOrEqualTo,
    required TResult Function(_QueryFieldArrayContains value) arrayContains,
    required TResult Function(_QueryFieldArrayContainsAny value)
        arrayContainsAny,
    required TResult Function(_QueryFieldWhereIn value) whereIn,
    required TResult Function(_QueryFieldWhereNotIn value) whereNotIn,
    required TResult Function(_QueryFieldIsNull value) isNull,
  }) {
    return arrayContainsAny(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_QueryFieldIsEqualTo value)? isEqualTo,
    TResult Function(_QueryFieldIsNotEqualTo value)? isNotEqualTo,
    TResult Function(_QueryFieldIsLessThan value)? isLessThan,
    TResult Function(_QueryFieldIsLessThanOrEqualTo value)? isLessThanOrEqualTo,
    TResult Function(_QueryFieldIsGreaterThan value)? isGreaterThan,
    TResult Function(_QueryFieldIsGreaterThanOrEqualTo value)?
        isGreaterThanOrEqualTo,
    TResult Function(_QueryFieldArrayContains value)? arrayContains,
    TResult Function(_QueryFieldArrayContainsAny value)? arrayContainsAny,
    TResult Function(_QueryFieldWhereIn value)? whereIn,
    TResult Function(_QueryFieldWhereNotIn value)? whereNotIn,
    TResult Function(_QueryFieldIsNull value)? isNull,
  }) {
    return arrayContainsAny?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_QueryFieldIsEqualTo value)? isEqualTo,
    TResult Function(_QueryFieldIsNotEqualTo value)? isNotEqualTo,
    TResult Function(_QueryFieldIsLessThan value)? isLessThan,
    TResult Function(_QueryFieldIsLessThanOrEqualTo value)? isLessThanOrEqualTo,
    TResult Function(_QueryFieldIsGreaterThan value)? isGreaterThan,
    TResult Function(_QueryFieldIsGreaterThanOrEqualTo value)?
        isGreaterThanOrEqualTo,
    TResult Function(_QueryFieldArrayContains value)? arrayContains,
    TResult Function(_QueryFieldArrayContainsAny value)? arrayContainsAny,
    TResult Function(_QueryFieldWhereIn value)? whereIn,
    TResult Function(_QueryFieldWhereNotIn value)? whereNotIn,
    TResult Function(_QueryFieldIsNull value)? isNull,
    required TResult orElse(),
  }) {
    if (arrayContainsAny != null) {
      return arrayContainsAny(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_QueryFieldArrayContainsAnyToJson(this)
      ..['runtimeType'] = 'arrayContainsAny';
  }
}

abstract class _QueryFieldArrayContainsAny extends QueryField {
  const factory _QueryFieldArrayContainsAny(
          @JsonKey() String field, @JsonKey() List<Object?>? value) =
      _$_QueryFieldArrayContainsAny;
  const _QueryFieldArrayContainsAny._() : super._();

  factory _QueryFieldArrayContainsAny.fromJson(Map<String, dynamic> json) =
      _$_QueryFieldArrayContainsAny.fromJson;

  @override
  @JsonKey()
  String get field => throw _privateConstructorUsedError;
  @JsonKey()
  List<Object?>? get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$QueryFieldArrayContainsAnyCopyWith<_QueryFieldArrayContainsAny>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$QueryFieldWhereInCopyWith<$Res>
    implements $QueryFieldCopyWith<$Res> {
  factory _$QueryFieldWhereInCopyWith(
          _QueryFieldWhereIn value, $Res Function(_QueryFieldWhereIn) then) =
      __$QueryFieldWhereInCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey() String field, @JsonKey() List<Object?>? value});
}

/// @nodoc
class __$QueryFieldWhereInCopyWithImpl<$Res>
    extends _$QueryFieldCopyWithImpl<$Res>
    implements _$QueryFieldWhereInCopyWith<$Res> {
  __$QueryFieldWhereInCopyWithImpl(
      _QueryFieldWhereIn _value, $Res Function(_QueryFieldWhereIn) _then)
      : super(_value, (v) => _then(v as _QueryFieldWhereIn));

  @override
  _QueryFieldWhereIn get _value => super._value as _QueryFieldWhereIn;

  @override
  $Res call({
    Object? field = freezed,
    Object? value = freezed,
  }) {
    return _then(_QueryFieldWhereIn(
      field == freezed
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as String,
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as List<Object?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QueryFieldWhereIn extends _QueryFieldWhereIn {
  const _$_QueryFieldWhereIn(@JsonKey() this.field, @JsonKey() this.value)
      : super._();

  factory _$_QueryFieldWhereIn.fromJson(Map<String, dynamic> json) =>
      _$$_QueryFieldWhereInFromJson(json);

  @override
  @JsonKey()
  final String field;
  @override
  @JsonKey()
  final List<Object?>? value;

  @override
  String toString() {
    return 'QueryField.whereIn(field: $field, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _QueryFieldWhereIn &&
            (identical(other.field, field) ||
                const DeepCollectionEquality().equals(other.field, field)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(field) ^
      const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$QueryFieldWhereInCopyWith<_QueryFieldWhereIn> get copyWith =>
      __$QueryFieldWhereInCopyWithImpl<_QueryFieldWhereIn>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isEqualTo,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isNotEqualTo,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isLessThan,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isLessThanOrEqualTo,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isGreaterThan,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isGreaterThanOrEqualTo,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        arrayContains,
    required TResult Function(
            @JsonKey() String field, @JsonKey() List<Object?>? value)
        arrayContainsAny,
    required TResult Function(
            @JsonKey() String field, @JsonKey() List<Object?>? value)
        whereIn,
    required TResult Function(
            @JsonKey() String field, @JsonKey() List<Object?>? value)
        whereNotIn,
    required TResult Function(@JsonKey() String field, @JsonKey() bool value)
        isNull,
  }) {
    return whereIn(field, value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isNotEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isLessThan,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isLessThanOrEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isGreaterThan,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isGreaterThanOrEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        arrayContains,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        arrayContainsAny,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        whereIn,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        whereNotIn,
    TResult Function(@JsonKey() String field, @JsonKey() bool value)? isNull,
  }) {
    return whereIn?.call(field, value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isNotEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isLessThan,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isLessThanOrEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isGreaterThan,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isGreaterThanOrEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        arrayContains,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        arrayContainsAny,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        whereIn,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        whereNotIn,
    TResult Function(@JsonKey() String field, @JsonKey() bool value)? isNull,
    required TResult orElse(),
  }) {
    if (whereIn != null) {
      return whereIn(field, value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_QueryFieldIsEqualTo value) isEqualTo,
    required TResult Function(_QueryFieldIsNotEqualTo value) isNotEqualTo,
    required TResult Function(_QueryFieldIsLessThan value) isLessThan,
    required TResult Function(_QueryFieldIsLessThanOrEqualTo value)
        isLessThanOrEqualTo,
    required TResult Function(_QueryFieldIsGreaterThan value) isGreaterThan,
    required TResult Function(_QueryFieldIsGreaterThanOrEqualTo value)
        isGreaterThanOrEqualTo,
    required TResult Function(_QueryFieldArrayContains value) arrayContains,
    required TResult Function(_QueryFieldArrayContainsAny value)
        arrayContainsAny,
    required TResult Function(_QueryFieldWhereIn value) whereIn,
    required TResult Function(_QueryFieldWhereNotIn value) whereNotIn,
    required TResult Function(_QueryFieldIsNull value) isNull,
  }) {
    return whereIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_QueryFieldIsEqualTo value)? isEqualTo,
    TResult Function(_QueryFieldIsNotEqualTo value)? isNotEqualTo,
    TResult Function(_QueryFieldIsLessThan value)? isLessThan,
    TResult Function(_QueryFieldIsLessThanOrEqualTo value)? isLessThanOrEqualTo,
    TResult Function(_QueryFieldIsGreaterThan value)? isGreaterThan,
    TResult Function(_QueryFieldIsGreaterThanOrEqualTo value)?
        isGreaterThanOrEqualTo,
    TResult Function(_QueryFieldArrayContains value)? arrayContains,
    TResult Function(_QueryFieldArrayContainsAny value)? arrayContainsAny,
    TResult Function(_QueryFieldWhereIn value)? whereIn,
    TResult Function(_QueryFieldWhereNotIn value)? whereNotIn,
    TResult Function(_QueryFieldIsNull value)? isNull,
  }) {
    return whereIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_QueryFieldIsEqualTo value)? isEqualTo,
    TResult Function(_QueryFieldIsNotEqualTo value)? isNotEqualTo,
    TResult Function(_QueryFieldIsLessThan value)? isLessThan,
    TResult Function(_QueryFieldIsLessThanOrEqualTo value)? isLessThanOrEqualTo,
    TResult Function(_QueryFieldIsGreaterThan value)? isGreaterThan,
    TResult Function(_QueryFieldIsGreaterThanOrEqualTo value)?
        isGreaterThanOrEqualTo,
    TResult Function(_QueryFieldArrayContains value)? arrayContains,
    TResult Function(_QueryFieldArrayContainsAny value)? arrayContainsAny,
    TResult Function(_QueryFieldWhereIn value)? whereIn,
    TResult Function(_QueryFieldWhereNotIn value)? whereNotIn,
    TResult Function(_QueryFieldIsNull value)? isNull,
    required TResult orElse(),
  }) {
    if (whereIn != null) {
      return whereIn(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_QueryFieldWhereInToJson(this)..['runtimeType'] = 'whereIn';
  }
}

abstract class _QueryFieldWhereIn extends QueryField {
  const factory _QueryFieldWhereIn(
          @JsonKey() String field, @JsonKey() List<Object?>? value) =
      _$_QueryFieldWhereIn;
  const _QueryFieldWhereIn._() : super._();

  factory _QueryFieldWhereIn.fromJson(Map<String, dynamic> json) =
      _$_QueryFieldWhereIn.fromJson;

  @override
  @JsonKey()
  String get field => throw _privateConstructorUsedError;
  @JsonKey()
  List<Object?>? get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$QueryFieldWhereInCopyWith<_QueryFieldWhereIn> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$QueryFieldWhereNotInCopyWith<$Res>
    implements $QueryFieldCopyWith<$Res> {
  factory _$QueryFieldWhereNotInCopyWith(_QueryFieldWhereNotIn value,
          $Res Function(_QueryFieldWhereNotIn) then) =
      __$QueryFieldWhereNotInCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey() String field, @JsonKey() List<Object?>? value});
}

/// @nodoc
class __$QueryFieldWhereNotInCopyWithImpl<$Res>
    extends _$QueryFieldCopyWithImpl<$Res>
    implements _$QueryFieldWhereNotInCopyWith<$Res> {
  __$QueryFieldWhereNotInCopyWithImpl(
      _QueryFieldWhereNotIn _value, $Res Function(_QueryFieldWhereNotIn) _then)
      : super(_value, (v) => _then(v as _QueryFieldWhereNotIn));

  @override
  _QueryFieldWhereNotIn get _value => super._value as _QueryFieldWhereNotIn;

  @override
  $Res call({
    Object? field = freezed,
    Object? value = freezed,
  }) {
    return _then(_QueryFieldWhereNotIn(
      field == freezed
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as String,
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as List<Object?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QueryFieldWhereNotIn extends _QueryFieldWhereNotIn {
  const _$_QueryFieldWhereNotIn(@JsonKey() this.field, @JsonKey() this.value)
      : super._();

  factory _$_QueryFieldWhereNotIn.fromJson(Map<String, dynamic> json) =>
      _$$_QueryFieldWhereNotInFromJson(json);

  @override
  @JsonKey()
  final String field;
  @override
  @JsonKey()
  final List<Object?>? value;

  @override
  String toString() {
    return 'QueryField.whereNotIn(field: $field, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _QueryFieldWhereNotIn &&
            (identical(other.field, field) ||
                const DeepCollectionEquality().equals(other.field, field)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(field) ^
      const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$QueryFieldWhereNotInCopyWith<_QueryFieldWhereNotIn> get copyWith =>
      __$QueryFieldWhereNotInCopyWithImpl<_QueryFieldWhereNotIn>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isEqualTo,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isNotEqualTo,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isLessThan,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isLessThanOrEqualTo,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isGreaterThan,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isGreaterThanOrEqualTo,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        arrayContains,
    required TResult Function(
            @JsonKey() String field, @JsonKey() List<Object?>? value)
        arrayContainsAny,
    required TResult Function(
            @JsonKey() String field, @JsonKey() List<Object?>? value)
        whereIn,
    required TResult Function(
            @JsonKey() String field, @JsonKey() List<Object?>? value)
        whereNotIn,
    required TResult Function(@JsonKey() String field, @JsonKey() bool value)
        isNull,
  }) {
    return whereNotIn(field, value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isNotEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isLessThan,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isLessThanOrEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isGreaterThan,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isGreaterThanOrEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        arrayContains,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        arrayContainsAny,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        whereIn,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        whereNotIn,
    TResult Function(@JsonKey() String field, @JsonKey() bool value)? isNull,
  }) {
    return whereNotIn?.call(field, value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isNotEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isLessThan,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isLessThanOrEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isGreaterThan,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isGreaterThanOrEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        arrayContains,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        arrayContainsAny,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        whereIn,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        whereNotIn,
    TResult Function(@JsonKey() String field, @JsonKey() bool value)? isNull,
    required TResult orElse(),
  }) {
    if (whereNotIn != null) {
      return whereNotIn(field, value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_QueryFieldIsEqualTo value) isEqualTo,
    required TResult Function(_QueryFieldIsNotEqualTo value) isNotEqualTo,
    required TResult Function(_QueryFieldIsLessThan value) isLessThan,
    required TResult Function(_QueryFieldIsLessThanOrEqualTo value)
        isLessThanOrEqualTo,
    required TResult Function(_QueryFieldIsGreaterThan value) isGreaterThan,
    required TResult Function(_QueryFieldIsGreaterThanOrEqualTo value)
        isGreaterThanOrEqualTo,
    required TResult Function(_QueryFieldArrayContains value) arrayContains,
    required TResult Function(_QueryFieldArrayContainsAny value)
        arrayContainsAny,
    required TResult Function(_QueryFieldWhereIn value) whereIn,
    required TResult Function(_QueryFieldWhereNotIn value) whereNotIn,
    required TResult Function(_QueryFieldIsNull value) isNull,
  }) {
    return whereNotIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_QueryFieldIsEqualTo value)? isEqualTo,
    TResult Function(_QueryFieldIsNotEqualTo value)? isNotEqualTo,
    TResult Function(_QueryFieldIsLessThan value)? isLessThan,
    TResult Function(_QueryFieldIsLessThanOrEqualTo value)? isLessThanOrEqualTo,
    TResult Function(_QueryFieldIsGreaterThan value)? isGreaterThan,
    TResult Function(_QueryFieldIsGreaterThanOrEqualTo value)?
        isGreaterThanOrEqualTo,
    TResult Function(_QueryFieldArrayContains value)? arrayContains,
    TResult Function(_QueryFieldArrayContainsAny value)? arrayContainsAny,
    TResult Function(_QueryFieldWhereIn value)? whereIn,
    TResult Function(_QueryFieldWhereNotIn value)? whereNotIn,
    TResult Function(_QueryFieldIsNull value)? isNull,
  }) {
    return whereNotIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_QueryFieldIsEqualTo value)? isEqualTo,
    TResult Function(_QueryFieldIsNotEqualTo value)? isNotEqualTo,
    TResult Function(_QueryFieldIsLessThan value)? isLessThan,
    TResult Function(_QueryFieldIsLessThanOrEqualTo value)? isLessThanOrEqualTo,
    TResult Function(_QueryFieldIsGreaterThan value)? isGreaterThan,
    TResult Function(_QueryFieldIsGreaterThanOrEqualTo value)?
        isGreaterThanOrEqualTo,
    TResult Function(_QueryFieldArrayContains value)? arrayContains,
    TResult Function(_QueryFieldArrayContainsAny value)? arrayContainsAny,
    TResult Function(_QueryFieldWhereIn value)? whereIn,
    TResult Function(_QueryFieldWhereNotIn value)? whereNotIn,
    TResult Function(_QueryFieldIsNull value)? isNull,
    required TResult orElse(),
  }) {
    if (whereNotIn != null) {
      return whereNotIn(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_QueryFieldWhereNotInToJson(this)..['runtimeType'] = 'whereNotIn';
  }
}

abstract class _QueryFieldWhereNotIn extends QueryField {
  const factory _QueryFieldWhereNotIn(
          @JsonKey() String field, @JsonKey() List<Object?>? value) =
      _$_QueryFieldWhereNotIn;
  const _QueryFieldWhereNotIn._() : super._();

  factory _QueryFieldWhereNotIn.fromJson(Map<String, dynamic> json) =
      _$_QueryFieldWhereNotIn.fromJson;

  @override
  @JsonKey()
  String get field => throw _privateConstructorUsedError;
  @JsonKey()
  List<Object?>? get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$QueryFieldWhereNotInCopyWith<_QueryFieldWhereNotIn> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$QueryFieldIsNullCopyWith<$Res>
    implements $QueryFieldCopyWith<$Res> {
  factory _$QueryFieldIsNullCopyWith(
          _QueryFieldIsNull value, $Res Function(_QueryFieldIsNull) then) =
      __$QueryFieldIsNullCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey() String field, @JsonKey() bool value});
}

/// @nodoc
class __$QueryFieldIsNullCopyWithImpl<$Res>
    extends _$QueryFieldCopyWithImpl<$Res>
    implements _$QueryFieldIsNullCopyWith<$Res> {
  __$QueryFieldIsNullCopyWithImpl(
      _QueryFieldIsNull _value, $Res Function(_QueryFieldIsNull) _then)
      : super(_value, (v) => _then(v as _QueryFieldIsNull));

  @override
  _QueryFieldIsNull get _value => super._value as _QueryFieldIsNull;

  @override
  $Res call({
    Object? field = freezed,
    Object? value = freezed,
  }) {
    return _then(_QueryFieldIsNull(
      field == freezed
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as String,
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QueryFieldIsNull extends _QueryFieldIsNull {
  const _$_QueryFieldIsNull(@JsonKey() this.field, @JsonKey() this.value)
      : super._();

  factory _$_QueryFieldIsNull.fromJson(Map<String, dynamic> json) =>
      _$$_QueryFieldIsNullFromJson(json);

  @override
  @JsonKey()
  final String field;
  @override
  @JsonKey()
  final bool value;

  @override
  String toString() {
    return 'QueryField.isNull(field: $field, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _QueryFieldIsNull &&
            (identical(other.field, field) ||
                const DeepCollectionEquality().equals(other.field, field)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(field) ^
      const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$QueryFieldIsNullCopyWith<_QueryFieldIsNull> get copyWith =>
      __$QueryFieldIsNullCopyWithImpl<_QueryFieldIsNull>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isEqualTo,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isNotEqualTo,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isLessThan,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isLessThanOrEqualTo,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isGreaterThan,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        isGreaterThanOrEqualTo,
    required TResult Function(@JsonKey() String field, @JsonKey() Object? value)
        arrayContains,
    required TResult Function(
            @JsonKey() String field, @JsonKey() List<Object?>? value)
        arrayContainsAny,
    required TResult Function(
            @JsonKey() String field, @JsonKey() List<Object?>? value)
        whereIn,
    required TResult Function(
            @JsonKey() String field, @JsonKey() List<Object?>? value)
        whereNotIn,
    required TResult Function(@JsonKey() String field, @JsonKey() bool value)
        isNull,
  }) {
    return isNull(field, value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isNotEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isLessThan,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isLessThanOrEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isGreaterThan,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isGreaterThanOrEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        arrayContains,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        arrayContainsAny,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        whereIn,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        whereNotIn,
    TResult Function(@JsonKey() String field, @JsonKey() bool value)? isNull,
  }) {
    return isNull?.call(field, value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isNotEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isLessThan,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isLessThanOrEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isGreaterThan,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        isGreaterThanOrEqualTo,
    TResult Function(@JsonKey() String field, @JsonKey() Object? value)?
        arrayContains,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        arrayContainsAny,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        whereIn,
    TResult Function(@JsonKey() String field, @JsonKey() List<Object?>? value)?
        whereNotIn,
    TResult Function(@JsonKey() String field, @JsonKey() bool value)? isNull,
    required TResult orElse(),
  }) {
    if (isNull != null) {
      return isNull(field, value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_QueryFieldIsEqualTo value) isEqualTo,
    required TResult Function(_QueryFieldIsNotEqualTo value) isNotEqualTo,
    required TResult Function(_QueryFieldIsLessThan value) isLessThan,
    required TResult Function(_QueryFieldIsLessThanOrEqualTo value)
        isLessThanOrEqualTo,
    required TResult Function(_QueryFieldIsGreaterThan value) isGreaterThan,
    required TResult Function(_QueryFieldIsGreaterThanOrEqualTo value)
        isGreaterThanOrEqualTo,
    required TResult Function(_QueryFieldArrayContains value) arrayContains,
    required TResult Function(_QueryFieldArrayContainsAny value)
        arrayContainsAny,
    required TResult Function(_QueryFieldWhereIn value) whereIn,
    required TResult Function(_QueryFieldWhereNotIn value) whereNotIn,
    required TResult Function(_QueryFieldIsNull value) isNull,
  }) {
    return isNull(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_QueryFieldIsEqualTo value)? isEqualTo,
    TResult Function(_QueryFieldIsNotEqualTo value)? isNotEqualTo,
    TResult Function(_QueryFieldIsLessThan value)? isLessThan,
    TResult Function(_QueryFieldIsLessThanOrEqualTo value)? isLessThanOrEqualTo,
    TResult Function(_QueryFieldIsGreaterThan value)? isGreaterThan,
    TResult Function(_QueryFieldIsGreaterThanOrEqualTo value)?
        isGreaterThanOrEqualTo,
    TResult Function(_QueryFieldArrayContains value)? arrayContains,
    TResult Function(_QueryFieldArrayContainsAny value)? arrayContainsAny,
    TResult Function(_QueryFieldWhereIn value)? whereIn,
    TResult Function(_QueryFieldWhereNotIn value)? whereNotIn,
    TResult Function(_QueryFieldIsNull value)? isNull,
  }) {
    return isNull?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_QueryFieldIsEqualTo value)? isEqualTo,
    TResult Function(_QueryFieldIsNotEqualTo value)? isNotEqualTo,
    TResult Function(_QueryFieldIsLessThan value)? isLessThan,
    TResult Function(_QueryFieldIsLessThanOrEqualTo value)? isLessThanOrEqualTo,
    TResult Function(_QueryFieldIsGreaterThan value)? isGreaterThan,
    TResult Function(_QueryFieldIsGreaterThanOrEqualTo value)?
        isGreaterThanOrEqualTo,
    TResult Function(_QueryFieldArrayContains value)? arrayContains,
    TResult Function(_QueryFieldArrayContainsAny value)? arrayContainsAny,
    TResult Function(_QueryFieldWhereIn value)? whereIn,
    TResult Function(_QueryFieldWhereNotIn value)? whereNotIn,
    TResult Function(_QueryFieldIsNull value)? isNull,
    required TResult orElse(),
  }) {
    if (isNull != null) {
      return isNull(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_QueryFieldIsNullToJson(this)..['runtimeType'] = 'isNull';
  }
}

abstract class _QueryFieldIsNull extends QueryField {
  const factory _QueryFieldIsNull(
      @JsonKey() String field, @JsonKey() bool value) = _$_QueryFieldIsNull;
  const _QueryFieldIsNull._() : super._();

  factory _QueryFieldIsNull.fromJson(Map<String, dynamic> json) =
      _$_QueryFieldIsNull.fromJson;

  @override
  @JsonKey()
  String get field => throw _privateConstructorUsedError;
  @JsonKey()
  bool get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$QueryFieldIsNullCopyWith<_QueryFieldIsNull> get copyWith =>
      throw _privateConstructorUsedError;
}

FirebaseIsolateBaseQuery _$FirebaseIsolateBaseQueryFromJson(
    Map<String, dynamic> json) {
  return _FirebaseIsolateBaseQuery.fromJson(json);
}

/// @nodoc
class _$FirebaseIsolateBaseQueryTearOff {
  const _$FirebaseIsolateBaseQueryTearOff();

  _FirebaseIsolateBaseQuery call(
      {@JsonKey() required String collectionPath,
      @JsonKey() required List<QueryField> fields}) {
    return _FirebaseIsolateBaseQuery(
      collectionPath: collectionPath,
      fields: fields,
    );
  }

  FirebaseIsolateBaseQuery fromJson(Map<String, Object> json) {
    return FirebaseIsolateBaseQuery.fromJson(json);
  }
}

/// @nodoc
const $FirebaseIsolateBaseQuery = _$FirebaseIsolateBaseQueryTearOff();

/// @nodoc
mixin _$FirebaseIsolateBaseQuery {
  @JsonKey()
  String get collectionPath => throw _privateConstructorUsedError;
  @JsonKey()
  List<QueryField> get fields => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FirebaseIsolateBaseQueryCopyWith<FirebaseIsolateBaseQuery> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FirebaseIsolateBaseQueryCopyWith<$Res> {
  factory $FirebaseIsolateBaseQueryCopyWith(FirebaseIsolateBaseQuery value,
          $Res Function(FirebaseIsolateBaseQuery) then) =
      _$FirebaseIsolateBaseQueryCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey() String collectionPath, @JsonKey() List<QueryField> fields});
}

/// @nodoc
class _$FirebaseIsolateBaseQueryCopyWithImpl<$Res>
    implements $FirebaseIsolateBaseQueryCopyWith<$Res> {
  _$FirebaseIsolateBaseQueryCopyWithImpl(this._value, this._then);

  final FirebaseIsolateBaseQuery _value;
  // ignore: unused_field
  final $Res Function(FirebaseIsolateBaseQuery) _then;

  @override
  $Res call({
    Object? collectionPath = freezed,
    Object? fields = freezed,
  }) {
    return _then(_value.copyWith(
      collectionPath: collectionPath == freezed
          ? _value.collectionPath
          : collectionPath // ignore: cast_nullable_to_non_nullable
              as String,
      fields: fields == freezed
          ? _value.fields
          : fields // ignore: cast_nullable_to_non_nullable
              as List<QueryField>,
    ));
  }
}

/// @nodoc
abstract class _$FirebaseIsolateBaseQueryCopyWith<$Res>
    implements $FirebaseIsolateBaseQueryCopyWith<$Res> {
  factory _$FirebaseIsolateBaseQueryCopyWith(_FirebaseIsolateBaseQuery value,
          $Res Function(_FirebaseIsolateBaseQuery) then) =
      __$FirebaseIsolateBaseQueryCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey() String collectionPath, @JsonKey() List<QueryField> fields});
}

/// @nodoc
class __$FirebaseIsolateBaseQueryCopyWithImpl<$Res>
    extends _$FirebaseIsolateBaseQueryCopyWithImpl<$Res>
    implements _$FirebaseIsolateBaseQueryCopyWith<$Res> {
  __$FirebaseIsolateBaseQueryCopyWithImpl(_FirebaseIsolateBaseQuery _value,
      $Res Function(_FirebaseIsolateBaseQuery) _then)
      : super(_value, (v) => _then(v as _FirebaseIsolateBaseQuery));

  @override
  _FirebaseIsolateBaseQuery get _value =>
      super._value as _FirebaseIsolateBaseQuery;

  @override
  $Res call({
    Object? collectionPath = freezed,
    Object? fields = freezed,
  }) {
    return _then(_FirebaseIsolateBaseQuery(
      collectionPath: collectionPath == freezed
          ? _value.collectionPath
          : collectionPath // ignore: cast_nullable_to_non_nullable
              as String,
      fields: fields == freezed
          ? _value.fields
          : fields // ignore: cast_nullable_to_non_nullable
              as List<QueryField>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FirebaseIsolateBaseQuery extends _FirebaseIsolateBaseQuery {
  const _$_FirebaseIsolateBaseQuery(
      {@JsonKey() required this.collectionPath,
      @JsonKey() required this.fields})
      : super._();

  factory _$_FirebaseIsolateBaseQuery.fromJson(Map<String, dynamic> json) =>
      _$$_FirebaseIsolateBaseQueryFromJson(json);

  @override
  @JsonKey()
  final String collectionPath;
  @override
  @JsonKey()
  final List<QueryField> fields;

  @override
  String toString() {
    return 'FirebaseIsolateBaseQuery(collectionPath: $collectionPath, fields: $fields)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FirebaseIsolateBaseQuery &&
            (identical(other.collectionPath, collectionPath) ||
                const DeepCollectionEquality()
                    .equals(other.collectionPath, collectionPath)) &&
            (identical(other.fields, fields) ||
                const DeepCollectionEquality().equals(other.fields, fields)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(collectionPath) ^
      const DeepCollectionEquality().hash(fields);

  @JsonKey(ignore: true)
  @override
  _$FirebaseIsolateBaseQueryCopyWith<_FirebaseIsolateBaseQuery> get copyWith =>
      __$FirebaseIsolateBaseQueryCopyWithImpl<_FirebaseIsolateBaseQuery>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FirebaseIsolateBaseQueryToJson(this);
  }
}

abstract class _FirebaseIsolateBaseQuery extends FirebaseIsolateBaseQuery {
  const factory _FirebaseIsolateBaseQuery(
          {@JsonKey() required String collectionPath,
          @JsonKey() required List<QueryField> fields}) =
      _$_FirebaseIsolateBaseQuery;
  const _FirebaseIsolateBaseQuery._() : super._();

  factory _FirebaseIsolateBaseQuery.fromJson(Map<String, dynamic> json) =
      _$_FirebaseIsolateBaseQuery.fromJson;

  @override
  @JsonKey()
  String get collectionPath => throw _privateConstructorUsedError;
  @override
  @JsonKey()
  List<QueryField> get fields => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FirebaseIsolateBaseQueryCopyWith<_FirebaseIsolateBaseQuery> get copyWith =>
      throw _privateConstructorUsedError;
}

FirebaseIsolateQuery _$FirebaseIsolateQueryFromJson(Map<String, dynamic> json) {
  return _FirebaseIsolateQuery.fromJson(json);
}

/// @nodoc
class _$FirebaseIsolateQueryTearOff {
  const _$FirebaseIsolateQueryTearOff();

  _FirebaseIsolateQuery call(
      {@JsonKey() required FirebaseIsolateBaseQuery base,
      @JsonKey() required List<QueryOrder> orders,
      @JsonKey() required QueryValues values,
      @JsonKey() int? limit}) {
    return _FirebaseIsolateQuery(
      base: base,
      orders: orders,
      values: values,
      limit: limit,
    );
  }

  FirebaseIsolateQuery fromJson(Map<String, Object> json) {
    return FirebaseIsolateQuery.fromJson(json);
  }
}

/// @nodoc
const $FirebaseIsolateQuery = _$FirebaseIsolateQueryTearOff();

/// @nodoc
mixin _$FirebaseIsolateQuery {
  @JsonKey()
  FirebaseIsolateBaseQuery get base => throw _privateConstructorUsedError;
  @JsonKey()
  List<QueryOrder> get orders => throw _privateConstructorUsedError;
  @JsonKey()
  QueryValues get values => throw _privateConstructorUsedError;
  @JsonKey()
  int? get limit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FirebaseIsolateQueryCopyWith<FirebaseIsolateQuery> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FirebaseIsolateQueryCopyWith<$Res> {
  factory $FirebaseIsolateQueryCopyWith(FirebaseIsolateQuery value,
          $Res Function(FirebaseIsolateQuery) then) =
      _$FirebaseIsolateQueryCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey() FirebaseIsolateBaseQuery base,
      @JsonKey() List<QueryOrder> orders,
      @JsonKey() QueryValues values,
      @JsonKey() int? limit});

  $FirebaseIsolateBaseQueryCopyWith<$Res> get base;
  $QueryValuesCopyWith<$Res> get values;
}

/// @nodoc
class _$FirebaseIsolateQueryCopyWithImpl<$Res>
    implements $FirebaseIsolateQueryCopyWith<$Res> {
  _$FirebaseIsolateQueryCopyWithImpl(this._value, this._then);

  final FirebaseIsolateQuery _value;
  // ignore: unused_field
  final $Res Function(FirebaseIsolateQuery) _then;

  @override
  $Res call({
    Object? base = freezed,
    Object? orders = freezed,
    Object? values = freezed,
    Object? limit = freezed,
  }) {
    return _then(_value.copyWith(
      base: base == freezed
          ? _value.base
          : base // ignore: cast_nullable_to_non_nullable
              as FirebaseIsolateBaseQuery,
      orders: orders == freezed
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<QueryOrder>,
      values: values == freezed
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as QueryValues,
      limit: limit == freezed
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }

  @override
  $FirebaseIsolateBaseQueryCopyWith<$Res> get base {
    return $FirebaseIsolateBaseQueryCopyWith<$Res>(_value.base, (value) {
      return _then(_value.copyWith(base: value));
    });
  }

  @override
  $QueryValuesCopyWith<$Res> get values {
    return $QueryValuesCopyWith<$Res>(_value.values, (value) {
      return _then(_value.copyWith(values: value));
    });
  }
}

/// @nodoc
abstract class _$FirebaseIsolateQueryCopyWith<$Res>
    implements $FirebaseIsolateQueryCopyWith<$Res> {
  factory _$FirebaseIsolateQueryCopyWith(_FirebaseIsolateQuery value,
          $Res Function(_FirebaseIsolateQuery) then) =
      __$FirebaseIsolateQueryCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey() FirebaseIsolateBaseQuery base,
      @JsonKey() List<QueryOrder> orders,
      @JsonKey() QueryValues values,
      @JsonKey() int? limit});

  @override
  $FirebaseIsolateBaseQueryCopyWith<$Res> get base;
  @override
  $QueryValuesCopyWith<$Res> get values;
}

/// @nodoc
class __$FirebaseIsolateQueryCopyWithImpl<$Res>
    extends _$FirebaseIsolateQueryCopyWithImpl<$Res>
    implements _$FirebaseIsolateQueryCopyWith<$Res> {
  __$FirebaseIsolateQueryCopyWithImpl(
      _FirebaseIsolateQuery _value, $Res Function(_FirebaseIsolateQuery) _then)
      : super(_value, (v) => _then(v as _FirebaseIsolateQuery));

  @override
  _FirebaseIsolateQuery get _value => super._value as _FirebaseIsolateQuery;

  @override
  $Res call({
    Object? base = freezed,
    Object? orders = freezed,
    Object? values = freezed,
    Object? limit = freezed,
  }) {
    return _then(_FirebaseIsolateQuery(
      base: base == freezed
          ? _value.base
          : base // ignore: cast_nullable_to_non_nullable
              as FirebaseIsolateBaseQuery,
      orders: orders == freezed
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<QueryOrder>,
      values: values == freezed
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as QueryValues,
      limit: limit == freezed
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FirebaseIsolateQuery extends _FirebaseIsolateQuery {
  const _$_FirebaseIsolateQuery(
      {@JsonKey() required this.base,
      @JsonKey() required this.orders,
      @JsonKey() required this.values,
      @JsonKey() this.limit})
      : super._();

  factory _$_FirebaseIsolateQuery.fromJson(Map<String, dynamic> json) =>
      _$$_FirebaseIsolateQueryFromJson(json);

  @override
  @JsonKey()
  final FirebaseIsolateBaseQuery base;
  @override
  @JsonKey()
  final List<QueryOrder> orders;
  @override
  @JsonKey()
  final QueryValues values;
  @override
  @JsonKey()
  final int? limit;

  @override
  String toString() {
    return 'FirebaseIsolateQuery(base: $base, orders: $orders, values: $values, limit: $limit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FirebaseIsolateQuery &&
            (identical(other.base, base) ||
                const DeepCollectionEquality().equals(other.base, base)) &&
            (identical(other.orders, orders) ||
                const DeepCollectionEquality().equals(other.orders, orders)) &&
            (identical(other.values, values) ||
                const DeepCollectionEquality().equals(other.values, values)) &&
            (identical(other.limit, limit) ||
                const DeepCollectionEquality().equals(other.limit, limit)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(base) ^
      const DeepCollectionEquality().hash(orders) ^
      const DeepCollectionEquality().hash(values) ^
      const DeepCollectionEquality().hash(limit);

  @JsonKey(ignore: true)
  @override
  _$FirebaseIsolateQueryCopyWith<_FirebaseIsolateQuery> get copyWith =>
      __$FirebaseIsolateQueryCopyWithImpl<_FirebaseIsolateQuery>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FirebaseIsolateQueryToJson(this);
  }
}

abstract class _FirebaseIsolateQuery extends FirebaseIsolateQuery {
  const factory _FirebaseIsolateQuery(
      {@JsonKey() required FirebaseIsolateBaseQuery base,
      @JsonKey() required List<QueryOrder> orders,
      @JsonKey() required QueryValues values,
      @JsonKey() int? limit}) = _$_FirebaseIsolateQuery;
  const _FirebaseIsolateQuery._() : super._();

  factory _FirebaseIsolateQuery.fromJson(Map<String, dynamic> json) =
      _$_FirebaseIsolateQuery.fromJson;

  @override
  @JsonKey()
  FirebaseIsolateBaseQuery get base => throw _privateConstructorUsedError;
  @override
  @JsonKey()
  List<QueryOrder> get orders => throw _privateConstructorUsedError;
  @override
  @JsonKey()
  QueryValues get values => throw _privateConstructorUsedError;
  @override
  @JsonKey()
  int? get limit => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FirebaseIsolateQueryCopyWith<_FirebaseIsolateQuery> get copyWith =>
      throw _privateConstructorUsedError;
}

FirebaseIsolateRequest _$FirebaseIsolateRequestFromJson(
    Map<String, dynamic> json) {
  switch (json['runtimeType'] as String?) {
    case 'get':
      return _FirebaseIsolateRequestGet.fromJson(json);
    case 'query':
      return _FirebaseIsolateRequestQuery.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json,
          'runtimeType',
          'FirebaseIsolateRequest',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
class _$FirebaseIsolateRequestTearOff {
  const _$FirebaseIsolateRequestTearOff();

  _FirebaseIsolateRequestGet get(@JsonKey() String path) {
    return _FirebaseIsolateRequestGet(
      path,
    );
  }

  _FirebaseIsolateRequestQuery query(
      {@JsonKey() required String path,
      @JsonKey() required FirebaseIsolateQuery query}) {
    return _FirebaseIsolateRequestQuery(
      path: path,
      query: query,
    );
  }

  FirebaseIsolateRequest fromJson(Map<String, Object> json) {
    return FirebaseIsolateRequest.fromJson(json);
  }
}

/// @nodoc
const $FirebaseIsolateRequest = _$FirebaseIsolateRequestTearOff();

/// @nodoc
mixin _$FirebaseIsolateRequest {
  @JsonKey()
  String get path => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@JsonKey() String path) get,
    required TResult Function(
            @JsonKey() String path, @JsonKey() FirebaseIsolateQuery query)
        query,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(@JsonKey() String path)? get,
    TResult Function(
            @JsonKey() String path, @JsonKey() FirebaseIsolateQuery query)?
        query,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@JsonKey() String path)? get,
    TResult Function(
            @JsonKey() String path, @JsonKey() FirebaseIsolateQuery query)?
        query,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FirebaseIsolateRequestGet value) get,
    required TResult Function(_FirebaseIsolateRequestQuery value) query,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FirebaseIsolateRequestGet value)? get,
    TResult Function(_FirebaseIsolateRequestQuery value)? query,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FirebaseIsolateRequestGet value)? get,
    TResult Function(_FirebaseIsolateRequestQuery value)? query,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FirebaseIsolateRequestCopyWith<FirebaseIsolateRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FirebaseIsolateRequestCopyWith<$Res> {
  factory $FirebaseIsolateRequestCopyWith(FirebaseIsolateRequest value,
          $Res Function(FirebaseIsolateRequest) then) =
      _$FirebaseIsolateRequestCopyWithImpl<$Res>;
  $Res call({@JsonKey() String path});
}

/// @nodoc
class _$FirebaseIsolateRequestCopyWithImpl<$Res>
    implements $FirebaseIsolateRequestCopyWith<$Res> {
  _$FirebaseIsolateRequestCopyWithImpl(this._value, this._then);

  final FirebaseIsolateRequest _value;
  // ignore: unused_field
  final $Res Function(FirebaseIsolateRequest) _then;

  @override
  $Res call({
    Object? path = freezed,
  }) {
    return _then(_value.copyWith(
      path: path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$FirebaseIsolateRequestGetCopyWith<$Res>
    implements $FirebaseIsolateRequestCopyWith<$Res> {
  factory _$FirebaseIsolateRequestGetCopyWith(_FirebaseIsolateRequestGet value,
          $Res Function(_FirebaseIsolateRequestGet) then) =
      __$FirebaseIsolateRequestGetCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey() String path});
}

/// @nodoc
class __$FirebaseIsolateRequestGetCopyWithImpl<$Res>
    extends _$FirebaseIsolateRequestCopyWithImpl<$Res>
    implements _$FirebaseIsolateRequestGetCopyWith<$Res> {
  __$FirebaseIsolateRequestGetCopyWithImpl(_FirebaseIsolateRequestGet _value,
      $Res Function(_FirebaseIsolateRequestGet) _then)
      : super(_value, (v) => _then(v as _FirebaseIsolateRequestGet));

  @override
  _FirebaseIsolateRequestGet get _value =>
      super._value as _FirebaseIsolateRequestGet;

  @override
  $Res call({
    Object? path = freezed,
  }) {
    return _then(_FirebaseIsolateRequestGet(
      path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FirebaseIsolateRequestGet extends _FirebaseIsolateRequestGet {
  _$_FirebaseIsolateRequestGet(@JsonKey() this.path) : super._();

  factory _$_FirebaseIsolateRequestGet.fromJson(Map<String, dynamic> json) =>
      _$$_FirebaseIsolateRequestGetFromJson(json);

  @override
  @JsonKey()
  final String path;

  @override
  String toString() {
    return 'FirebaseIsolateRequest.get(path: $path)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FirebaseIsolateRequestGet &&
            (identical(other.path, path) ||
                const DeepCollectionEquality().equals(other.path, path)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(path);

  @JsonKey(ignore: true)
  @override
  _$FirebaseIsolateRequestGetCopyWith<_FirebaseIsolateRequestGet>
      get copyWith =>
          __$FirebaseIsolateRequestGetCopyWithImpl<_FirebaseIsolateRequestGet>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@JsonKey() String path) get,
    required TResult Function(
            @JsonKey() String path, @JsonKey() FirebaseIsolateQuery query)
        query,
  }) {
    return get(path);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(@JsonKey() String path)? get,
    TResult Function(
            @JsonKey() String path, @JsonKey() FirebaseIsolateQuery query)?
        query,
  }) {
    return get?.call(path);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@JsonKey() String path)? get,
    TResult Function(
            @JsonKey() String path, @JsonKey() FirebaseIsolateQuery query)?
        query,
    required TResult orElse(),
  }) {
    if (get != null) {
      return get(path);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FirebaseIsolateRequestGet value) get,
    required TResult Function(_FirebaseIsolateRequestQuery value) query,
  }) {
    return get(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FirebaseIsolateRequestGet value)? get,
    TResult Function(_FirebaseIsolateRequestQuery value)? query,
  }) {
    return get?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FirebaseIsolateRequestGet value)? get,
    TResult Function(_FirebaseIsolateRequestQuery value)? query,
    required TResult orElse(),
  }) {
    if (get != null) {
      return get(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_FirebaseIsolateRequestGetToJson(this)..['runtimeType'] = 'get';
  }
}

abstract class _FirebaseIsolateRequestGet extends FirebaseIsolateRequest {
  factory _FirebaseIsolateRequestGet(@JsonKey() String path) =
      _$_FirebaseIsolateRequestGet;
  _FirebaseIsolateRequestGet._() : super._();

  factory _FirebaseIsolateRequestGet.fromJson(Map<String, dynamic> json) =
      _$_FirebaseIsolateRequestGet.fromJson;

  @override
  @JsonKey()
  String get path => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FirebaseIsolateRequestGetCopyWith<_FirebaseIsolateRequestGet>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$FirebaseIsolateRequestQueryCopyWith<$Res>
    implements $FirebaseIsolateRequestCopyWith<$Res> {
  factory _$FirebaseIsolateRequestQueryCopyWith(
          _FirebaseIsolateRequestQuery value,
          $Res Function(_FirebaseIsolateRequestQuery) then) =
      __$FirebaseIsolateRequestQueryCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey() String path, @JsonKey() FirebaseIsolateQuery query});

  $FirebaseIsolateQueryCopyWith<$Res> get query;
}

/// @nodoc
class __$FirebaseIsolateRequestQueryCopyWithImpl<$Res>
    extends _$FirebaseIsolateRequestCopyWithImpl<$Res>
    implements _$FirebaseIsolateRequestQueryCopyWith<$Res> {
  __$FirebaseIsolateRequestQueryCopyWithImpl(
      _FirebaseIsolateRequestQuery _value,
      $Res Function(_FirebaseIsolateRequestQuery) _then)
      : super(_value, (v) => _then(v as _FirebaseIsolateRequestQuery));

  @override
  _FirebaseIsolateRequestQuery get _value =>
      super._value as _FirebaseIsolateRequestQuery;

  @override
  $Res call({
    Object? path = freezed,
    Object? query = freezed,
  }) {
    return _then(_FirebaseIsolateRequestQuery(
      path: path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      query: query == freezed
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as FirebaseIsolateQuery,
    ));
  }

  @override
  $FirebaseIsolateQueryCopyWith<$Res> get query {
    return $FirebaseIsolateQueryCopyWith<$Res>(_value.query, (value) {
      return _then(_value.copyWith(query: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$_FirebaseIsolateRequestQuery extends _FirebaseIsolateRequestQuery {
  _$_FirebaseIsolateRequestQuery(
      {@JsonKey() required this.path, @JsonKey() required this.query})
      : super._();

  factory _$_FirebaseIsolateRequestQuery.fromJson(Map<String, dynamic> json) =>
      _$$_FirebaseIsolateRequestQueryFromJson(json);

  @override
  @JsonKey()
  final String path;
  @override // Collection path.
  @JsonKey()
  final FirebaseIsolateQuery query;

  @override
  String toString() {
    return 'FirebaseIsolateRequest.query(path: $path, query: $query)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FirebaseIsolateRequestQuery &&
            (identical(other.path, path) ||
                const DeepCollectionEquality().equals(other.path, path)) &&
            (identical(other.query, query) ||
                const DeepCollectionEquality().equals(other.query, query)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(path) ^
      const DeepCollectionEquality().hash(query);

  @JsonKey(ignore: true)
  @override
  _$FirebaseIsolateRequestQueryCopyWith<_FirebaseIsolateRequestQuery>
      get copyWith => __$FirebaseIsolateRequestQueryCopyWithImpl<
          _FirebaseIsolateRequestQuery>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@JsonKey() String path) get,
    required TResult Function(
            @JsonKey() String path, @JsonKey() FirebaseIsolateQuery query)
        query,
  }) {
    return query(path, this.query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(@JsonKey() String path)? get,
    TResult Function(
            @JsonKey() String path, @JsonKey() FirebaseIsolateQuery query)?
        query,
  }) {
    return query?.call(path, this.query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@JsonKey() String path)? get,
    TResult Function(
            @JsonKey() String path, @JsonKey() FirebaseIsolateQuery query)?
        query,
    required TResult orElse(),
  }) {
    if (query != null) {
      return query(path, this.query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FirebaseIsolateRequestGet value) get,
    required TResult Function(_FirebaseIsolateRequestQuery value) query,
  }) {
    return query(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FirebaseIsolateRequestGet value)? get,
    TResult Function(_FirebaseIsolateRequestQuery value)? query,
  }) {
    return query?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FirebaseIsolateRequestGet value)? get,
    TResult Function(_FirebaseIsolateRequestQuery value)? query,
    required TResult orElse(),
  }) {
    if (query != null) {
      return query(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_FirebaseIsolateRequestQueryToJson(this)
      ..['runtimeType'] = 'query';
  }
}

abstract class _FirebaseIsolateRequestQuery extends FirebaseIsolateRequest {
  factory _FirebaseIsolateRequestQuery(
          {@JsonKey() required String path,
          @JsonKey() required FirebaseIsolateQuery query}) =
      _$_FirebaseIsolateRequestQuery;
  _FirebaseIsolateRequestQuery._() : super._();

  factory _FirebaseIsolateRequestQuery.fromJson(Map<String, dynamic> json) =
      _$_FirebaseIsolateRequestQuery.fromJson;

  @override
  @JsonKey()
  String get path => throw _privateConstructorUsedError; // Collection path.
  @JsonKey()
  FirebaseIsolateQuery get query => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FirebaseIsolateRequestQueryCopyWith<_FirebaseIsolateRequestQuery>
      get copyWith => throw _privateConstructorUsedError;
}

FirebaseIsolateResponse _$FirebaseIsolateResponseFromJson(
    Map<String, dynamic> json) {
  switch (json['runtimeType'] as String?) {
    case 'get':
      return _FirebaseIsolateResponseGet.fromJson(json);
    case 'query':
      return _FirebaseIsolateResponseQuery.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json,
          'runtimeType',
          'FirebaseIsolateResponse',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
class _$FirebaseIsolateResponseTearOff {
  const _$FirebaseIsolateResponseTearOff();

  _FirebaseIsolateResponseGet get(
      {@JsonKey() required String key,
      @JsonKey() required FirebaseIsolateSnapshotData snapshot}) {
    return _FirebaseIsolateResponseGet(
      key: key,
      snapshot: snapshot,
    );
  }

  _FirebaseIsolateResponseQuery query(
      {@JsonKey() required String key,
      @JsonKey() required List<FirebaseIsolateSnapshotData> snapshots}) {
    return _FirebaseIsolateResponseQuery(
      key: key,
      snapshots: snapshots,
    );
  }

  FirebaseIsolateResponse fromJson(Map<String, Object> json) {
    return FirebaseIsolateResponse.fromJson(json);
  }
}

/// @nodoc
const $FirebaseIsolateResponse = _$FirebaseIsolateResponseTearOff();

/// @nodoc
mixin _$FirebaseIsolateResponse {
  @JsonKey()
  String get key => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@JsonKey() String key,
            @JsonKey() FirebaseIsolateSnapshotData snapshot)
        get,
    required TResult Function(@JsonKey() String key,
            @JsonKey() List<FirebaseIsolateSnapshotData> snapshots)
        query,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(@JsonKey() String key,
            @JsonKey() FirebaseIsolateSnapshotData snapshot)?
        get,
    TResult Function(@JsonKey() String key,
            @JsonKey() List<FirebaseIsolateSnapshotData> snapshots)?
        query,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@JsonKey() String key,
            @JsonKey() FirebaseIsolateSnapshotData snapshot)?
        get,
    TResult Function(@JsonKey() String key,
            @JsonKey() List<FirebaseIsolateSnapshotData> snapshots)?
        query,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FirebaseIsolateResponseGet value) get,
    required TResult Function(_FirebaseIsolateResponseQuery value) query,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FirebaseIsolateResponseGet value)? get,
    TResult Function(_FirebaseIsolateResponseQuery value)? query,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FirebaseIsolateResponseGet value)? get,
    TResult Function(_FirebaseIsolateResponseQuery value)? query,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FirebaseIsolateResponseCopyWith<FirebaseIsolateResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FirebaseIsolateResponseCopyWith<$Res> {
  factory $FirebaseIsolateResponseCopyWith(FirebaseIsolateResponse value,
          $Res Function(FirebaseIsolateResponse) then) =
      _$FirebaseIsolateResponseCopyWithImpl<$Res>;
  $Res call({@JsonKey() String key});
}

/// @nodoc
class _$FirebaseIsolateResponseCopyWithImpl<$Res>
    implements $FirebaseIsolateResponseCopyWith<$Res> {
  _$FirebaseIsolateResponseCopyWithImpl(this._value, this._then);

  final FirebaseIsolateResponse _value;
  // ignore: unused_field
  final $Res Function(FirebaseIsolateResponse) _then;

  @override
  $Res call({
    Object? key = freezed,
  }) {
    return _then(_value.copyWith(
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$FirebaseIsolateResponseGetCopyWith<$Res>
    implements $FirebaseIsolateResponseCopyWith<$Res> {
  factory _$FirebaseIsolateResponseGetCopyWith(
          _FirebaseIsolateResponseGet value,
          $Res Function(_FirebaseIsolateResponseGet) then) =
      __$FirebaseIsolateResponseGetCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey() String key, @JsonKey() FirebaseIsolateSnapshotData snapshot});

  $FirebaseIsolateSnapshotDataCopyWith<$Res> get snapshot;
}

/// @nodoc
class __$FirebaseIsolateResponseGetCopyWithImpl<$Res>
    extends _$FirebaseIsolateResponseCopyWithImpl<$Res>
    implements _$FirebaseIsolateResponseGetCopyWith<$Res> {
  __$FirebaseIsolateResponseGetCopyWithImpl(_FirebaseIsolateResponseGet _value,
      $Res Function(_FirebaseIsolateResponseGet) _then)
      : super(_value, (v) => _then(v as _FirebaseIsolateResponseGet));

  @override
  _FirebaseIsolateResponseGet get _value =>
      super._value as _FirebaseIsolateResponseGet;

  @override
  $Res call({
    Object? key = freezed,
    Object? snapshot = freezed,
  }) {
    return _then(_FirebaseIsolateResponseGet(
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      snapshot: snapshot == freezed
          ? _value.snapshot
          : snapshot // ignore: cast_nullable_to_non_nullable
              as FirebaseIsolateSnapshotData,
    ));
  }

  @override
  $FirebaseIsolateSnapshotDataCopyWith<$Res> get snapshot {
    return $FirebaseIsolateSnapshotDataCopyWith<$Res>(_value.snapshot, (value) {
      return _then(_value.copyWith(snapshot: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$_FirebaseIsolateResponseGet extends _FirebaseIsolateResponseGet {
  _$_FirebaseIsolateResponseGet(
      {@JsonKey() required this.key, @JsonKey() required this.snapshot})
      : super._();

  factory _$_FirebaseIsolateResponseGet.fromJson(Map<String, dynamic> json) =>
      _$$_FirebaseIsolateResponseGetFromJson(json);

  @override
  @JsonKey()
  final String key;
  @override
  @JsonKey()
  final FirebaseIsolateSnapshotData snapshot;

  @override
  String toString() {
    return 'FirebaseIsolateResponse.get(key: $key, snapshot: $snapshot)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FirebaseIsolateResponseGet &&
            (identical(other.key, key) ||
                const DeepCollectionEquality().equals(other.key, key)) &&
            (identical(other.snapshot, snapshot) ||
                const DeepCollectionEquality()
                    .equals(other.snapshot, snapshot)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(key) ^
      const DeepCollectionEquality().hash(snapshot);

  @JsonKey(ignore: true)
  @override
  _$FirebaseIsolateResponseGetCopyWith<_FirebaseIsolateResponseGet>
      get copyWith => __$FirebaseIsolateResponseGetCopyWithImpl<
          _FirebaseIsolateResponseGet>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@JsonKey() String key,
            @JsonKey() FirebaseIsolateSnapshotData snapshot)
        get,
    required TResult Function(@JsonKey() String key,
            @JsonKey() List<FirebaseIsolateSnapshotData> snapshots)
        query,
  }) {
    return get(key, snapshot);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(@JsonKey() String key,
            @JsonKey() FirebaseIsolateSnapshotData snapshot)?
        get,
    TResult Function(@JsonKey() String key,
            @JsonKey() List<FirebaseIsolateSnapshotData> snapshots)?
        query,
  }) {
    return get?.call(key, snapshot);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@JsonKey() String key,
            @JsonKey() FirebaseIsolateSnapshotData snapshot)?
        get,
    TResult Function(@JsonKey() String key,
            @JsonKey() List<FirebaseIsolateSnapshotData> snapshots)?
        query,
    required TResult orElse(),
  }) {
    if (get != null) {
      return get(key, snapshot);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FirebaseIsolateResponseGet value) get,
    required TResult Function(_FirebaseIsolateResponseQuery value) query,
  }) {
    return get(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FirebaseIsolateResponseGet value)? get,
    TResult Function(_FirebaseIsolateResponseQuery value)? query,
  }) {
    return get?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FirebaseIsolateResponseGet value)? get,
    TResult Function(_FirebaseIsolateResponseQuery value)? query,
    required TResult orElse(),
  }) {
    if (get != null) {
      return get(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_FirebaseIsolateResponseGetToJson(this)..['runtimeType'] = 'get';
  }
}

abstract class _FirebaseIsolateResponseGet extends FirebaseIsolateResponse {
  factory _FirebaseIsolateResponseGet(
          {@JsonKey() required String key,
          @JsonKey() required FirebaseIsolateSnapshotData snapshot}) =
      _$_FirebaseIsolateResponseGet;
  _FirebaseIsolateResponseGet._() : super._();

  factory _FirebaseIsolateResponseGet.fromJson(Map<String, dynamic> json) =
      _$_FirebaseIsolateResponseGet.fromJson;

  @override
  @JsonKey()
  String get key => throw _privateConstructorUsedError;
  @JsonKey()
  FirebaseIsolateSnapshotData get snapshot =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FirebaseIsolateResponseGetCopyWith<_FirebaseIsolateResponseGet>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$FirebaseIsolateResponseQueryCopyWith<$Res>
    implements $FirebaseIsolateResponseCopyWith<$Res> {
  factory _$FirebaseIsolateResponseQueryCopyWith(
          _FirebaseIsolateResponseQuery value,
          $Res Function(_FirebaseIsolateResponseQuery) then) =
      __$FirebaseIsolateResponseQueryCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey() String key,
      @JsonKey() List<FirebaseIsolateSnapshotData> snapshots});
}

/// @nodoc
class __$FirebaseIsolateResponseQueryCopyWithImpl<$Res>
    extends _$FirebaseIsolateResponseCopyWithImpl<$Res>
    implements _$FirebaseIsolateResponseQueryCopyWith<$Res> {
  __$FirebaseIsolateResponseQueryCopyWithImpl(
      _FirebaseIsolateResponseQuery _value,
      $Res Function(_FirebaseIsolateResponseQuery) _then)
      : super(_value, (v) => _then(v as _FirebaseIsolateResponseQuery));

  @override
  _FirebaseIsolateResponseQuery get _value =>
      super._value as _FirebaseIsolateResponseQuery;

  @override
  $Res call({
    Object? key = freezed,
    Object? snapshots = freezed,
  }) {
    return _then(_FirebaseIsolateResponseQuery(
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      snapshots: snapshots == freezed
          ? _value.snapshots
          : snapshots // ignore: cast_nullable_to_non_nullable
              as List<FirebaseIsolateSnapshotData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FirebaseIsolateResponseQuery extends _FirebaseIsolateResponseQuery {
  _$_FirebaseIsolateResponseQuery(
      {@JsonKey() required this.key, @JsonKey() required this.snapshots})
      : super._();

  factory _$_FirebaseIsolateResponseQuery.fromJson(Map<String, dynamic> json) =>
      _$$_FirebaseIsolateResponseQueryFromJson(json);

  @override
  @JsonKey()
  final String key;
  @override
  @JsonKey()
  final List<FirebaseIsolateSnapshotData> snapshots;

  @override
  String toString() {
    return 'FirebaseIsolateResponse.query(key: $key, snapshots: $snapshots)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FirebaseIsolateResponseQuery &&
            (identical(other.key, key) ||
                const DeepCollectionEquality().equals(other.key, key)) &&
            (identical(other.snapshots, snapshots) ||
                const DeepCollectionEquality()
                    .equals(other.snapshots, snapshots)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(key) ^
      const DeepCollectionEquality().hash(snapshots);

  @JsonKey(ignore: true)
  @override
  _$FirebaseIsolateResponseQueryCopyWith<_FirebaseIsolateResponseQuery>
      get copyWith => __$FirebaseIsolateResponseQueryCopyWithImpl<
          _FirebaseIsolateResponseQuery>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@JsonKey() String key,
            @JsonKey() FirebaseIsolateSnapshotData snapshot)
        get,
    required TResult Function(@JsonKey() String key,
            @JsonKey() List<FirebaseIsolateSnapshotData> snapshots)
        query,
  }) {
    return query(key, snapshots);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(@JsonKey() String key,
            @JsonKey() FirebaseIsolateSnapshotData snapshot)?
        get,
    TResult Function(@JsonKey() String key,
            @JsonKey() List<FirebaseIsolateSnapshotData> snapshots)?
        query,
  }) {
    return query?.call(key, snapshots);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@JsonKey() String key,
            @JsonKey() FirebaseIsolateSnapshotData snapshot)?
        get,
    TResult Function(@JsonKey() String key,
            @JsonKey() List<FirebaseIsolateSnapshotData> snapshots)?
        query,
    required TResult orElse(),
  }) {
    if (query != null) {
      return query(key, snapshots);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FirebaseIsolateResponseGet value) get,
    required TResult Function(_FirebaseIsolateResponseQuery value) query,
  }) {
    return query(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FirebaseIsolateResponseGet value)? get,
    TResult Function(_FirebaseIsolateResponseQuery value)? query,
  }) {
    return query?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FirebaseIsolateResponseGet value)? get,
    TResult Function(_FirebaseIsolateResponseQuery value)? query,
    required TResult orElse(),
  }) {
    if (query != null) {
      return query(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_FirebaseIsolateResponseQueryToJson(this)
      ..['runtimeType'] = 'query';
  }
}

abstract class _FirebaseIsolateResponseQuery extends FirebaseIsolateResponse {
  factory _FirebaseIsolateResponseQuery(
          {@JsonKey() required String key,
          @JsonKey() required List<FirebaseIsolateSnapshotData> snapshots}) =
      _$_FirebaseIsolateResponseQuery;
  _FirebaseIsolateResponseQuery._() : super._();

  factory _FirebaseIsolateResponseQuery.fromJson(Map<String, dynamic> json) =
      _$_FirebaseIsolateResponseQuery.fromJson;

  @override
  @JsonKey()
  String get key => throw _privateConstructorUsedError;
  @JsonKey()
  List<FirebaseIsolateSnapshotData> get snapshots =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FirebaseIsolateResponseQueryCopyWith<_FirebaseIsolateResponseQuery>
      get copyWith => throw _privateConstructorUsedError;
}
