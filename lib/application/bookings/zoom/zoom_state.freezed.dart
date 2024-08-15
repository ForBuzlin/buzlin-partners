// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'zoom_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ZoomState {
  double get calendarZoom => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ZoomStateCopyWith<ZoomState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ZoomStateCopyWith<$Res> {
  factory $ZoomStateCopyWith(ZoomState value, $Res Function(ZoomState) then) =
      _$ZoomStateCopyWithImpl<$Res, ZoomState>;
  @useResult
  $Res call({double calendarZoom});
}

/// @nodoc
class _$ZoomStateCopyWithImpl<$Res, $Val extends ZoomState>
    implements $ZoomStateCopyWith<$Res> {
  _$ZoomStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? calendarZoom = null,
  }) {
    return _then(_value.copyWith(
      calendarZoom: null == calendarZoom
          ? _value.calendarZoom
          : calendarZoom // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ZoomStateImplCopyWith<$Res>
    implements $ZoomStateCopyWith<$Res> {
  factory _$$ZoomStateImplCopyWith(
          _$ZoomStateImpl value, $Res Function(_$ZoomStateImpl) then) =
      __$$ZoomStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double calendarZoom});
}

/// @nodoc
class __$$ZoomStateImplCopyWithImpl<$Res>
    extends _$ZoomStateCopyWithImpl<$Res, _$ZoomStateImpl>
    implements _$$ZoomStateImplCopyWith<$Res> {
  __$$ZoomStateImplCopyWithImpl(
      _$ZoomStateImpl _value, $Res Function(_$ZoomStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? calendarZoom = null,
  }) {
    return _then(_$ZoomStateImpl(
      calendarZoom: null == calendarZoom
          ? _value.calendarZoom
          : calendarZoom // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$ZoomStateImpl extends _ZoomState {
  const _$ZoomStateImpl({this.calendarZoom = 2.2}) : super._();

  @override
  @JsonKey()
  final double calendarZoom;

  @override
  String toString() {
    return 'ZoomState(calendarZoom: $calendarZoom)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ZoomStateImpl &&
            (identical(other.calendarZoom, calendarZoom) ||
                other.calendarZoom == calendarZoom));
  }

  @override
  int get hashCode => Object.hash(runtimeType, calendarZoom);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ZoomStateImplCopyWith<_$ZoomStateImpl> get copyWith =>
      __$$ZoomStateImplCopyWithImpl<_$ZoomStateImpl>(this, _$identity);
}

abstract class _ZoomState extends ZoomState {
  const factory _ZoomState({final double calendarZoom}) = _$ZoomStateImpl;
  const _ZoomState._() : super._();

  @override
  double get calendarZoom;
  @override
  @JsonKey(ignore: true)
  _$$ZoomStateImplCopyWith<_$ZoomStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
