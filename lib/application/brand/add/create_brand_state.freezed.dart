// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_brand_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreateBrandState {
  String get title => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isInitial => throw _privateConstructorUsedError;
  String? get imageFile => throw _privateConstructorUsedError;
  Brand? get brand => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateBrandStateCopyWith<CreateBrandState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateBrandStateCopyWith<$Res> {
  factory $CreateBrandStateCopyWith(
          CreateBrandState value, $Res Function(CreateBrandState) then) =
      _$CreateBrandStateCopyWithImpl<$Res, CreateBrandState>;
  @useResult
  $Res call(
      {String title,
      bool active,
      bool isLoading,
      bool isInitial,
      String? imageFile,
      Brand? brand});
}

/// @nodoc
class _$CreateBrandStateCopyWithImpl<$Res, $Val extends CreateBrandState>
    implements $CreateBrandStateCopyWith<$Res> {
  _$CreateBrandStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? active = null,
    Object? isLoading = null,
    Object? isInitial = null,
    Object? imageFile = freezed,
    Object? brand = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isInitial: null == isInitial
          ? _value.isInitial
          : isInitial // ignore: cast_nullable_to_non_nullable
              as bool,
      imageFile: freezed == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as String?,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as Brand?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateBrandStateImplCopyWith<$Res>
    implements $CreateBrandStateCopyWith<$Res> {
  factory _$$CreateBrandStateImplCopyWith(_$CreateBrandStateImpl value,
          $Res Function(_$CreateBrandStateImpl) then) =
      __$$CreateBrandStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      bool active,
      bool isLoading,
      bool isInitial,
      String? imageFile,
      Brand? brand});
}

/// @nodoc
class __$$CreateBrandStateImplCopyWithImpl<$Res>
    extends _$CreateBrandStateCopyWithImpl<$Res, _$CreateBrandStateImpl>
    implements _$$CreateBrandStateImplCopyWith<$Res> {
  __$$CreateBrandStateImplCopyWithImpl(_$CreateBrandStateImpl _value,
      $Res Function(_$CreateBrandStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? active = null,
    Object? isLoading = null,
    Object? isInitial = null,
    Object? imageFile = freezed,
    Object? brand = freezed,
  }) {
    return _then(_$CreateBrandStateImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isInitial: null == isInitial
          ? _value.isInitial
          : isInitial // ignore: cast_nullable_to_non_nullable
              as bool,
      imageFile: freezed == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as String?,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as Brand?,
    ));
  }
}

/// @nodoc

class _$CreateBrandStateImpl extends _CreateBrandState {
  const _$CreateBrandStateImpl(
      {this.title = '',
      this.active = true,
      this.isLoading = false,
      this.isInitial = false,
      this.imageFile,
      this.brand})
      : super._();

  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final bool active;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isInitial;
  @override
  final String? imageFile;
  @override
  final Brand? brand;

  @override
  String toString() {
    return 'CreateBrandState(title: $title, active: $active, isLoading: $isLoading, isInitial: $isInitial, imageFile: $imageFile, brand: $brand)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateBrandStateImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isInitial, isInitial) ||
                other.isInitial == isInitial) &&
            (identical(other.imageFile, imageFile) ||
                other.imageFile == imageFile) &&
            (identical(other.brand, brand) || other.brand == brand));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, title, active, isLoading, isInitial, imageFile, brand);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateBrandStateImplCopyWith<_$CreateBrandStateImpl> get copyWith =>
      __$$CreateBrandStateImplCopyWithImpl<_$CreateBrandStateImpl>(
          this, _$identity);
}

abstract class _CreateBrandState extends CreateBrandState {
  const factory _CreateBrandState(
      {final String title,
      final bool active,
      final bool isLoading,
      final bool isInitial,
      final String? imageFile,
      final Brand? brand}) = _$CreateBrandStateImpl;
  const _CreateBrandState._() : super._();

  @override
  String get title;
  @override
  bool get active;
  @override
  bool get isLoading;
  @override
  bool get isInitial;
  @override
  String? get imageFile;
  @override
  Brand? get brand;
  @override
  @JsonKey(ignore: true)
  _$$CreateBrandStateImplCopyWith<_$CreateBrandStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
