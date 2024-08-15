// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'convert_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ConvertState {
  File? get file => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  double get progress => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConvertStateCopyWith<ConvertState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConvertStateCopyWith<$Res> {
  factory $ConvertStateCopyWith(
          ConvertState value, $Res Function(ConvertState) then) =
      _$ConvertStateCopyWithImpl<$Res, ConvertState>;
  @useResult
  $Res call({File? file, String? name, bool isLoading, double progress});
}

/// @nodoc
class _$ConvertStateCopyWithImpl<$Res, $Val extends ConvertState>
    implements $ConvertStateCopyWith<$Res> {
  _$ConvertStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = freezed,
    Object? name = freezed,
    Object? isLoading = null,
    Object? progress = null,
  }) {
    return _then(_value.copyWith(
      file: freezed == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConvertStateImplCopyWith<$Res>
    implements $ConvertStateCopyWith<$Res> {
  factory _$$ConvertStateImplCopyWith(
          _$ConvertStateImpl value, $Res Function(_$ConvertStateImpl) then) =
      __$$ConvertStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({File? file, String? name, bool isLoading, double progress});
}

/// @nodoc
class __$$ConvertStateImplCopyWithImpl<$Res>
    extends _$ConvertStateCopyWithImpl<$Res, _$ConvertStateImpl>
    implements _$$ConvertStateImplCopyWith<$Res> {
  __$$ConvertStateImplCopyWithImpl(
      _$ConvertStateImpl _value, $Res Function(_$ConvertStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = freezed,
    Object? name = freezed,
    Object? isLoading = null,
    Object? progress = null,
  }) {
    return _then(_$ConvertStateImpl(
      file: freezed == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$ConvertStateImpl implements _ConvertState {
  const _$ConvertStateImpl(
      {this.file = null,
      this.name = null,
      this.isLoading = false,
      this.progress = 0});

  @override
  @JsonKey()
  final File? file;
  @override
  @JsonKey()
  final String? name;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final double progress;

  @override
  String toString() {
    return 'ConvertState(file: $file, name: $name, isLoading: $isLoading, progress: $progress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConvertStateImpl &&
            (identical(other.file, file) || other.file == file) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.progress, progress) ||
                other.progress == progress));
  }

  @override
  int get hashCode => Object.hash(runtimeType, file, name, isLoading, progress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConvertStateImplCopyWith<_$ConvertStateImpl> get copyWith =>
      __$$ConvertStateImplCopyWithImpl<_$ConvertStateImpl>(this, _$identity);
}

abstract class _ConvertState implements ConvertState {
  const factory _ConvertState(
      {final File? file,
      final String? name,
      final bool isLoading,
      final double progress}) = _$ConvertStateImpl;

  @override
  File? get file;
  @override
  String? get name;
  @override
  bool get isLoading;
  @override
  double get progress;
  @override
  @JsonKey(ignore: true)
  _$$ConvertStateImplCopyWith<_$ConvertStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
