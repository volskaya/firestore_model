// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'firestore_collection_pod.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FirestoreCollectionValueTearOff {
  const _$FirestoreCollectionValueTearOff();

  _FirestoreCollectionValue<T, D> call<T extends FirestoreModel<T>, D>(
      {required List<T> paginated,
      required List<T> subscribed,
      required List<T> pending,
      required Map<String, D> cargo,
      required DateTime createTime,
      FirestoreCollectionStatus status = FirestoreCollectionStatus.idle,
      bool ended = false}) {
    return _FirestoreCollectionValue<T, D>(
      paginated: paginated,
      subscribed: subscribed,
      pending: pending,
      cargo: cargo,
      createTime: createTime,
      status: status,
      ended: ended,
    );
  }
}

/// @nodoc
const $FirestoreCollectionValue = _$FirestoreCollectionValueTearOff();

/// @nodoc
mixin _$FirestoreCollectionValue<T extends FirestoreModel<T>, D> {
  List<T> get paginated => throw _privateConstructorUsedError;
  List<T> get subscribed => throw _privateConstructorUsedError;
  List<T> get pending => throw _privateConstructorUsedError;
  Map<String, D> get cargo => throw _privateConstructorUsedError;
  DateTime get createTime => throw _privateConstructorUsedError;
  FirestoreCollectionStatus get status => throw _privateConstructorUsedError;
  bool get ended => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FirestoreCollectionValueCopyWith<T, D, FirestoreCollectionValue<T, D>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FirestoreCollectionValueCopyWith<T extends FirestoreModel<T>, D,
    $Res> {
  factory $FirestoreCollectionValueCopyWith(
          FirestoreCollectionValue<T, D> value,
          $Res Function(FirestoreCollectionValue<T, D>) then) =
      _$FirestoreCollectionValueCopyWithImpl<T, D, $Res>;
  $Res call(
      {List<T> paginated,
      List<T> subscribed,
      List<T> pending,
      Map<String, D> cargo,
      DateTime createTime,
      FirestoreCollectionStatus status,
      bool ended});
}

/// @nodoc
class _$FirestoreCollectionValueCopyWithImpl<T extends FirestoreModel<T>, D,
    $Res> implements $FirestoreCollectionValueCopyWith<T, D, $Res> {
  _$FirestoreCollectionValueCopyWithImpl(this._value, this._then);

  final FirestoreCollectionValue<T, D> _value;
  // ignore: unused_field
  final $Res Function(FirestoreCollectionValue<T, D>) _then;

  @override
  $Res call({
    Object? paginated = freezed,
    Object? subscribed = freezed,
    Object? pending = freezed,
    Object? cargo = freezed,
    Object? createTime = freezed,
    Object? status = freezed,
    Object? ended = freezed,
  }) {
    return _then(_value.copyWith(
      paginated: paginated == freezed
          ? _value.paginated
          : paginated // ignore: cast_nullable_to_non_nullable
              as List<T>,
      subscribed: subscribed == freezed
          ? _value.subscribed
          : subscribed // ignore: cast_nullable_to_non_nullable
              as List<T>,
      pending: pending == freezed
          ? _value.pending
          : pending // ignore: cast_nullable_to_non_nullable
              as List<T>,
      cargo: cargo == freezed
          ? _value.cargo
          : cargo // ignore: cast_nullable_to_non_nullable
              as Map<String, D>,
      createTime: createTime == freezed
          ? _value.createTime
          : createTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FirestoreCollectionStatus,
      ended: ended == freezed
          ? _value.ended
          : ended // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$FirestoreCollectionValueCopyWith<T extends FirestoreModel<T>,
    D, $Res> implements $FirestoreCollectionValueCopyWith<T, D, $Res> {
  factory _$FirestoreCollectionValueCopyWith(
          _FirestoreCollectionValue<T, D> value,
          $Res Function(_FirestoreCollectionValue<T, D>) then) =
      __$FirestoreCollectionValueCopyWithImpl<T, D, $Res>;
  @override
  $Res call(
      {List<T> paginated,
      List<T> subscribed,
      List<T> pending,
      Map<String, D> cargo,
      DateTime createTime,
      FirestoreCollectionStatus status,
      bool ended});
}

/// @nodoc
class __$FirestoreCollectionValueCopyWithImpl<T extends FirestoreModel<T>, D,
        $Res> extends _$FirestoreCollectionValueCopyWithImpl<T, D, $Res>
    implements _$FirestoreCollectionValueCopyWith<T, D, $Res> {
  __$FirestoreCollectionValueCopyWithImpl(
      _FirestoreCollectionValue<T, D> _value,
      $Res Function(_FirestoreCollectionValue<T, D>) _then)
      : super(_value, (v) => _then(v as _FirestoreCollectionValue<T, D>));

  @override
  _FirestoreCollectionValue<T, D> get _value =>
      super._value as _FirestoreCollectionValue<T, D>;

  @override
  $Res call({
    Object? paginated = freezed,
    Object? subscribed = freezed,
    Object? pending = freezed,
    Object? cargo = freezed,
    Object? createTime = freezed,
    Object? status = freezed,
    Object? ended = freezed,
  }) {
    return _then(_FirestoreCollectionValue<T, D>(
      paginated: paginated == freezed
          ? _value.paginated
          : paginated // ignore: cast_nullable_to_non_nullable
              as List<T>,
      subscribed: subscribed == freezed
          ? _value.subscribed
          : subscribed // ignore: cast_nullable_to_non_nullable
              as List<T>,
      pending: pending == freezed
          ? _value.pending
          : pending // ignore: cast_nullable_to_non_nullable
              as List<T>,
      cargo: cargo == freezed
          ? _value.cargo
          : cargo // ignore: cast_nullable_to_non_nullable
              as Map<String, D>,
      createTime: createTime == freezed
          ? _value.createTime
          : createTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FirestoreCollectionStatus,
      ended: ended == freezed
          ? _value.ended
          : ended // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_FirestoreCollectionValue<T extends FirestoreModel<T>, D>
    extends _FirestoreCollectionValue<T, D> {
  const _$_FirestoreCollectionValue(
      {required this.paginated,
      required this.subscribed,
      required this.pending,
      required this.cargo,
      required this.createTime,
      this.status = FirestoreCollectionStatus.idle,
      this.ended = false})
      : super._();

  @override
  final List<T> paginated;
  @override
  final List<T> subscribed;
  @override
  final List<T> pending;
  @override
  final Map<String, D> cargo;
  @override
  final DateTime createTime;
  @JsonKey(defaultValue: FirestoreCollectionStatus.idle)
  @override
  final FirestoreCollectionStatus status;
  @JsonKey(defaultValue: false)
  @override
  final bool ended;

  @override
  String toString() {
    return 'FirestoreCollectionValue<$T, $D>(paginated: $paginated, subscribed: $subscribed, pending: $pending, cargo: $cargo, createTime: $createTime, status: $status, ended: $ended)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FirestoreCollectionValue<T, D> &&
            (identical(other.paginated, paginated) ||
                const DeepCollectionEquality()
                    .equals(other.paginated, paginated)) &&
            (identical(other.subscribed, subscribed) ||
                const DeepCollectionEquality()
                    .equals(other.subscribed, subscribed)) &&
            (identical(other.pending, pending) ||
                const DeepCollectionEquality()
                    .equals(other.pending, pending)) &&
            (identical(other.cargo, cargo) ||
                const DeepCollectionEquality().equals(other.cargo, cargo)) &&
            (identical(other.createTime, createTime) ||
                const DeepCollectionEquality()
                    .equals(other.createTime, createTime)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.ended, ended) ||
                const DeepCollectionEquality().equals(other.ended, ended)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(paginated) ^
      const DeepCollectionEquality().hash(subscribed) ^
      const DeepCollectionEquality().hash(pending) ^
      const DeepCollectionEquality().hash(cargo) ^
      const DeepCollectionEquality().hash(createTime) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(ended);

  @JsonKey(ignore: true)
  @override
  _$FirestoreCollectionValueCopyWith<T, D, _FirestoreCollectionValue<T, D>>
      get copyWith => __$FirestoreCollectionValueCopyWithImpl<T, D,
          _FirestoreCollectionValue<T, D>>(this, _$identity);
}

abstract class _FirestoreCollectionValue<T extends FirestoreModel<T>, D>
    extends FirestoreCollectionValue<T, D> {
  const factory _FirestoreCollectionValue(
      {required List<T> paginated,
      required List<T> subscribed,
      required List<T> pending,
      required Map<String, D> cargo,
      required DateTime createTime,
      FirestoreCollectionStatus status,
      bool ended}) = _$_FirestoreCollectionValue<T, D>;
  const _FirestoreCollectionValue._() : super._();

  @override
  List<T> get paginated => throw _privateConstructorUsedError;
  @override
  List<T> get subscribed => throw _privateConstructorUsedError;
  @override
  List<T> get pending => throw _privateConstructorUsedError;
  @override
  Map<String, D> get cargo => throw _privateConstructorUsedError;
  @override
  DateTime get createTime => throw _privateConstructorUsedError;
  @override
  FirestoreCollectionStatus get status => throw _privateConstructorUsedError;
  @override
  bool get ended => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FirestoreCollectionValueCopyWith<T, D, _FirestoreCollectionValue<T, D>>
      get copyWith => throw _privateConstructorUsedError;
}
