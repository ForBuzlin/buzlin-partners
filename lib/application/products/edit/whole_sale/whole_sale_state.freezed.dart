// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'whole_sale_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WholeSaleState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSaving => throw _privateConstructorUsedError;
  List<Stocks> get stocks => throw _privateConstructorUsedError;
  ProductData? get product => throw _privateConstructorUsedError;
  List<GlobalKey<FormState>> get formKeys => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WholeSaleStateCopyWith<WholeSaleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WholeSaleStateCopyWith<$Res> {
  factory $WholeSaleStateCopyWith(
          WholeSaleState value, $Res Function(WholeSaleState) then) =
      _$WholeSaleStateCopyWithImpl<$Res, WholeSaleState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isSaving,
      List<Stocks> stocks,
      ProductData? product,
      List<GlobalKey<FormState>> formKeys});
}

/// @nodoc
class _$WholeSaleStateCopyWithImpl<$Res, $Val extends WholeSaleState>
    implements $WholeSaleStateCopyWith<$Res> {
  _$WholeSaleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSaving = null,
    Object? stocks = null,
    Object? product = freezed,
    Object? formKeys = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaving: null == isSaving
          ? _value.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
      stocks: null == stocks
          ? _value.stocks
          : stocks // ignore: cast_nullable_to_non_nullable
              as List<Stocks>,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductData?,
      formKeys: null == formKeys
          ? _value.formKeys
          : formKeys // ignore: cast_nullable_to_non_nullable
              as List<GlobalKey<FormState>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WholeSaleStateImplCopyWith<$Res>
    implements $WholeSaleStateCopyWith<$Res> {
  factory _$$WholeSaleStateImplCopyWith(_$WholeSaleStateImpl value,
          $Res Function(_$WholeSaleStateImpl) then) =
      __$$WholeSaleStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isSaving,
      List<Stocks> stocks,
      ProductData? product,
      List<GlobalKey<FormState>> formKeys});
}

/// @nodoc
class __$$WholeSaleStateImplCopyWithImpl<$Res>
    extends _$WholeSaleStateCopyWithImpl<$Res, _$WholeSaleStateImpl>
    implements _$$WholeSaleStateImplCopyWith<$Res> {
  __$$WholeSaleStateImplCopyWithImpl(
      _$WholeSaleStateImpl _value, $Res Function(_$WholeSaleStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSaving = null,
    Object? stocks = null,
    Object? product = freezed,
    Object? formKeys = null,
  }) {
    return _then(_$WholeSaleStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaving: null == isSaving
          ? _value.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
      stocks: null == stocks
          ? _value._stocks
          : stocks // ignore: cast_nullable_to_non_nullable
              as List<Stocks>,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductData?,
      formKeys: null == formKeys
          ? _value._formKeys
          : formKeys // ignore: cast_nullable_to_non_nullable
              as List<GlobalKey<FormState>>,
    ));
  }
}

/// @nodoc

class _$WholeSaleStateImpl extends _WholeSaleState {
  const _$WholeSaleStateImpl(
      {this.isLoading = false,
      this.isSaving = false,
      final List<Stocks> stocks = const [],
      this.product = null,
      final List<GlobalKey<FormState>> formKeys = const []})
      : _stocks = stocks,
        _formKeys = formKeys,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isSaving;
  final List<Stocks> _stocks;
  @override
  @JsonKey()
  List<Stocks> get stocks {
    if (_stocks is EqualUnmodifiableListView) return _stocks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stocks);
  }

  @override
  @JsonKey()
  final ProductData? product;
  final List<GlobalKey<FormState>> _formKeys;
  @override
  @JsonKey()
  List<GlobalKey<FormState>> get formKeys {
    if (_formKeys is EqualUnmodifiableListView) return _formKeys;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_formKeys);
  }

  @override
  String toString() {
    return 'WholeSaleState(isLoading: $isLoading, isSaving: $isSaving, stocks: $stocks, product: $product, formKeys: $formKeys)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WholeSaleStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSaving, isSaving) ||
                other.isSaving == isSaving) &&
            const DeepCollectionEquality().equals(other._stocks, _stocks) &&
            (identical(other.product, product) || other.product == product) &&
            const DeepCollectionEquality().equals(other._formKeys, _formKeys));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isSaving,
      const DeepCollectionEquality().hash(_stocks),
      product,
      const DeepCollectionEquality().hash(_formKeys));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WholeSaleStateImplCopyWith<_$WholeSaleStateImpl> get copyWith =>
      __$$WholeSaleStateImplCopyWithImpl<_$WholeSaleStateImpl>(
          this, _$identity);
}

abstract class _WholeSaleState extends WholeSaleState {
  const factory _WholeSaleState(
      {final bool isLoading,
      final bool isSaving,
      final List<Stocks> stocks,
      final ProductData? product,
      final List<GlobalKey<FormState>> formKeys}) = _$WholeSaleStateImpl;
  const _WholeSaleState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isSaving;
  @override
  List<Stocks> get stocks;
  @override
  ProductData? get product;
  @override
  List<GlobalKey<FormState>> get formKeys;
  @override
  @JsonKey(ignore: true)
  _$$WholeSaleStateImplCopyWith<_$WholeSaleStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
