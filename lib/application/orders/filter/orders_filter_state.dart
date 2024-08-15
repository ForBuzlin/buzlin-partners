import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

part 'orders_filter_state.freezed.dart';

@freezed
class OrdersFilterState with _$OrdersFilterState {
  const factory OrdersFilterState({
    @Default(false) bool isLoading,
    @Default([]) List<DateTime?> selectTime,
    @Default([]) List<DateTime?> localTime,
    @Default(0) int orderTypeIndex,
    @Default(0) int paymentStatusIndex,
    @Default(0) int paymentTypeIndex,
    @Default(null) String? selectOrderType,
    @Default(null) String? selectPaymentStatus,
    @Default(null) int? selectPaymentType,
    @Default([]) List<int> paymentIds,
    @Default([]) List<PaymentData> payments,
    @Default([]) List<String> paymentStatus,
    @Default([]) List<String> orderTypes,
  }) = _OrdersFilterState;

  const OrdersFilterState._();
}
