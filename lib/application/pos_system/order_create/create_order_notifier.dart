import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'create_order_state.dart';

class CreateOrderNotifier extends StateNotifier<CreateOrderState> {
  final OrdersFacade _ordersRepository;

  CreateOrderNotifier(
    this._ordersRepository,
  ) : super(const CreateOrderState());

  Future<void> createOrder(
    BuildContext context, {
    required BagData bag,
    required DeliveryType deliveryType,
    UserData? user,
    required String deliveryDate,
    required List<Stocks> stocks,
    ValueChanged<int>? orderSuccess,
  }) async {
    state = state.copyWith(isCreating: true);
    final response = await _ordersRepository.createOrder(
      bag,
      deliveryType: deliveryType,
      user: user,
      deliveryTime: deliveryDate,
      stocks: stocks,
    );
    response.when(
      success: (data) async {
        state = state.copyWith(isCreating: false);
        orderSuccess?.call(data.data?.id ?? 0);
      },
      failure: (failure, status) {
        debugPrint('===> create order fail $failure');
        AppHelpers.errorSnackBar(context, text: failure);
        state = state.copyWith(isCreating: false);
      },
    );
  }
}
