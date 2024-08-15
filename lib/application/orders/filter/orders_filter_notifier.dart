import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

import 'orders_filter_state.dart';

class OrdersFilterNotifier extends StateNotifier<OrdersFilterState> {
  final PaymentsFacade _paymentsRepository;

  OrdersFilterNotifier(this._paymentsRepository)
      : super(const OrdersFilterState(paymentStatus: [
          TrKeys.all,
          TrKeys.paid,
          TrKeys.notPaid,
        ], orderTypes: [
          TrKeys.all,
          TrKeys.pickup,
          TrKeys.delivery,
        ]));

  setLocalTime(List<DateTime?> selectTime) {
    state = state.copyWith(localTime: selectTime);
  }

  setTime() {
    state = state.copyWith(selectTime: state.localTime);
  }

  Future<void> fetchPayments(ValueChanged<int> onChange) async {
    if (state.payments.isNotEmpty) {
      onChange(state.payments.length);
      return;
    }
    state = state.copyWith(isLoading: true);

    final response = await _paymentsRepository.getPayments();

    response.when(
      success: (data) {
        final List<PaymentData> payments = data.data ?? [];
        List<PaymentData> filtered = [PaymentData(tag: TrKeys.all)];
        List<int> paymentIds = [];
        for (final payment in payments) {
          if (payment.tag?.toLowerCase() == 'wallet' ||
              payment.tag?.toLowerCase() == 'cash') {
            filtered.add(payment);
          } else {
            paymentIds.add(payment.id ?? 0);
          }
        }
        filtered.add(PaymentData(tag: TrKeys.other, id: -1));
        onChange(filtered.length);
        state = state.copyWith(
          payments: filtered,
          isLoading: false,
          paymentIds: paymentIds,
        );
      },
      failure: (error, status) {
        debugPrint('====> fetch payments fail $error');
        state = state.copyWith(isLoading: false);
      },
    );
  }

  clearAll() {
    if (state.selectOrderType != null ||
        state.selectPaymentType != null ||
        state.selectPaymentStatus != null || state.localTime.isNotEmpty) {
      state = state.copyWith(
        selectOrderType: null,
        selectPaymentType: null,
        selectPaymentStatus: null,
        orderTypeIndex: 0,
        paymentStatusIndex: 0,
        paymentTypeIndex: 0,
        selectTime: [],
        localTime: [],
        paymentIds: [],
      );
    }
  }

  setPaymentStatus(int value) {
    state = state.copyWith(
        selectPaymentStatus: value != 0 ? state.paymentStatus[value] : null);
    state = state.copyWith(paymentStatusIndex: value);
  }

  setPaymentType(int value) {
    state = state.copyWith(
        selectPaymentType: value != 0 ? state.payments[value].id : null);
    state = state.copyWith(paymentTypeIndex: value);
  }

  setOrderType(int value) {
    state = state.copyWith(
        selectOrderType: value != 0 ? state.orderTypes[value] : null);
    state = state.copyWith(orderTypeIndex: value);
  }
}
