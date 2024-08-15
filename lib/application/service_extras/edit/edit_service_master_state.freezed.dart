// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_service_master_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EditServiceExtrasState {
  bool get active => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isUpdating => throw _privateConstructorUsedError;
  ServiceExtrasData? get extrasData => throw _privateConstructorUsedError;
  String? get imageFile => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditServiceExtrasStateCopyWith<EditServiceExtrasState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditServiceExtrasStateCopyWith<$Res> {
  factory $EditServiceExtrasStateCopyWith(EditServiceExtrasState value,
          $Res Function(EditServiceExtrasState) then) =
      _$EditServiceExtrasStateCopyWithImpl<$Res, EditServiceExtrasState>;
  @useResult
  $Res call(
      {bool active,
      bool isLoading,
      bool isUpdating,
      ServiceExtrasData? extrasData,
      String? imageFile});
}

/// @nodoc
class _$EditServiceExtrasStateCopyWithImpl<$Res,
        $Val extends EditServiceExtrasState>
    implements $EditServiceExtrasStateCopyWith<$Res> {
  _$EditServiceExtrasStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? active = null,
    Object? isLoading = null,
    Object? isUpdating = null,
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
      isUpdating: null == isUpdating
          ? _value.isUpdating
          : isUpdating // ignore: cast_nullable_to_non_nullable
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
abstract class _$$EditServiceExtrasStateImplCopyWith<$Res>
    implements $EditServiceExtrasStateCopyWith<$Res> {
  factory _$$EditServiceExtrasStateImplCopyWith(
          _$EditServiceExtrasStateImpl value,
          $Res Function(_$EditServiceExtrasStateImpl) then) =
      __$$EditServiceExtrasStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool active,
      bool isLoading,
      bool isUpdating,
      ServiceExtrasData? extrasData,
      String? imageFile});
}

/// @nodoc
class __$$EditServiceExtrasStateImplCopyWithImpl<$Res>
    extends _$EditServiceExtrasStateCopyWithImpl<$Res,
        _$EditServiceExtrasStateImpl>
    implements _$$EditServiceExtrasStateImplCopyWith<$Res> {
  __$$EditServiceExtrasStateImplCopyWithImpl(
      _$EditServiceExtrasStateImpl _value,
      $Res Function(_$EditServiceExtrasStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? active = null,
    Object? isLoading = null,
    Object? isUpdating = null,
    Object? extrasData = freezed,
    Object? imageFile = freezed,
  }) {
    return _then(_$EditServiceExtrasStateImpl(
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdating: null == isUpdating
          ? _value.isUpdating
          : isUpdating // ignore: cast_nullable_to_non_nullable
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

class _$EditServiceExtrasStateImpl extends _EditServiceExtrasState {
  const _$EditServiceExtrasStateImpl(
      {this.active = true,
      this.isLoading = false,
      this.isUpdating = false,
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
  @JsonKey()
  final bool isUpdating;
  @override
  final ServiceExtrasData? extrasData;
  @override
  final String? imageFile;

  @override
  String toString() {
    return 'EditServiceExtrasState(active: $active, isLoading: $isLoading, isUpdating: $isUpdating, extrasData: $extrasData, imageFile: $imageFile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditServiceExtrasStateImpl &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isUpdating, isUpdating) ||
                other.isUpdating == isUpdating) &&
            (identical(other.extrasData, extrasData) ||
                other.extrasData == extrasData) &&
            (identical(other.imageFile, imageFile) ||
                other.imageFile == imageFile));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, active, isLoading, isUpdating, extrasData, imageFile);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditServiceExtrasStateImplCopyWith<_$EditServiceExtrasStateImpl>
      get copyWith => __$$EditServiceExtrasStateImplCopyWithImpl<
          _$EditServiceExtrasStateImpl>(this, _$identity);
}

abstract class _EditServiceExtrasState extends EditServiceExtrasState {
  const factory _EditServiceExtrasState(
      {final bool active,
      final bool isLoading,
      final bool isUpdating,
      final ServiceExtrasData? extrasData,
      final String? imageFile}) = _$EditServiceExtrasStateImpl;
  const _EditServiceExtrasState._() : super._();

  @override
  bool get active;
  @override
  bool get isLoading;
  @override
  bool get isUpdating;
  @override
  ServiceExtrasData? get extrasData;
  @override
  String? get imageFile;
  @override
  @JsonKey(ignore: true)
  _$$EditServiceExtrasStateImplCopyWith<_$EditServiceExtrasStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
