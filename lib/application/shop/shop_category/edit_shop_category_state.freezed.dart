// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_shop_category_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EditShopCategoryState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<ShopCategoryData> get shopCategories =>
      throw _privateConstructorUsedError;
  int? get activeIndex => throw _privateConstructorUsedError;
  TextEditingController? get shopCategoryController =>
      throw _privateConstructorUsedError;
  ShopCategoryData? get shopCategoryData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditShopCategoryStateCopyWith<EditShopCategoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditShopCategoryStateCopyWith<$Res> {
  factory $EditShopCategoryStateCopyWith(EditShopCategoryState value,
          $Res Function(EditShopCategoryState) then) =
      _$EditShopCategoryStateCopyWithImpl<$Res, EditShopCategoryState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<ShopCategoryData> shopCategories,
      int? activeIndex,
      TextEditingController? shopCategoryController,
      ShopCategoryData? shopCategoryData});
}

/// @nodoc
class _$EditShopCategoryStateCopyWithImpl<$Res,
        $Val extends EditShopCategoryState>
    implements $EditShopCategoryStateCopyWith<$Res> {
  _$EditShopCategoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? shopCategories = null,
    Object? activeIndex = freezed,
    Object? shopCategoryController = freezed,
    Object? shopCategoryData = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      shopCategories: null == shopCategories
          ? _value.shopCategories
          : shopCategories // ignore: cast_nullable_to_non_nullable
              as List<ShopCategoryData>,
      activeIndex: freezed == activeIndex
          ? _value.activeIndex
          : activeIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      shopCategoryController: freezed == shopCategoryController
          ? _value.shopCategoryController
          : shopCategoryController // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
      shopCategoryData: freezed == shopCategoryData
          ? _value.shopCategoryData
          : shopCategoryData // ignore: cast_nullable_to_non_nullable
              as ShopCategoryData?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EditShopCategoryStateImplCopyWith<$Res>
    implements $EditShopCategoryStateCopyWith<$Res> {
  factory _$$EditShopCategoryStateImplCopyWith(
          _$EditShopCategoryStateImpl value,
          $Res Function(_$EditShopCategoryStateImpl) then) =
      __$$EditShopCategoryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<ShopCategoryData> shopCategories,
      int? activeIndex,
      TextEditingController? shopCategoryController,
      ShopCategoryData? shopCategoryData});
}

/// @nodoc
class __$$EditShopCategoryStateImplCopyWithImpl<$Res>
    extends _$EditShopCategoryStateCopyWithImpl<$Res,
        _$EditShopCategoryStateImpl>
    implements _$$EditShopCategoryStateImplCopyWith<$Res> {
  __$$EditShopCategoryStateImplCopyWithImpl(_$EditShopCategoryStateImpl _value,
      $Res Function(_$EditShopCategoryStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? shopCategories = null,
    Object? activeIndex = freezed,
    Object? shopCategoryController = freezed,
    Object? shopCategoryData = freezed,
  }) {
    return _then(_$EditShopCategoryStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      shopCategories: null == shopCategories
          ? _value._shopCategories
          : shopCategories // ignore: cast_nullable_to_non_nullable
              as List<ShopCategoryData>,
      activeIndex: freezed == activeIndex
          ? _value.activeIndex
          : activeIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      shopCategoryController: freezed == shopCategoryController
          ? _value.shopCategoryController
          : shopCategoryController // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
      shopCategoryData: freezed == shopCategoryData
          ? _value.shopCategoryData
          : shopCategoryData // ignore: cast_nullable_to_non_nullable
              as ShopCategoryData?,
    ));
  }
}

/// @nodoc

class _$EditShopCategoryStateImpl extends _EditShopCategoryState {
  const _$EditShopCategoryStateImpl(
      {this.isLoading = false,
      final List<ShopCategoryData> shopCategories = const [],
      this.activeIndex,
      this.shopCategoryController,
      this.shopCategoryData})
      : _shopCategories = shopCategories,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  final List<ShopCategoryData> _shopCategories;
  @override
  @JsonKey()
  List<ShopCategoryData> get shopCategories {
    if (_shopCategories is EqualUnmodifiableListView) return _shopCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shopCategories);
  }

  @override
  final int? activeIndex;
  @override
  final TextEditingController? shopCategoryController;
  @override
  final ShopCategoryData? shopCategoryData;

  @override
  String toString() {
    return 'EditShopCategoryState(isLoading: $isLoading, shopCategories: $shopCategories, activeIndex: $activeIndex, shopCategoryController: $shopCategoryController, shopCategoryData: $shopCategoryData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditShopCategoryStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._shopCategories, _shopCategories) &&
            (identical(other.activeIndex, activeIndex) ||
                other.activeIndex == activeIndex) &&
            (identical(other.shopCategoryController, shopCategoryController) ||
                other.shopCategoryController == shopCategoryController) &&
            (identical(other.shopCategoryData, shopCategoryData) ||
                other.shopCategoryData == shopCategoryData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_shopCategories),
      activeIndex,
      shopCategoryController,
      shopCategoryData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditShopCategoryStateImplCopyWith<_$EditShopCategoryStateImpl>
      get copyWith => __$$EditShopCategoryStateImplCopyWithImpl<
          _$EditShopCategoryStateImpl>(this, _$identity);
}

abstract class _EditShopCategoryState extends EditShopCategoryState {
  const factory _EditShopCategoryState(
      {final bool isLoading,
      final List<ShopCategoryData> shopCategories,
      final int? activeIndex,
      final TextEditingController? shopCategoryController,
      final ShopCategoryData? shopCategoryData}) = _$EditShopCategoryStateImpl;
  const _EditShopCategoryState._() : super._();

  @override
  bool get isLoading;
  @override
  List<ShopCategoryData> get shopCategories;
  @override
  int? get activeIndex;
  @override
  TextEditingController? get shopCategoryController;
  @override
  ShopCategoryData? get shopCategoryData;
  @override
  @JsonKey(ignore: true)
  _$$EditShopCategoryStateImplCopyWith<_$EditShopCategoryStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
