import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'today_orders_state.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

class TodayOrdersNotifier extends StateNotifier<TodayOrdersState> {
  final OrdersFacade _ordersRepository;

  TodayOrdersNotifier(this._ordersRepository) : super(const TodayOrdersState());

  Future<void> fetchTodayOrders() async {
    state = state.copyWith(isLoading: true);

    final date = DateTime.now().toString().substring(0, 10);
    final response = await _ordersRepository.getOrders(from: date, to: date);
    response.when(
      success: (data) {
        final List<OrderData> orders = data.data ?? [];
        OrderData? lastOrder;
        if (orders.isNotEmpty) {
          lastOrder = orders.first;
        }
        state = state.copyWith(
          lastOrder: lastOrder,
          todayOrders: orders,
          isLoading: false,
        );
      },
      failure: (failure, status) {
        state = state.copyWith(isLoading: false);
        debugPrint('==> error order statistics $failure');
      },
    );
  }
}
