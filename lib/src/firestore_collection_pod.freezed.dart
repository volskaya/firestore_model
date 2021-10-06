// coverage:ignore-file
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
class _$FirestoreCollectionEntryTearOff {
  const _$FirestoreCollectionEntryTearOff();

  _FirestoreCollectionEntry<T, D> call<T extends FirestoreModel<T>, D>(
      {required T item, D? cargo, Widget? widget}) {
    return _FirestoreCollectionEntry<T, D>(
      item: item,
      cargo: cargo,
      widget: widget,
    );
  }
}

/// @nodoc
const $FirestoreCollectionEntry = _$FirestoreCollectionEntryTearOff();

/// @nodoc
mixin _$FirestoreCollectionEntry<T extends FirestoreModel<T>, D> {
  T get item => throw _privateConstructorUsedError;
  D? get cargo => throw _privateConstructorUsedError;
  Widget? get widget => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FirestoreCollectionEntryCopyWith<T, D, FirestoreCollectionEntry<T, D>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FirestoreCollectionEntryCopyWith<T extends FirestoreModel<T>, D,
    $Res> {
  factory $FirestoreCollectionEntryCopyWith(
          FirestoreCollectionEntry<T, D> value,
          $Res Function(FirestoreCollectionEntry<T, D>) then) =
      _$FirestoreCollectionEntryCopyWithImpl<T, D, $Res>;
  $Res call({T item, D? cargo, Widget? widget});
}

/// @nodoc
class _$FirestoreCollectionEntryCopyWithImpl<T extends FirestoreModel<T>, D,
    $Res> implements $FirestoreCollectionEntryCopyWith<T, D, $Res> {
  _$FirestoreCollectionEntryCopyWithImpl(this._value, this._then);

  final FirestoreCollectionEntry<T, D> _value;
  // ignore: unused_field
  final $Res Function(FirestoreCollectionEntry<T, D>) _then;

  @override
  $Res call({
    Object? item = freezed,
    Object? cargo = freezed,
    Object? widget = freezed,
  }) {
    return _then(_value.copyWith(
      item: item == freezed
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as T,
      cargo: cargo == freezed
          ? _value.cargo
          : cargo // ignore: cast_nullable_to_non_nullable
              as D?,
      widget: widget == freezed
          ? _value.widget
          : widget // ignore: cast_nullable_to_non_nullable
              as Widget?,
    ));
  }
}

/// @nodoc
abstract class _$FirestoreCollectionEntryCopyWith<T extends FirestoreModel<T>,
    D, $Res> implements $FirestoreCollectionEntryCopyWith<T, D, $Res> {
  factory _$FirestoreCollectionEntryCopyWith(
          _FirestoreCollectionEntry<T, D> value,
          $Res Function(_FirestoreCollectionEntry<T, D>) then) =
      __$FirestoreCollectionEntryCopyWithImpl<T, D, $Res>;
  @override
  $Res call({T item, D? cargo, Widget? widget});
}

/// @nodoc
class __$FirestoreCollectionEntryCopyWithImpl<T extends FirestoreModel<T>, D,
        $Res> extends _$FirestoreCollectionEntryCopyWithImpl<T, D, $Res>
    implements _$FirestoreCollectionEntryCopyWith<T, D, $Res> {
  __$FirestoreCollectionEntryCopyWithImpl(
      _FirestoreCollectionEntry<T, D> _value,
      $Res Function(_FirestoreCollectionEntry<T, D>) _then)
      : super(_value, (v) => _then(v as _FirestoreCollectionEntry<T, D>));

  @override
  _FirestoreCollectionEntry<T, D> get _value =>
      super._value as _FirestoreCollectionEntry<T, D>;

  @override
  $Res call({
    Object? item = freezed,
    Object? cargo = freezed,
    Object? widget = freezed,
  }) {
    return _then(_FirestoreCollectionEntry<T, D>(
      item: item == freezed
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as T,
      cargo: cargo == freezed
          ? _value.cargo
          : cargo // ignore: cast_nullable_to_non_nullable
              as D?,
      widget: widget == freezed
          ? _value.widget
          : widget // ignore: cast_nullable_to_non_nullable
              as Widget?,
    ));
  }
}

/// @nodoc

class _$_FirestoreCollectionEntry<T extends FirestoreModel<T>, D>
    extends _FirestoreCollectionEntry<T, D> {
  const _$_FirestoreCollectionEntry(
      {required this.item, this.cargo, this.widget})
      : super._();

  @override
  final T item;
  @override
  final D? cargo;
  @override
  final Widget? widget;

  @override
  String toString() {
    return 'FirestoreCollectionEntry<$T, $D>(item: $item, cargo: $cargo, widget: $widget)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FirestoreCollectionEntry<T, D> &&
            (identical(other.item, item) ||
                const DeepCollectionEquality().equals(other.item, item)) &&
            (identical(other.cargo, cargo) ||
                const DeepCollectionEquality().equals(other.cargo, cargo)) &&
            (identical(other.widget, widget) ||
                const DeepCollectionEquality().equals(other.widget, widget)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(item) ^
      const DeepCollectionEquality().hash(cargo) ^
      const DeepCollectionEquality().hash(widget);

  @JsonKey(ignore: true)
  @override
  _$FirestoreCollectionEntryCopyWith<T, D, _FirestoreCollectionEntry<T, D>>
      get copyWith => __$FirestoreCollectionEntryCopyWithImpl<T, D,
          _FirestoreCollectionEntry<T, D>>(this, _$identity);
}

abstract class _FirestoreCollectionEntry<T extends FirestoreModel<T>, D>
    extends FirestoreCollectionEntry<T, D> {
  const factory _FirestoreCollectionEntry(
      {required T item,
      D? cargo,
      Widget? widget}) = _$_FirestoreCollectionEntry<T, D>;
  const _FirestoreCollectionEntry._() : super._();

  @override
  T get item => throw _privateConstructorUsedError;
  @override
  D? get cargo => throw _privateConstructorUsedError;
  @override
  Widget? get widget => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FirestoreCollectionEntryCopyWith<T, D, _FirestoreCollectionEntry<T, D>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$FirestoreCollectionValueTearOff {
  const _$FirestoreCollectionValueTearOff();

  _FirestoreCollectionValue<T, D> call<T extends FirestoreModel<T>, D>(
      {required List<FirestoreCollectionEntry<T, D>> paginated,
      required List<FirestoreCollectionEntry<T, D>> subscribed,
      required List<FirestoreCollectionEntry<T, D>> pending,
      required DateTime createTime,
      FirestoreCollectionStatus status = FirestoreCollectionStatus.idle,
      bool ended = false,
      GenerativeWidgetCoordinator? widgetCoordinator}) {
    return _FirestoreCollectionValue<T, D>(
      paginated: paginated,
      subscribed: subscribed,
      pending: pending,
      createTime: createTime,
      status: status,
      ended: ended,
      widgetCoordinator: widgetCoordinator,
    );
  }
}

/// @nodoc
const $FirestoreCollectionValue = _$FirestoreCollectionValueTearOff();

/// @nodoc
mixin _$FirestoreCollectionValue<T extends FirestoreModel<T>, D> {
  List<FirestoreCollectionEntry<T, D>> get paginated =>
      throw _privateConstructorUsedError;
  List<FirestoreCollectionEntry<T, D>> get subscribed =>
      throw _privateConstructorUsedError;
  List<FirestoreCollectionEntry<T, D>> get pending =>
      throw _privateConstructorUsedError;
  DateTime get createTime => throw _privateConstructorUsedError;
  FirestoreCollectionStatus get status => throw _privateConstructorUsedError;
  bool get ended => throw _privateConstructorUsedError;
  GenerativeWidgetCoordinator? get widgetCoordinator =>
      throw _privateConstructorUsedError;

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
      {List<FirestoreCollectionEntry<T, D>> paginated,
      List<FirestoreCollectionEntry<T, D>> subscribed,
      List<FirestoreCollectionEntry<T, D>> pending,
      DateTime createTime,
      FirestoreCollectionStatus status,
      bool ended,
      GenerativeWidgetCoordinator? widgetCoordinator});
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
    Object? createTime = freezed,
    Object? status = freezed,
    Object? ended = freezed,
    Object? widgetCoordinator = freezed,
  }) {
    return _then(_value.copyWith(
      paginated: paginated == freezed
          ? _value.paginated
          : paginated // ignore: cast_nullable_to_non_nullable
              as List<FirestoreCollectionEntry<T, D>>,
      subscribed: subscribed == freezed
          ? _value.subscribed
          : subscribed // ignore: cast_nullable_to_non_nullable
              as List<FirestoreCollectionEntry<T, D>>,
      pending: pending == freezed
          ? _value.pending
          : pending // ignore: cast_nullable_to_non_nullable
              as List<FirestoreCollectionEntry<T, D>>,
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
      widgetCoordinator: widgetCoordinator == freezed
          ? _value.widgetCoordinator
          : widgetCoordinator // ignore: cast_nullable_to_non_nullable
              as GenerativeWidgetCoordinator?,
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
      {List<FirestoreCollectionEntry<T, D>> paginated,
      List<FirestoreCollectionEntry<T, D>> subscribed,
      List<FirestoreCollectionEntry<T, D>> pending,
      DateTime createTime,
      FirestoreCollectionStatus status,
      bool ended,
      GenerativeWidgetCoordinator? widgetCoordinator});
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
    Object? createTime = freezed,
    Object? status = freezed,
    Object? ended = freezed,
    Object? widgetCoordinator = freezed,
  }) {
    return _then(_FirestoreCollectionValue<T, D>(
      paginated: paginated == freezed
          ? _value.paginated
          : paginated // ignore: cast_nullable_to_non_nullable
              as List<FirestoreCollectionEntry<T, D>>,
      subscribed: subscribed == freezed
          ? _value.subscribed
          : subscribed // ignore: cast_nullable_to_non_nullable
              as List<FirestoreCollectionEntry<T, D>>,
      pending: pending == freezed
          ? _value.pending
          : pending // ignore: cast_nullable_to_non_nullable
              as List<FirestoreCollectionEntry<T, D>>,
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
      widgetCoordinator: widgetCoordinator == freezed
          ? _value.widgetCoordinator
          : widgetCoordinator // ignore: cast_nullable_to_non_nullable
              as GenerativeWidgetCoordinator?,
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
      required this.createTime,
      this.status = FirestoreCollectionStatus.idle,
      this.ended = false,
      this.widgetCoordinator})
      : super._();

  @override
  final List<FirestoreCollectionEntry<T, D>> paginated;
  @override
  final List<FirestoreCollectionEntry<T, D>> subscribed;
  @override
  final List<FirestoreCollectionEntry<T, D>> pending;
  @override
  final DateTime createTime;
  @JsonKey(defaultValue: FirestoreCollectionStatus.idle)
  @override
  final FirestoreCollectionStatus status;
  @JsonKey(defaultValue: false)
  @override
  final bool ended;
  @override
  final GenerativeWidgetCoordinator? widgetCoordinator;

  @override
  String toString() {
    return 'FirestoreCollectionValue<$T, $D>(paginated: $paginated, subscribed: $subscribed, pending: $pending, createTime: $createTime, status: $status, ended: $ended, widgetCoordinator: $widgetCoordinator)';
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
            (identical(other.createTime, createTime) ||
                const DeepCollectionEquality()
                    .equals(other.createTime, createTime)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.ended, ended) ||
                const DeepCollectionEquality().equals(other.ended, ended)) &&
            (identical(other.widgetCoordinator, widgetCoordinator) ||
                const DeepCollectionEquality()
                    .equals(other.widgetCoordinator, widgetCoordinator)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(paginated) ^
      const DeepCollectionEquality().hash(subscribed) ^
      const DeepCollectionEquality().hash(pending) ^
      const DeepCollectionEquality().hash(createTime) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(ended) ^
      const DeepCollectionEquality().hash(widgetCoordinator);

  @JsonKey(ignore: true)
  @override
  _$FirestoreCollectionValueCopyWith<T, D, _FirestoreCollectionValue<T, D>>
      get copyWith => __$FirestoreCollectionValueCopyWithImpl<T, D,
          _FirestoreCollectionValue<T, D>>(this, _$identity);
}

abstract class _FirestoreCollectionValue<T extends FirestoreModel<T>, D>
    extends FirestoreCollectionValue<T, D> {
  const factory _FirestoreCollectionValue(
          {required List<FirestoreCollectionEntry<T, D>> paginated,
          required List<FirestoreCollectionEntry<T, D>> subscribed,
          required List<FirestoreCollectionEntry<T, D>> pending,
          required DateTime createTime,
          FirestoreCollectionStatus status,
          bool ended,
          GenerativeWidgetCoordinator? widgetCoordinator}) =
      _$_FirestoreCollectionValue<T, D>;
  const _FirestoreCollectionValue._() : super._();

  @override
  List<FirestoreCollectionEntry<T, D>> get paginated =>
      throw _privateConstructorUsedError;
  @override
  List<FirestoreCollectionEntry<T, D>> get subscribed =>
      throw _privateConstructorUsedError;
  @override
  List<FirestoreCollectionEntry<T, D>> get pending =>
      throw _privateConstructorUsedError;
  @override
  DateTime get createTime => throw _privateConstructorUsedError;
  @override
  FirestoreCollectionStatus get status => throw _privateConstructorUsedError;
  @override
  bool get ended => throw _privateConstructorUsedError;
  @override
  GenerativeWidgetCoordinator? get widgetCoordinator =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FirestoreCollectionValueCopyWith<T, D, _FirestoreCollectionValue<T, D>>
      get copyWith => throw _privateConstructorUsedError;
}
