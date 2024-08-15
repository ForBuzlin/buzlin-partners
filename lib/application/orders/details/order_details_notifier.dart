import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

import 'order_details_state.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';

class OrderDetailsNotifier extends StateNotifier<OrderDetailsState> {
  final OrdersFacade _ordersRepository;

  OrderDetailsNotifier(this._ordersRepository)
      : super(const OrderDetailsState());

  Future<void> updateOrderStatus(
    BuildContext context, {
    required OrderStatus status,
    VoidCallback? success,
  }) async {
    state = state.copyWith(isUpdating: true);
    final response = await _ordersRepository.updateOrderStatus(
      status: status,
      orderId: state.order?.id,
    );
    response.when(
      success: (data) {
        state = state.copyWith(isUpdating: false);
        success?.call();
      },
      failure: (failure, status) {
        debugPrint('===> update order status fail $failure');
        state = state.copyWith(isUpdating: false);
        AppHelpers.errorSnackBar(context, text: failure);
      },
    );
  }

  Future<void> updateOrderTracking(
    BuildContext context, {
    required String name,
    required String id,
    String? url,
    VoidCallback? success,
  }) async {
    state = state.copyWith(isUpdating: true);
    final response = await _ordersRepository.updateOrderTracking(
      name: name,
      id: id,
      url: url,
      orderId:  state.order?.id,
    );
    response.when(
      success: (data) {
        state = state.copyWith(isUpdating: false);
        success?.call();
      },
      failure: (failure, status) {
        debugPrint('===> update order tracking fail $failure');
        state = state.copyWith(isUpdating: false);
        AppHelpers.errorSnackBar(context, text: failure);
      },
    );
  }

  setOldStock(Stocks? stocks) {
    return state = state.copyWith(oldStocks: stocks, stocks: null);
  }

  setNewStock(Stocks? stocks) => state = state.copyWith(stocks: stocks);

  setPhone(String? phone) => state = state.copyWith(phone: phone);

  setQuantity(int quantity) => state = state.copyWith(quantity: quantity);

  Future<void> replaceStock(
    BuildContext context, {
    required String note,
    VoidCallback? success,
  }) async {
    state = state.copyWith(isUpdating: true);
    final response = await _ordersRepository.updateOrder(
      order: state.order,
      replaceData: StockReplaceData(
        stockId: state.stocks?.id,
        quantity: state.quantity,
        replaceStockId: state.oldStocks?.stockId,
        replaceQuantity: state.oldStocks?.quantity,
        replaceNote: note,
      ),

      currencyId: state.order?.currency?.id,
      phone: state.phone,
    );
    response.when(
      success: (data) {
        state = state.copyWith(isUpdating: false);
        success?.call();
      },
      failure: (failure, status) {
        debugPrint('===> replace stock fail $failure');
        state = state.copyWith(isUpdating: false);
        AppHelpers.errorSnackBar(context, text: failure);
      },
    );
  }

  void toggleOrderDetailChecked({required int index}) {
    List<Stocks>? stocks =
        (state.order?.details?.isNotEmpty ?? false) ? state.order?.details : [];
    if (stocks == null || stocks.isEmpty) {
      return;
    }
    Stocks stock = stocks[index];
    final bool isChecked = stock.isChecked ?? false;
    stock = stock.copyWith(isChecked: !isChecked);
    stocks[index] = stock;
    final order = state.order?.copyWith(details: stocks);
    state = state.copyWith(order: order);
  }

  Future<void> fetchOrderDetails({OrderData? order, ValueChanged<OrderData?>? onSuccess}) async {
    state = state.copyWith(isLoading: true, order: order, phone: null);
    final response =
        await _ordersRepository.getOrderDetails(orderId: order?.id);
    response.when(
      success: (data) {
        state = state.copyWith(isLoading: false, order: data.data);
        onSuccess?.call(data.data);
      },
      failure: (failure, status) {
        debugPrint('===> fetch order details fail $failure');
        state = state.copyWith(isLoading: false);
      },
    );
  }

  decreaseStockCount() {
    Stocks? stocks;
    if (state.quantity == 1) {
      stocks = null;
    } else {
      stocks = state.stocks?.copyWith(quantity: state.quantity - 1);
    }

    state = state.copyWith(quantity: state.quantity - 1, stocks: stocks);
  }

  increaseStockCount(Stocks? stock) {
    int quantity = 0;
    quantity = state.stocks?.id == stock?.id ? state.quantity + 1 : 1;
    if ((stock?.quantity ?? 0) < quantity) {
      return;
    }
    state = state.copyWith(
      quantity: quantity,
      stocks: stock?.copyWith(
        quantity: quantity,
      ),
    );
  }
}
