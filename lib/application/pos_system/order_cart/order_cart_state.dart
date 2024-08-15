import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

part 'order_cart_state.freezed.dart';

@freezed
class OrderCartState with _$OrderCartState {
  const factory OrderCartState({
    @Default(0) num totalPrice,
    @Default(false) bool isBagsLoading,
    @Default(false) bool isUsersLoading,
    @Default(false) bool isUserDetailsLoading,
    @Default(false) bool isCurrenciesLoading,
    @Default(false) bool isPaymentsLoading,
    @Default(false) bool isProductCalculateLoading,
    @Default(false) bool isButtonLoading,
    @Default(false) bool isActive,
    @Default(false) bool isOrderLoading,
    @Default(false) bool isCouponLoading,
    @Default([]) List<BagData> bags,
    @Default([]) List<UserData> users,
    @Default([]) List<CurrencyData> currencies,
    @Default([]) List<PaymentData> payments,
    @Default(0) int selectedBagIndex,
    @Default('') String orderType,
    @Default('') String comment,
    @Default(null) String? selectUserError,
    @Default(null) String? selectAddressError,
    @Default(null) String? selectCurrencyError,
    @Default(null) String? selectPaymentError,
    @Default(null) String? coupon,
    @Default(null) CouponData? checkedCoupon,
    @Default(null) DateTime? orderDate,
    @Default(null) TimeOfDay? orderTime,
    UserData? selectedUser,
    AddressData? selectedAddress,
    PickupAddress? pickupAddress,
    MyAddress? deliveryAddress,
    CurrencyData? selectedCurrency,
    PaymentData? selectedPayment,
    PriceData? paginateResponse,
    DeliveryPointsData? deliveryPrice,
  }) = _OrderCartState;

  const OrderCartState._();
}
