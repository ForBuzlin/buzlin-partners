import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'accepted_orders_state.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

class AcceptedOrdersNotifier extends StateNotifier<AcceptedOrdersState> {
  final OrdersFacade _ordersRepository;
  int _page = 0;
  bool _hasMore = true;

  AcceptedOrdersNotifier(this._ordersRepository)
      : super(const AcceptedOrdersState());

  Future<void> fetchAcceptedOrders({
    RefreshController? refreshController,
    bool isRefresh = false,
    Function(int)? updateTotal,
    String? from,
    String? to,
    String? deliveryType,
    String? paymentStatus,
    int? paymentId,
    List<int>? paymentIds,
  }) async {
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
    final response = await _ordersRepository.getOrders(
      status: OrderStatus.accepted,
      page: ++_page,
      from: from,
      to: to,
      deliveryType: deliveryType,
      paymentId: paymentId,
      paymentIds: paymentIds,
      paymentStatus: paymentStatus,
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
          updateTotal?.call(data.meta?.total ?? 0);
        } else {
          state = state.copyWith(
            orders: orders,
            totalCount: data.meta?.total ?? 0,
          );
          updateTotal?.call(data.meta?.total ?? 0);
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
