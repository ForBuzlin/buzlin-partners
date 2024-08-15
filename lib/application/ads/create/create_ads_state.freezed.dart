// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_ads_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreateExtrasGroupState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<ProductData> get products => throw _privateConstructorUsedError;
  AdsPackage? get package => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateExtrasGroupStateCopyWith<CreateExtrasGroupState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateExtrasGroupStateCopyWith<$Res> {
  factory $CreateExtrasGroupStateCopyWith(CreateExtrasGroupState value,
          $Res Function(CreateExtrasGroupState) then) =
      _$CreateExtrasGroupStateCopyWithImpl<$Res, CreateExtrasGroupState>;
  @useResult
  $Res call({bool isLoading, List<ProductData> products, AdsPackage? package});
}

/// @nodoc
class _$CreateExtrasGroupStateCopyWithImpl<$Res,
        $Val extends CreateExtrasGroupState>
    implements $CreateExtrasGroupStateCopyWith<$Res> {
  _$CreateExtrasGroupStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? products = null,
    Object? package = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductData>,
      package: freezed == package
          ? _value.package
          : package // ignore: cast_nullable_to_non_nullable
              as AdsPackage?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateExtrasGroupStateImplCopyWith<$Res>
    implements $CreateExtrasGroupStateCopyWith<$Res> {
  factory _$$CreateExtrasGroupStateImplCopyWith(
          _$CreateExtrasGroupStateImpl value,
          $Res Function(_$CreateExtrasGroupStateImpl) then) =
      __$$CreateExtrasGroupStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<ProductData> products, AdsPackage? package});
}

/// @nodoc
class __$$CreateExtrasGroupStateImplCopyWithImpl<$Res>
    extends _$CreateExtrasGroupStateCopyWithImpl<$Res,
        _$CreateExtrasGroupStateImpl>
    implements _$$CreateExtrasGroupStateImplCopyWith<$Res> {
  __$$CreateExtrasGroupStateImplCopyWithImpl(
      _$CreateExtrasGroupStateImpl _value,
      $Res Function(_$CreateExtrasGroupStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? products = null,
    Object? package = freezed,
  }) {
    return _then(_$CreateExtrasGroupStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductData>,
      package: freezed == package
          ? _value.package
          : package // ignore: cast_nullable_to_non_nullable
              as AdsPackage?,
    ));
  }
}

/// @nodoc

class _$CreateExtrasGroupStateImpl extends _CreateExtrasGroupState {
  const _$CreateExtrasGroupStateImpl(
      {this.isLoading = false,
      final List<ProductData> products = const [],
      this.package = null})
      : _products = products,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  final List<ProductData> _products;
  @override
  @JsonKey()
  List<ProductData> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  @JsonKey()
  final AdsPackage? package;

  @override
  String toString() {
    return 'CreateExtrasGroupState(isLoading: $isLoading, products: $products, package: $package)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateExtrasGroupStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.package, package) || other.package == package));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading,
      const DeepCollectionEquality().hash(_products), package);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateExtrasGroupStateImplCopyWith<_$CreateExtrasGroupStateImpl>
      get copyWith => __$$CreateExtrasGroupStateImplCopyWithImpl<
          _$CreateExtrasGroupStateImpl>(this, _$identity);
}

abstract class _CreateExtrasGroupState extends CreateExtrasGroupState {
  const factory _CreateExtrasGroupState(
      {final bool isLoading,
      final List<ProductData> products,
      final AdsPackage? package}) = _$CreateExtrasGroupStateImpl;
  const _CreateExtrasGroupState._() : super._();

  @override
  bool get isLoading;
  @override
  List<ProductData> get products;
  @override
  AdsPackage? get package;
  @override
  @JsonKey(ignore: true)
  _$$CreateExtrasGroupStateImplCopyWith<_$CreateExtrasGroupStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
