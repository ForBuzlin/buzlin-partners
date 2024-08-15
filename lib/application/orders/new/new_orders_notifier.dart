import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/presentation/routes/app_router.dart';

import 'new_orders_state.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

class NewOrdersNotifier extends StateNotifier<NewOrdersState> {
  final OrdersFacade _ordersRepository;
  int _page = 0;
  bool _hasMore = true;

  NewOrdersNotifier(this._ordersRepository)
      : super(NewOrdersState(refreshController: RefreshController()));

  Future<void> fetchNewOrders({
    required BuildContext context,
    bool isRefresh = false,
    Function(int)? updateTotal,
    required int activeTabIndex,
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
      if (activeTabIndex == 0) {
        state.refreshController?.requestRefresh();
      }
      state.refreshController?.resetNoData();
    }
    if (!_hasMore) {
      state.refreshController?.loadNoData();
      return;
    }
    if (_page == 0 && !isRefresh) {
      state = state.copyWith(isLoading: true);
    }
    final response = await _ordersRepository.getOrders(
      status: OrderStatus.newOrder,
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
          state.refreshController?.refreshCompleted();
        } else {
          state.refreshController?.loadComplete();
        }
      },
      failure: (failure, status) {
        _page--;
        if (_page == 0) {
          state = state.copyWith(isLoading: false);
        }
        if (isRefresh) {
          state.refreshController?.refreshFailed();
        } else {
          state.refreshController?.loadFailed();
        }
        if (status == 401) {
          final GoogleSignIn signIn = GoogleSignIn();
          signIn.disconnect();
          signIn.signOut();
          LocalStorage.logout();
          context.router.popUntilRoot();
          context.replaceRoute(const AuthRoute());
        }
      },
    );
  }
}
