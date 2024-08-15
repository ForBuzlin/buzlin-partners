import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

import 'order_state.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

class OrderNotifier extends StateNotifier<OrderState> {
  final OrdersFacade _ordersRepository;
  int _page = 0;
  bool _hasMore = true;

  OrderNotifier(this._ordersRepository) : super(const OrderState());

  void changeDeliveryType(int index) {
    state = state.copyWith(deliveryType: index);
  }

  void changeDeliveryTime(int index) {
    state = state.copyWith(deliveryTime: index);
  }

  void changePaymentType(bool isActive) {
    state = state.copyWith(paymentType: isActive);
  }

  Future<void> fetchHistoryOrders(
      {RefreshController? refreshController,
      bool isRefresh = false,
      DateTime? start,
      DateTime? end}) async {
    if (isRefresh) {
      _page = 0;
      _hasMore = true;
      refreshController?.requestRefresh();
    }
    if (!_hasMore) {
      refreshController?.loadNoData();
      return;
    }
    if (_page == 0 && !isRefresh) {
      state = state.copyWith(isLoading: true);
    }
    final response = await _ordersRepository.getHistoryOrders(
      page: ++_page,
      to: start != null ? DateService.dateFormatDay(start) : null,
      from: end != null ? DateService.dateFormatDay(end) : null,
    );
    response.when(
      success: (data) {
        List<OrderData> orders = isRefresh ? [] : List.from(state.orders);
        final List<OrderData> newOrders = data.data ?? [];
        orders.addAll(newOrders);
        _hasMore = newOrders.length >= 10;
        if (_page == 1 && !isRefresh) {
          state = state.copyWith(
            isLoading: false,
            orders: orders,
            totalCount: data.meta?.total ?? 0,
          );
        } else {
          state = state.copyWith(
            orders: orders,
            totalCount: data.meta?.total ?? 0,
          );
        }
        if (isRefresh) {
          refreshController?.refreshCompleted();
        } else {
          refreshController?.loadComplete();
        }
      },
      failure: (failure, status) {
        _page--;
        if (_page == 0) {
          state = state.copyWith(isLoading: false);
        }
        if (isRefresh) {
          refreshController?.refreshFailed();
        } else {
          refreshController?.loadFailed();
        }
      },
    );
  }
}
