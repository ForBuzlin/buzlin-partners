// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'disable_times_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MasterDisableTimesState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isUpdate => throw _privateConstructorUsedError;
  DisableTimes? get disableTime => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MasterDisableTimesStateCopyWith<MasterDisableTimesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MasterDisableTimesStateCopyWith<$Res> {
  factory $MasterDisableTimesStateCopyWith(MasterDisableTimesState value,
          $Res Function(MasterDisableTimesState) then) =
      _$MasterDisableTimesStateCopyWithImpl<$Res, MasterDisableTimesState>;
  @useResult
  $Res call({bool isLoading, bool isUpdate, DisableTimes? disableTime});
}

/// @nodoc
class _$MasterDisableTimesStateCopyWithImpl<$Res,
        $Val extends MasterDisableTimesState>
    implements $MasterDisableTimesStateCopyWith<$Res> {
  _$MasterDisableTimesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isUpdate = null,
    Object? disableTime = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdate: null == isUpdate
          ? _value.isUpdate
          : isUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
      disableTime: freezed == disableTime
          ? _value.disableTime
          : disableTime // ignore: cast_nullable_to_non_nullable
              as DisableTimes?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MasterDisableTimesStateImplCopyWith<$Res>
    implements $MasterDisableTimesStateCopyWith<$Res> {
  factory _$$MasterDisableTimesStateImplCopyWith(
          _$MasterDisableTimesStateImpl value,
          $Res Function(_$MasterDisableTimesStateImpl) then) =
      __$$MasterDisableTimesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, bool isUpdate, DisableTimes? disableTime});
}

/// @nodoc
class __$$MasterDisableTimesStateImplCopyWithImpl<$Res>
    extends _$MasterDisableTimesStateCopyWithImpl<$Res,
        _$MasterDisableTimesStateImpl>
    implements _$$MasterDisableTimesStateImplCopyWith<$Res> {
  __$$MasterDisableTimesStateImplCopyWithImpl(
      _$MasterDisableTimesStateImpl _value,
      $Res Function(_$MasterDisableTimesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isUpdate = null,
    Object? disableTime = freezed,
  }) {
    return _then(_$MasterDisableTimesStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdate: null == isUpdate
          ? _value.isUpdate
          : isUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
      disableTime: freezed == disableTime
          ? _value.disableTime
          : disableTime // ignore: cast_nullable_to_non_nullable
              as DisableTimes?,
    ));
  }
}

/// @nodoc

class _$MasterDisableTimesStateImpl extends _MasterDisableTimesState {
  const _$MasterDisableTimesStateImpl(
      {this.isLoading = false, this.isUpdate = false, this.disableTime})
      : super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isUpdate;
  @override
  final DisableTimes? disableTime;

  @override
  String toString() {
    return 'MasterDisableTimesState(isLoading: $isLoading, isUpdate: $isUpdate, disableTime: $disableTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MasterDisableTimesStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isUpdate, isUpdate) ||
                other.isUpdate == isUpdate) &&
            (identical(other.disableTime, disableTime) ||
                other.disableTime == disableTime));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, isUpdate, disableTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MasterDisableTimesStateImplCopyWith<_$MasterDisableTimesStateImpl>
      get copyWith => __$$MasterDisableTimesStateImplCopyWithImpl<
          _$MasterDisableTimesStateImpl>(this, _$identity);
}

abstract class _MasterDisableTimesState extends MasterDisableTimesState {
  const factory _MasterDisableTimesState(
      {final bool isLoading,
      final bool isUpdate,
      final DisableTimes? disableTime}) = _$MasterDisableTimesStateImpl;
  const _MasterDisableTimesState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isUpdate;
  @override
  DisableTimes? get disableTime;
  @override
  @JsonKey(ignore: true)
  _$$MasterDisableTimesStateImplCopyWith<_$MasterDisableTimesStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
