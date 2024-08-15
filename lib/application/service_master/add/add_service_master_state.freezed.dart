// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_service_master_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddServiceMasterState {
  bool get active => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  ServiceData? get serviceData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddServiceMasterStateCopyWith<AddServiceMasterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddServiceMasterStateCopyWith<$Res> {
  factory $AddServiceMasterStateCopyWith(AddServiceMasterState value,
          $Res Function(AddServiceMasterState) then) =
      _$AddServiceMasterStateCopyWithImpl<$Res, AddServiceMasterState>;
  @useResult
  $Res call({bool active, bool isLoading, ServiceData? serviceData});
}

/// @nodoc
class _$AddServiceMasterStateCopyWithImpl<$Res,
        $Val extends AddServiceMasterState>
    implements $AddServiceMasterStateCopyWith<$Res> {
  _$AddServiceMasterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? active = null,
    Object? isLoading = null,
    Object? serviceData = freezed,
  }) {
    return _then(_value.copyWith(
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      serviceData: freezed == serviceData
          ? _value.serviceData
          : serviceData // ignore: cast_nullable_to_non_nullable
              as ServiceData?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddServiceMasterStateImplCopyWith<$Res>
    implements $AddServiceMasterStateCopyWith<$Res> {
  factory _$$AddServiceMasterStateImplCopyWith(
          _$AddServiceMasterStateImpl value,
          $Res Function(_$AddServiceMasterStateImpl) then) =
      __$$AddServiceMasterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool active, bool isLoading, ServiceData? serviceData});
}

/// @nodoc
class __$$AddServiceMasterStateImplCopyWithImpl<$Res>
    extends _$AddServiceMasterStateCopyWithImpl<$Res,
        _$AddServiceMasterStateImpl>
    implements _$$AddServiceMasterStateImplCopyWith<$Res> {
  __$$AddServiceMasterStateImplCopyWithImpl(_$AddServiceMasterStateImpl _value,
      $Res Function(_$AddServiceMasterStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? active = null,
    Object? isLoading = null,
    Object? serviceData = freezed,
  }) {
    return _then(_$AddServiceMasterStateImpl(
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      serviceData: freezed == serviceData
          ? _value.serviceData
          : serviceData // ignore: cast_nullable_to_non_nullable
              as ServiceData?,
    ));
  }
}

/// @nodoc

class _$AddServiceMasterStateImpl extends _AddServiceMasterState {
  const _$AddServiceMasterStateImpl(
      {this.active = true, this.isLoading = false, this.serviceData})
      : super._();

  @override
  @JsonKey()
  final bool active;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final ServiceData? serviceData;

  @override
  String toString() {
    return 'AddServiceMasterState(active: $active, isLoading: $isLoading, serviceData: $serviceData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddServiceMasterStateImpl &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.serviceData, serviceData) ||
                other.serviceData == serviceData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, active, isLoading, serviceData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddServiceMasterStateImplCopyWith<_$AddServiceMasterStateImpl>
      get copyWith => __$$AddServiceMasterStateImplCopyWithImpl<
          _$AddServiceMasterStateImpl>(this, _$identity);
}

abstract class _AddServiceMasterState extends AddServiceMasterState {
  const factory _AddServiceMasterState(
      {final bool active,
      final bool isLoading,
      final ServiceData? serviceData}) = _$AddServiceMasterStateImpl;
  const _AddServiceMasterState._() : super._();

  @override
  bool get active;
  @override
  bool get isLoading;
  @override
  ServiceData? get serviceData;
  @override
  @JsonKey(ignore: true)
  _$$AddServiceMasterStateImplCopyWith<_$AddServiceMasterStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
