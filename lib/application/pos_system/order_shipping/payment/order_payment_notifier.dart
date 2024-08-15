import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:venderuzmart/infrastructure/services/services.dart';
import 'order_payment_state.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

class OrderPaymentNotifier extends StateNotifier<OrderPaymentState> {
  final OrdersFacade _ordersRepository;
  final SettingsFacade _settingsRepository;
  final PaymentsFacade _paymentsRepository;

  OrderPaymentNotifier(this._ordersRepository, this._settingsRepository,
      this._paymentsRepository)
      : super(const OrderPaymentState());

  void setSelectedIndex(int index) {
    state = state.copyWith(selectedIndex: index);
  }

  void clearSelectedPaymentInfo() {
    state = state.copyWith(selectedIndex: 0);
  }

  void setSelectedPayment(int index) {
    state = state.copyWith(selectedIndex: index);
  }

  Future<void> fetchPayments() async {
    if (state.payments.isNotEmpty) {
      return;
    }
    state = state.copyWith(isLoading: true);
    final response = await _paymentsRepository.getPayments();
    response.when(
      success: (data) {
        final List<PaymentData> payments = data.data ?? [];
        List<PaymentData> filtered = [];
        for (final payment in payments) {
          if (payment.tag?.toLowerCase() == 'wallet' ||
              payment.tag?.toLowerCase() == 'cash') {
            filtered.add(payment);
          }
        }
        state = state.copyWith(
          payments: filtered,
          selectedIndex: 0,
          isLoading: false,
        );
      },
      failure: (error, status) {
        debugPrint('====> fetch payments fail $error');
        state = state.copyWith(isLoading: false);
      },
    );
  }

  Future<void> createTransaction(BuildContext context, int orderId,
      int? paymentId, VoidCallback success) async {
    var response = await _ordersRepository.createTransaction(
        orderId: orderId, paymentId: paymentId ?? 0);
    response.when(
      success: (data) {
        success.call();
      },
      failure: (error, status) {
        debugPrint('====> fetch payments fail $error');
       AppHelpers.errorSnackBar(context, text: error);
      },
    );
  }

  Future<void> getCalculate({
    required BagData bagData,
    required String type,
    int? deliveryPriceId,
  }) async {
    state = state.copyWith(isCalculateLoading: true);
    if (bagData.bagProducts?.isEmpty ?? true) {
      return;
    }
    final response = await _ordersRepository.getAllCalculations(
      bagData,
      type,
      deliveryPriceId: deliveryPriceId,
    );
    response.when(
      success: (data) {
        if (type == TrKeys.delivery) {
          state = state.copyWith(
            orderCalculate: data.data?.copyWith(
                deliveryFee: bagData.deliveryAddress?.deliveryPrice?.price,
                totalPrice: (data.data?.totalPrice ?? 0) +
                    (bagData.deliveryAddress?.deliveryPrice?.price ?? 0)),
            isCalculateLoading: false,
          );
        } else {
          state = state.copyWith(
            orderCalculate: data.data,
            isCalculateLoading: false,
          );
        }
      },
      failure: (error, status) {
        debugPrint('====> get calculate fail $error');
        state = state.copyWith(isCalculateLoading: false);
      },
    );
  }

  Future<void> fetchCurrencies(CurrencyData? initial,
      {VoidCallback? checkYourNetwork}) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isCurrenciesLoading: true, currencies: []);
      final response = await _settingsRepository.getCurrencies();
      response.when(
        success: (data) async {
          state = state.copyWith(
              isCurrenciesLoading: false,
              currencies: data.data ?? [],
              selectedCurrency: initial ??
                  (data.data?.isEmpty ?? true ? null : data.data?.first));
        },
        failure: (failure, status) {
          state = state.copyWith(isCurrenciesLoading: false);
          debugPrint('==> get currencies failure: $failure');
        },
      );
    } else {
      checkYourNetwork?.call();
    }
  }

  void setSelectedCurrency(int? currencyId, int index,
      {VoidCallback? success}) {
    final List<BagData> bags = List.from(LocalStorage.getBags());
    CurrencyData? currencyData;
    for (final currency in state.currencies) {
      if (currencyId == currency.id) {
        currencyData = currency;
        break;
      }
    }
    final BagData bag = bags[index].copyWith(selectedCurrency: currencyData);
    bags[index] = bag;
    LocalStorage.setBags(bags);
    state = state.copyWith(selectedCurrency: currencyData);
    success?.call();
  }
}
