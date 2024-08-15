// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FilterState {
  bool get isLoading => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  FilterResponse? get filter => throw _privateConstructorUsedError;
  Price? get filterPrices => throw _privateConstructorUsedError;
  List<int>? get extras => throw _privateConstructorUsedError;
  List<int>? get categories => throw _privateConstructorUsedError;
  List<int>? get brands => throw _privateConstructorUsedError;
  List<int> get prices => throw _privateConstructorUsedError;
  RangeValues? get rangeValues => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FilterStateCopyWith<FilterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterStateCopyWith<$Res> {
  factory $FilterStateCopyWith(
          FilterState value, $Res Function(FilterState) then) =
      _$FilterStateCopyWithImpl<$Res, FilterState>;
  @useResult
  $Res call(
      {bool isLoading,
      String type,
      FilterResponse? filter,
      Price? filterPrices,
      List<int>? extras,
      List<int>? categories,
      List<int>? brands,
      List<int> prices,
      RangeValues? rangeValues});
}

/// @nodoc
class _$FilterStateCopyWithImpl<$Res, $Val extends FilterState>
    implements $FilterStateCopyWith<$Res> {
  _$FilterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? type = null,
    Object? filter = freezed,
    Object? filterPrices = freezed,
    Object? extras = freezed,
    Object? categories = freezed,
    Object? brands = freezed,
    Object? prices = null,
    Object? rangeValues = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      filter: freezed == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as FilterResponse?,
      filterPrices: freezed == filterPrices
          ? _value.filterPrices
          : filterPrices // ignore: cast_nullable_to_non_nullable
              as Price?,
      extras: freezed == extras
          ? _value.extras
          : extras // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      categories: freezed == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      brands: freezed == brands
          ? _value.brands
          : brands // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      prices: null == prices
          ? _value.prices
          : prices // ignore: cast_nullable_to_non_nullable
              as List<int>,
      rangeValues: freezed == rangeValues
          ? _value.rangeValues
          : rangeValues // ignore: cast_nullable_to_non_nullable
              as RangeValues?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FilterStateImplCopyWith<$Res>
    implements $FilterStateCopyWith<$Res> {
  factory _$$FilterStateImplCopyWith(
          _$FilterStateImpl value, $Res Function(_$FilterStateImpl) then) =
      __$$FilterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      String type,
      FilterResponse? filter,
      Price? filterPrices,
      List<int>? extras,
      List<int>? categories,
      List<int>? brands,
      List<int> prices,
      RangeValues? rangeValues});
}

/// @nodoc
class __$$FilterStateImplCopyWithImpl<$Res>
    extends _$FilterStateCopyWithImpl<$Res, _$FilterStateImpl>
    implements _$$FilterStateImplCopyWith<$Res> {
  __$$FilterStateImplCopyWithImpl(
      _$FilterStateImpl _value, $Res Function(_$FilterStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? type = null,
    Object? filter = freezed,
    Object? filterPrices = freezed,
    Object? extras = freezed,
    Object? categories = freezed,
    Object? brands = freezed,
    Object? prices = null,
    Object? rangeValues = freezed,
  }) {
    return _then(_$FilterStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      filter: freezed == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as FilterResponse?,
      filterPrices: freezed == filterPrices
          ? _value.filterPrices
          : filterPrices // ignore: cast_nullable_to_non_nullable
              as Price?,
      extras: freezed == extras
          ? _value._extras
          : extras // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      categories: freezed == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      brands: freezed == brands
          ? _value._brands
          : brands // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      prices: null == prices
          ? _value._prices
          : prices // ignore: cast_nullable_to_non_nullable
              as List<int>,
      rangeValues: freezed == rangeValues
          ? _value.rangeValues
          : rangeValues // ignore: cast_nullable_to_non_nullable
              as RangeValues?,
    ));
  }
}

/// @nodoc

class _$FilterStateImpl implements _FilterState {
  const _$FilterStateImpl(
      {this.isLoading = true,
      this.type = "category",
      this.filter = null,
      this.filterPrices = null,
      final List<int>? extras = const [],
      final List<int>? categories = const [],
      final List<int>? brands = const [],
      final List<int> prices = const [],
      this.rangeValues = null})
      : _extras = extras,
        _categories = categories,
        _brands = brands,
        _prices = prices;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String type;
  @override
  @JsonKey()
  final FilterResponse? filter;
  @override
  @JsonKey()
  final Price? filterPrices;
  final List<int>? _extras;
  @override
  @JsonKey()
  List<int>? get extras {
    final value = _extras;
    if (value == null) return null;
    if (_extras is EqualUnmodifiableListView) return _extras;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<int>? _categories;
  @override
  @JsonKey()
  List<int>? get categories {
    final value = _categories;
    if (value == null) return null;
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<int>? _brands;
  @override
  @JsonKey()
  List<int>? get brands {
    final value = _brands;
    if (value == null) return null;
    if (_brands is EqualUnmodifiableListView) return _brands;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<int> _prices;
  @override
  @JsonKey()
  List<int> get prices {
    if (_prices is EqualUnmodifiableListView) return _prices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_prices);
  }

  @override
  @JsonKey()
  final RangeValues? rangeValues;

  @override
  String toString() {
    return 'FilterState(isLoading: $isLoading, type: $type, filter: $filter, filterPrices: $filterPrices, extras: $extras, categories: $categories, brands: $brands, prices: $prices, rangeValues: $rangeValues)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.filter, filter) || other.filter == filter) &&
            (identical(other.filterPrices, filterPrices) ||
                other.filterPrices == filterPrices) &&
            const DeepCollectionEquality().equals(other._extras, _extras) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality().equals(other._brands, _brands) &&
            const DeepCollectionEquality().equals(other._prices, _prices) &&
            (identical(other.rangeValues, rangeValues) ||
                other.rangeValues == rangeValues));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      type,
      filter,
      filterPrices,
      const DeepCollectionEquality().hash(_extras),
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_brands),
      const DeepCollectionEquality().hash(_prices),
      rangeValues);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterStateImplCopyWith<_$FilterStateImpl> get copyWith =>
      __$$FilterStateImplCopyWithImpl<_$FilterStateImpl>(this, _$identity);
}

abstract class _FilterState implements FilterState {
  const factory _FilterState(
      {final bool isLoading,
      final String type,
      final FilterResponse? filter,
      final Price? filterPrices,
      final List<int>? extras,
      final List<int>? categories,
      final List<int>? brands,
      final List<int> prices,
      final RangeValues? rangeValues}) = _$FilterStateImpl;

  @override
  bool get isLoading;
  @override
  String get type;
  @override
  FilterResponse? get filter;
  @override
  Price? get filterPrices;
  @override
  List<int>? get extras;
  @override
  List<int>? get categories;
  @override
  List<int>? get brands;
  @override
  List<int> get prices;
  @override
  RangeValues? get rangeValues;
  @override
  @JsonKey(ignore: true)
  _$$FilterStateImplCopyWith<_$FilterStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
