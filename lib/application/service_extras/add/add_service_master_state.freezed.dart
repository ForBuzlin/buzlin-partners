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
mixin _$AddServiceExtrasState {
  bool get active => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  ServiceExtrasData? get extrasData => throw _privateConstructorUsedError;
  String? get imageFile => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddServiceExtrasStateCopyWith<AddServiceExtrasState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddServiceExtrasStateCopyWith<$Res> {
  factory $AddServiceExtrasStateCopyWith(AddServiceExtrasState value,
          $Res Function(AddServiceExtrasState) then) =
      _$AddServiceExtrasStateCopyWithImpl<$Res, AddServiceExtrasState>;
  @useResult
  $Res call(
      {bool active,
      bool isLoading,
      ServiceExtrasData? extrasData,
      String? imageFile});
}

/// @nodoc
class _$AddServiceExtrasStateCopyWithImpl<$Res,
        $Val extends AddServiceExtrasState>
    implements $AddServiceExtrasStateCopyWith<$Res> {
  _$AddServiceExtrasStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? active = null,
    Object? isLoading = null,
    Object? extrasData = freezed,
    Object? imageFile = freezed,
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
      extrasData: freezed == extrasData
          ? _value.extrasData
          : extrasData // ignore: cast_nullable_to_non_nullable
              as ServiceExtrasData?,
      imageFile: freezed == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddServiceExtrasStateImplCopyWith<$Res>
    implements $AddServiceExtrasStateCopyWith<$Res> {
  factory _$$AddServiceExtrasStateImplCopyWith(
          _$AddServiceExtrasStateImpl value,
          $Res Function(_$AddServiceExtrasStateImpl) then) =
      __$$AddServiceExtrasStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool active,
      bool isLoading,
      ServiceExtrasData? extrasData,
      String? imageFile});
}

/// @nodoc
class __$$AddServiceExtrasStateImplCopyWithImpl<$Res>
    extends _$AddServiceExtrasStateCopyWithImpl<$Res,
        _$AddServiceExtrasStateImpl>
    implements _$$AddServiceExtrasStateImplCopyWith<$Res> {
  __$$AddServiceExtrasStateImplCopyWithImpl(_$AddServiceExtrasStateImpl _value,
      $Res Function(_$AddServiceExtrasStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? active = null,
    Object? isLoading = null,
    Object? extrasData = freezed,
    Object? imageFile = freezed,
  }) {
    return _then(_$AddServiceExtrasStateImpl(
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      extrasData: freezed == extrasData
          ? _value.extrasData
          : extrasData // ignore: cast_nullable_to_non_nullable
              as ServiceExtrasData?,
      imageFile: freezed == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AddServiceExtrasStateImpl extends _AddServiceExtrasState {
  const _$AddServiceExtrasStateImpl(
      {this.active = true,
      this.isLoading = false,
      this.extrasData,
      this.imageFile})
      : super._();

  @override
  @JsonKey()
  final bool active;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final ServiceExtrasData? extrasData;
  @override
  final String? imageFile;

  @override
  String toString() {
    return 'AddServiceExtrasState(active: $active, isLoading: $isLoading, extrasData: $extrasData, imageFile: $imageFile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddServiceExtrasStateImpl &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.extrasData, extrasData) ||
                other.extrasData == extrasData) &&
            (identical(other.imageFile, imageFile) ||
                other.imageFile == imageFile));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, active, isLoading, extrasData, imageFile);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddServiceExtrasStateImplCopyWith<_$AddServiceExtrasStateImpl>
      get copyWith => __$$AddServiceExtrasStateImplCopyWithImpl<
          _$AddServiceExtrasStateImpl>(this, _$identity);
}

abstract class _AddServiceExtrasState extends AddServiceExtrasState {
  const factory _AddServiceExtrasState(
      {final bool active,
      final bool isLoading,
      final ServiceExtrasData? extrasData,
      final String? imageFile}) = _$AddServiceExtrasStateImpl;
  const _AddServiceExtrasState._() : super._();

  @override
  bool get active;
  @override
  bool get isLoading;
  @override
  ServiceExtrasData? get extrasData;
  @override
  String? get imageFile;
  @override
  @JsonKey(ignore: true)
  _$$AddServiceExtrasStateImplCopyWith<_$AddServiceExtrasStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
