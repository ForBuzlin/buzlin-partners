// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'brand_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BrandState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<Brand> get brands => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BrandStateCopyWith<BrandState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BrandStateCopyWith<$Res> {
  factory $BrandStateCopyWith(
          BrandState value, $Res Function(BrandState) then) =
      _$BrandStateCopyWithImpl<$Res, BrandState>;
  @useResult
  $Res call({bool isLoading, List<Brand> brands});
}

/// @nodoc
class _$BrandStateCopyWithImpl<$Res, $Val extends BrandState>
    implements $BrandStateCopyWith<$Res> {
  _$BrandStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? brands = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      brands: null == brands
          ? _value.brands
          : brands // ignore: cast_nullable_to_non_nullable
              as List<Brand>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BrandStateImplCopyWith<$Res>
    implements $BrandStateCopyWith<$Res> {
  factory _$$BrandStateImplCopyWith(
          _$BrandStateImpl value, $Res Function(_$BrandStateImpl) then) =
      __$$BrandStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<Brand> brands});
}

/// @nodoc
class __$$BrandStateImplCopyWithImpl<$Res>
    extends _$BrandStateCopyWithImpl<$Res, _$BrandStateImpl>
    implements _$$BrandStateImplCopyWith<$Res> {
  __$$BrandStateImplCopyWithImpl(
      _$BrandStateImpl _value, $Res Function(_$BrandStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? brands = null,
  }) {
    return _then(_$BrandStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      brands: null == brands
          ? _value._brands
          : brands // ignore: cast_nullable_to_non_nullable
              as List<Brand>,
    ));
  }
}

/// @nodoc

class _$BrandStateImpl extends _BrandState {
  const _$BrandStateImpl(
      {this.isLoading = false, final List<Brand> brands = const []})
      : _brands = brands,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  final List<Brand> _brands;
  @override
  @JsonKey()
  List<Brand> get brands {
    if (_brands is EqualUnmodifiableListView) return _brands;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_brands);
  }

  @override
  String toString() {
    return 'BrandState(isLoading: $isLoading, brands: $brands)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BrandStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._brands, _brands));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, const DeepCollectionEquality().hash(_brands));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BrandStateImplCopyWith<_$BrandStateImpl> get copyWith =>
      __$$BrandStateImplCopyWithImpl<_$BrandStateImpl>(this, _$identity);
}

abstract class _BrandState extends BrandState {
  const factory _BrandState({final bool isLoading, final List<Brand> brands}) =
      _$BrandStateImpl;
  const _BrandState._() : super._();

  @override
  bool get isLoading;
  @override
  List<Brand> get brands;
  @override
  @JsonKey(ignore: true)
  _$$BrandStateImplCopyWith<_$BrandStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
