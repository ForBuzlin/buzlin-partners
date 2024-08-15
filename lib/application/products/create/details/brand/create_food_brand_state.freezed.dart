// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_food_brand_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreateFoodBrandState {
  List<Brand> get brands => throw _privateConstructorUsedError;
  int get activeIndex => throw _privateConstructorUsedError;
  TextEditingController? get brandController =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateFoodBrandStateCopyWith<CreateFoodBrandState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateFoodBrandStateCopyWith<$Res> {
  factory $CreateFoodBrandStateCopyWith(CreateFoodBrandState value,
          $Res Function(CreateFoodBrandState) then) =
      _$CreateFoodBrandStateCopyWithImpl<$Res, CreateFoodBrandState>;
  @useResult
  $Res call(
      {List<Brand> brands,
      int activeIndex,
      TextEditingController? brandController});
}

/// @nodoc
class _$CreateFoodBrandStateCopyWithImpl<$Res,
        $Val extends CreateFoodBrandState>
    implements $CreateFoodBrandStateCopyWith<$Res> {
  _$CreateFoodBrandStateCopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateFoodBrandStateImplCopyWith<$Res>
    implements $CreateFoodBrandStateCopyWith<$Res> {
  factory _$$CreateFoodBrandStateImplCopyWith(_$CreateFoodBrandStateImpl value,
          $Res Function(_$CreateFoodBrandStateImpl) then) =
      __$$CreateFoodBrandStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Brand> brands,
      int activeIndex,
      TextEditingController? brandController});
}

/// @nodoc
class __$$CreateFoodBrandStateImplCopyWithImpl<$Res>
    extends _$CreateFoodBrandStateCopyWithImpl<$Res, _$CreateFoodBrandStateImpl>
    implements _$$CreateFoodBrandStateImplCopyWith<$Res> {
  __$$CreateFoodBrandStateImplCopyWithImpl(_$CreateFoodBrandStateImpl _value,
      $Res Function(_$CreateFoodBrandStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? brands = null,
    Object? activeIndex = null,
    Object? brandController = freezed,
  }) {
    return _then(_$CreateFoodBrandStateImpl(
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
    ));
  }
}

/// @nodoc

class _$CreateFoodBrandStateImpl extends _CreateFoodBrandState {
  const _$CreateFoodBrandStateImpl(
      {final List<Brand> brands = const [],
      this.activeIndex = 1,
      this.brandController})
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
  String toString() {
    return 'CreateFoodBrandState(brands: $brands, activeIndex: $activeIndex, brandController: $brandController)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateFoodBrandStateImpl &&
            const DeepCollectionEquality().equals(other._brands, _brands) &&
            (identical(other.activeIndex, activeIndex) ||
                other.activeIndex == activeIndex) &&
            (identical(other.brandController, brandController) ||
                other.brandController == brandController));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_brands),
      activeIndex,
      brandController);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateFoodBrandStateImplCopyWith<_$CreateFoodBrandStateImpl>
      get copyWith =>
          __$$CreateFoodBrandStateImplCopyWithImpl<_$CreateFoodBrandStateImpl>(
              this, _$identity);
}

abstract class _CreateFoodBrandState extends CreateFoodBrandState {
  const factory _CreateFoodBrandState(
          {final List<Brand> brands,
          final int activeIndex,
          final TextEditingController? brandController}) =
      _$CreateFoodBrandStateImpl;
  const _CreateFoodBrandState._() : super._();

  @override
  List<Brand> get brands;
  @override
  int get activeIndex;
  @override
  TextEditingController? get brandController;
  @override
  @JsonKey(ignore: true)
  _$$CreateFoodBrandStateImplCopyWith<_$CreateFoodBrandStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
