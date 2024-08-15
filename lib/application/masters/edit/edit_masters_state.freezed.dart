// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_masters_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EditMastersState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isUpdating => throw _privateConstructorUsedError;
  String? get imageFile => throw _privateConstructorUsedError;
  UserData? get master => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditMastersStateCopyWith<EditMastersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditMastersStateCopyWith<$Res> {
  factory $EditMastersStateCopyWith(
          EditMastersState value, $Res Function(EditMastersState) then) =
      _$EditMastersStateCopyWithImpl<$Res, EditMastersState>;
  @useResult
  $Res call(
      {bool isLoading, bool isUpdating, String? imageFile, UserData? master});
}

/// @nodoc
class _$EditMastersStateCopyWithImpl<$Res, $Val extends EditMastersState>
    implements $EditMastersStateCopyWith<$Res> {
  _$EditMastersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isUpdating = null,
    Object? imageFile = freezed,
    Object? master = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdating: null == isUpdating
          ? _value.isUpdating
          : isUpdating // ignore: cast_nullable_to_non_nullable
              as bool,
      imageFile: freezed == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as String?,
      master: freezed == master
          ? _value.master
          : master // ignore: cast_nullable_to_non_nullable
              as UserData?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EditMastersStateImplCopyWith<$Res>
    implements $EditMastersStateCopyWith<$Res> {
  factory _$$EditMastersStateImplCopyWith(_$EditMastersStateImpl value,
          $Res Function(_$EditMastersStateImpl) then) =
      __$$EditMastersStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading, bool isUpdating, String? imageFile, UserData? master});
}

/// @nodoc
class __$$EditMastersStateImplCopyWithImpl<$Res>
    extends _$EditMastersStateCopyWithImpl<$Res, _$EditMastersStateImpl>
    implements _$$EditMastersStateImplCopyWith<$Res> {
  __$$EditMastersStateImplCopyWithImpl(_$EditMastersStateImpl _value,
      $Res Function(_$EditMastersStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isUpdating = null,
    Object? imageFile = freezed,
    Object? master = freezed,
  }) {
    return _then(_$EditMastersStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdating: null == isUpdating
          ? _value.isUpdating
          : isUpdating // ignore: cast_nullable_to_non_nullable
              as bool,
      imageFile: freezed == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as String?,
      master: freezed == master
          ? _value.master
          : master // ignore: cast_nullable_to_non_nullable
              as UserData?,
    ));
  }
}

/// @nodoc

class _$EditMastersStateImpl extends _EditMastersState {
  const _$EditMastersStateImpl(
      {this.isLoading = false,
      this.isUpdating = false,
      this.imageFile = null,
      this.master})
      : super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isUpdating;
  @override
  @JsonKey()
  final String? imageFile;
  @override
  final UserData? master;

  @override
  String toString() {
    return 'EditMastersState(isLoading: $isLoading, isUpdating: $isUpdating, imageFile: $imageFile, master: $master)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditMastersStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isUpdating, isUpdating) ||
                other.isUpdating == isUpdating) &&
            (identical(other.imageFile, imageFile) ||
                other.imageFile == imageFile) &&
            (identical(other.master, master) || other.master == master));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, isUpdating, imageFile, master);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditMastersStateImplCopyWith<_$EditMastersStateImpl> get copyWith =>
      __$$EditMastersStateImplCopyWithImpl<_$EditMastersStateImpl>(
          this, _$identity);
}

abstract class _EditMastersState extends EditMastersState {
  const factory _EditMastersState(
      {final bool isLoading,
      final bool isUpdating,
      final String? imageFile,
      final UserData? master}) = _$EditMastersStateImpl;
  const _EditMastersState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isUpdating;
  @override
  String? get imageFile;
  @override
  UserData? get master;
  @override
  @JsonKey(ignore: true)
  _$$EditMastersStateImplCopyWith<_$EditMastersStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
