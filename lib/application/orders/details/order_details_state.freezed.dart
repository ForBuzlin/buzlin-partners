// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OrderDetailsState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isUpdating => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  Stocks? get oldStocks => throw _privateConstructorUsedError;
  Stocks? get stocks => throw _privateConstructorUsedError;
  OrderData? get order => throw _privateConstructorUsedError;
  StockReplaceData? get replaceData => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderDetailsStateCopyWith<OrderDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDetailsStateCopyWith<$Res> {
  factory $OrderDetailsStateCopyWith(
          OrderDetailsState value, $Res Function(OrderDetailsState) then) =
      _$OrderDetailsStateCopyWithImpl<$Res, OrderDetailsState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isUpdating,
      String? phone,
      Stocks? oldStocks,
      Stocks? stocks,
      OrderData? order,
      StockReplaceData? replaceData,
      int quantity});
}

/// @nodoc
class _$OrderDetailsStateCopyWithImpl<$Res, $Val extends OrderDetailsState>
    implements $OrderDetailsStateCopyWith<$Res> {
  _$OrderDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isUpdating = null,
    Object? phone = freezed,
    Object? oldStocks = freezed,
    Object? stocks = freezed,
    Object? order = freezed,
    Object? replaceData = freezed,
    Object? quantity = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdating: null == isUpdating
          ? _value.isUpdating
          : isUpdating // ignore: cast_nullable_to_non_nullable
              as bool,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      oldStocks: freezed == oldStocks
          ? _value.oldStocks
          : oldStocks // ignore: cast_nullable_to_non_nullable
              as Stocks?,
      stocks: freezed == stocks
          ? _value.stocks
          : stocks // ignore: cast_nullable_to_non_nullable
              as Stocks?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as OrderData?,
      replaceData: freezed == replaceData
          ? _value.replaceData
          : replaceData // ignore: cast_nullable_to_non_nullable
              as StockReplaceData?,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderDetailsStateImplCopyWith<$Res>
    implements $OrderDetailsStateCopyWith<$Res> {
  factory _$$OrderDetailsStateImplCopyWith(_$OrderDetailsStateImpl value,
          $Res Function(_$OrderDetailsStateImpl) then) =
      __$$OrderDetailsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isUpdating,
      String? phone,
      Stocks? oldStocks,
      Stocks? stocks,
      OrderData? order,
      StockReplaceData? replaceData,
      int quantity});
}

/// @nodoc
class __$$OrderDetailsStateImplCopyWithImpl<$Res>
    extends _$OrderDetailsStateCopyWithImpl<$Res, _$OrderDetailsStateImpl>
    implements _$$OrderDetailsStateImplCopyWith<$Res> {
  __$$OrderDetailsStateImplCopyWithImpl(_$OrderDetailsStateImpl _value,
      $Res Function(_$OrderDetailsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isUpdating = null,
    Object? phone = freezed,
    Object? oldStocks = freezed,
    Object? stocks = freezed,
    Object? order = freezed,
    Object? replaceData = freezed,
    Object? quantity = null,
  }) {
    return _then(_$OrderDetailsStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdating: null == isUpdating
          ? _value.isUpdating
          : isUpdating // ignore: cast_nullable_to_non_nullable
              as bool,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      oldStocks: freezed == oldStocks
          ? _value.oldStocks
          : oldStocks // ignore: cast_nullable_to_non_nullable
              as Stocks?,
      stocks: freezed == stocks
          ? _value.stocks
          : stocks // ignore: cast_nullable_to_non_nullable
              as Stocks?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as OrderData?,
      replaceData: freezed == replaceData
          ? _value.replaceData
          : replaceData // ignore: cast_nullable_to_non_nullable
              as StockReplaceData?,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$OrderDetailsStateImpl extends _OrderDetailsState {
  const _$OrderDetailsStateImpl(
      {this.isLoading = false,
      this.isUpdating = false,
      this.phone = null,
      this.oldStocks = null,
      this.stocks = null,
      this.order = null,
      this.replaceData = null,
      this.quantity = 0})
      : super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isUpdating;
  @override
  @JsonKey()
  final String? phone;
  @override
  @JsonKey()
  final Stocks? oldStocks;
  @override
  @JsonKey()
  final Stocks? stocks;
  @override
  @JsonKey()
  final OrderData? order;
  @override
  @JsonKey()
  final StockReplaceData? replaceData;
  @override
  @JsonKey()
  final int quantity;

  @override
  String toString() {
    return 'OrderDetailsState(isLoading: $isLoading, isUpdating: $isUpdating, phone: $phone, oldStocks: $oldStocks, stocks: $stocks, order: $order, replaceData: $replaceData, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderDetailsStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isUpdating, isUpdating) ||
                other.isUpdating == isUpdating) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.oldStocks, oldStocks) ||
                other.oldStocks == oldStocks) &&
            (identical(other.stocks, stocks) || other.stocks == stocks) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.replaceData, replaceData) ||
                other.replaceData == replaceData) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isUpdating, phone,
      oldStocks, stocks, order, replaceData, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderDetailsStateImplCopyWith<_$OrderDetailsStateImpl> get copyWith =>
      __$$OrderDetailsStateImplCopyWithImpl<_$OrderDetailsStateImpl>(
          this, _$identity);
}

abstract class _OrderDetailsState extends OrderDetailsState {
  const factory _OrderDetailsState(
      {final bool isLoading,
      final bool isUpdating,
      final String? phone,
      final Stocks? oldStocks,
      final Stocks? stocks,
      final OrderData? order,
      final StockReplaceData? replaceData,
      final int quantity}) = _$OrderDetailsStateImpl;
  const _OrderDetailsState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isUpdating;
  @override
  String? get phone;
  @override
  Stocks? get oldStocks;
  @override
  Stocks? get stocks;
  @override
  OrderData? get order;
  @override
  StockReplaceData? get replaceData;
  @override
  int get quantity;
  @override
  @JsonKey(ignore: true)
  _$$OrderDetailsStateImplCopyWith<_$OrderDetailsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
