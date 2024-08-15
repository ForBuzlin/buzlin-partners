// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ShopState {
  bool get isLoading => throw _privateConstructorUsedError;
  String? get backgroundImageFile => throw _privateConstructorUsedError;
  String? get logoImageFile => throw _privateConstructorUsedError;
  ShopData? get shop => throw _privateConstructorUsedError;
  int? get categoryId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShopStateCopyWith<ShopState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopStateCopyWith<$Res> {
  factory $ShopStateCopyWith(ShopState value, $Res Function(ShopState) then) =
      _$ShopStateCopyWithImpl<$Res, ShopState>;
  @useResult
  $Res call(
      {bool isLoading,
      String? backgroundImageFile,
      String? logoImageFile,
      ShopData? shop,
      int? categoryId});
}

/// @nodoc
class _$ShopStateCopyWithImpl<$Res, $Val extends ShopState>
    implements $ShopStateCopyWith<$Res> {
  _$ShopStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? backgroundImageFile = freezed,
    Object? logoImageFile = freezed,
    Object? shop = freezed,
    Object? categoryId = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      backgroundImageFile: freezed == backgroundImageFile
          ? _value.backgroundImageFile
          : backgroundImageFile // ignore: cast_nullable_to_non_nullable
              as String?,
      logoImageFile: freezed == logoImageFile
          ? _value.logoImageFile
          : logoImageFile // ignore: cast_nullable_to_non_nullable
              as String?,
      shop: freezed == shop
          ? _value.shop
          : shop // ignore: cast_nullable_to_non_nullable
              as ShopData?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShopStateImplCopyWith<$Res>
    implements $ShopStateCopyWith<$Res> {
  factory _$$ShopStateImplCopyWith(
          _$ShopStateImpl value, $Res Function(_$ShopStateImpl) then) =
      __$$ShopStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      String? backgroundImageFile,
      String? logoImageFile,
      ShopData? shop,
      int? categoryId});
}

/// @nodoc
class __$$ShopStateImplCopyWithImpl<$Res>
    extends _$ShopStateCopyWithImpl<$Res, _$ShopStateImpl>
    implements _$$ShopStateImplCopyWith<$Res> {
  __$$ShopStateImplCopyWithImpl(
      _$ShopStateImpl _value, $Res Function(_$ShopStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? backgroundImageFile = freezed,
    Object? logoImageFile = freezed,
    Object? shop = freezed,
    Object? categoryId = freezed,
  }) {
    return _then(_$ShopStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      backgroundImageFile: freezed == backgroundImageFile
          ? _value.backgroundImageFile
          : backgroundImageFile // ignore: cast_nullable_to_non_nullable
              as String?,
      logoImageFile: freezed == logoImageFile
          ? _value.logoImageFile
          : logoImageFile // ignore: cast_nullable_to_non_nullable
              as String?,
      shop: freezed == shop
          ? _value.shop
          : shop // ignore: cast_nullable_to_non_nullable
              as ShopData?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$ShopStateImpl extends _ShopState {
  const _$ShopStateImpl(
      {this.isLoading = false,
      this.backgroundImageFile,
      this.logoImageFile,
      this.shop,
      this.categoryId})
      : super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? backgroundImageFile;
  @override
  final String? logoImageFile;
  @override
  final ShopData? shop;
  @override
  final int? categoryId;

  @override
  String toString() {
    return 'ShopState(isLoading: $isLoading, backgroundImageFile: $backgroundImageFile, logoImageFile: $logoImageFile, shop: $shop, categoryId: $categoryId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShopStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.backgroundImageFile, backgroundImageFile) ||
                other.backgroundImageFile == backgroundImageFile) &&
            (identical(other.logoImageFile, logoImageFile) ||
                other.logoImageFile == logoImageFile) &&
            (identical(other.shop, shop) || other.shop == shop) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, backgroundImageFile,
      logoImageFile, shop, categoryId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShopStateImplCopyWith<_$ShopStateImpl> get copyWith =>
      __$$ShopStateImplCopyWithImpl<_$ShopStateImpl>(this, _$identity);
}

abstract class _ShopState extends ShopState {
  const factory _ShopState(
      {final bool isLoading,
      final String? backgroundImageFile,
      final String? logoImageFile,
      final ShopData? shop,
      final int? categoryId}) = _$ShopStateImpl;
  const _ShopState._() : super._();

  @override
  bool get isLoading;
  @override
  String? get backgroundImageFile;
  @override
  String? get logoImageFile;
  @override
  ShopData? get shop;
  @override
  int? get categoryId;
  @override
  @JsonKey(ignore: true)
  _$$ShopStateImplCopyWith<_$ShopStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
