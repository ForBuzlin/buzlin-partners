// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_food_brand_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EditFoodBrandState {
  List<Brand> get brands => throw _privateConstructorUsedError;
  int get activeIndex => throw _privateConstructorUsedError;
  TextEditingController? get brandController =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  Brand? get brand => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditFoodBrandStateCopyWith<EditFoodBrandState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditFoodBrandStateCopyWith<$Res> {
  factory $EditFoodBrandStateCopyWith(
          EditFoodBrandState value, $Res Function(EditFoodBrandState) then) =
      _$EditFoodBrandStateCopyWithImpl<$Res, EditFoodBrandState>;
  @useResult
  $Res call(
      {List<Brand> brands,
      int activeIndex,
      TextEditingController? brandController,
      bool isLoading,
      Brand? brand});
}

/// @nodoc
class _$EditFoodBrandStateCopyWithImpl<$Res, $Val extends EditFoodBrandState>
    implements $EditFoodBrandStateCopyWith<$Res> {
  _$EditFoodBrandStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? brands = null,
    Object? activeIndex = null,
    Object? brandController = freezed,
    Object? isLoading = null,
    Object? brand = freezed,
  }) {
    return _then(_value.copyWith(
      brands: null == brands
          ? _value.brands
          : brands // ignore: cast_nullable_to_non_nullable
              as List<Brand>,
      activeIndex: null == activeIndex
          ? _value.activeIndex
          : activeIndex // ignore: cast_nullable_to_non_nullable
              as int,
      brandController: freezed == brandController
          ? _value.brandController
          : brandController // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as Brand?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EditFoodBrandStateImplCopyWith<$Res>
    implements $EditFoodBrandStateCopyWith<$Res> {
  factory _$$EditFoodBrandStateImplCopyWith(_$EditFoodBrandStateImpl value,
          $Res Function(_$EditFoodBrandStateImpl) then) =
      __$$EditFoodBrandStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Brand> brands,
      int activeIndex,
      TextEditingController? brandController,
      bool isLoading,
      Brand? brand});
}

/// @nodoc
class __$$EditFoodBrandStateImplCopyWithImpl<$Res>
    extends _$EditFoodBrandStateCopyWithImpl<$Res, _$EditFoodBrandStateImpl>
    implements _$$EditFoodBrandStateImplCopyWith<$Res> {
  __$$EditFoodBrandStateImplCopyWithImpl(_$EditFoodBrandStateImpl _value,
      $Res Function(_$EditFoodBrandStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? brands = null,
    Object? activeIndex = null,
    Object? brandController = freezed,
    Object? isLoading = null,
    Object? brand = freezed,
  }) {
    return _then(_$EditFoodBrandStateImpl(
      brands: null == brands
          ? _value._brands
          : brands // ignore: cast_nullable_to_non_nullable
              as List<Brand>,
      activeIndex: null == activeIndex
          ? _value.activeIndex
          : activeIndex // ignore: cast_nullable_to_non_nullable
              as int,
      brandController: freezed == brandController
          ? _value.brandController
          : brandController // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as Brand?,
    ));
  }
}

/// @nodoc

class _$EditFoodBrandStateImpl extends _EditFoodBrandState {
  const _$EditFoodBrandStateImpl(
      {final List<Brand> brands = const [],
      this.activeIndex = -1,
      this.brandController,
      this.isLoading = false,
      this.brand})
      : _brands = brands,
        super._();

  final List<Brand> _brands;
  @override
  @JsonKey()
  List<Brand> get brands {
    if (_brands is EqualUnmodifiableListView) return _brands;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_brands);
  }

  @override
  @JsonKey()
  final int activeIndex;
  @override
  final TextEditingController? brandController;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final Brand? brand;

  @override
  String toString() {
    return 'EditFoodBrandState(brands: $brands, activeIndex: $activeIndex, brandController: $brandController, isLoading: $isLoading, brand: $brand)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditFoodBrandStateImpl &&
            const DeepCollectionEquality().equals(other._brands, _brands) &&
            (identical(other.activeIndex, activeIndex) ||
                other.activeIndex == activeIndex) &&
            (identical(other.brandController, brandController) ||
                other.brandController == brandController) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.brand, brand) || other.brand == brand));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_brands),
      activeIndex,
      brandController,
      isLoading,
      brand);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditFoodBrandStateImplCopyWith<_$EditFoodBrandStateImpl> get copyWith =>
      __$$EditFoodBrandStateImplCopyWithImpl<_$EditFoodBrandStateImpl>(
          this, _$identity);
}

abstract class _EditFoodBrandState extends EditFoodBrandState {
  const factory _EditFoodBrandState(
      {final List<Brand> brands,
      final int activeIndex,
      final TextEditingController? brandController,
      final bool isLoading,
      final Brand? brand}) = _$EditFoodBrandStateImpl;
  const _EditFoodBrandState._() : super._();

  @override
  List<Brand> get brands;
  @override
  int get activeIndex;
  @override
  TextEditingController? get brandController;
  @override
  bool get isLoading;
  @override
  Brand? get brand;
  @override
  @JsonKey(ignore: true)
  _$$EditFoodBrandStateImplCopyWith<_$EditFoodBrandStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
