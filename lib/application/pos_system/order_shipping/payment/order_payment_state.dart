import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:venderuzmart/infrastructure/models/models.dart';

part 'order_payment_state.freezed.dart';

@freezed
class OrderPaymentState with _$OrderPaymentState {
  const factory OrderPaymentState({
    @Default(false) bool isLoading,
    @Default(false) bool isCalculateLoading,
    @Default([]) List<PaymentData> payments,
    @Default(0) int selectedIndex,
    PriceData? orderCalculate,
    CurrencyData? selectedCurrency,
    @Default([]) List<CurrencyData> currencies,
    @Default(false) bool isCurrenciesLoading,
  }) = _OrderPaymentState;

  const OrderPaymentState._();
}
