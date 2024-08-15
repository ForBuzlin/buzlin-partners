import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

part 'order_details_state.freezed.dart';

@freezed
class OrderDetailsState with _$OrderDetailsState {
  const factory OrderDetailsState({
    @Default(false) bool isLoading,
    @Default(false) bool isUpdating,
    @Default(null) String? phone,
    @Default(null) Stocks? oldStocks,
    @Default(null) Stocks? stocks,
    @Default(null) OrderData? order,
    @Default(null) StockReplaceData? replaceData,
    @Default(0) int quantity,
  }) = _OrderDetailsState;

  const OrderDetailsState._();
}
