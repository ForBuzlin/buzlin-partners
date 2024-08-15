import 'package:venderuzmart/domain/di/dependency_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'create_order_notifier.dart';
import 'create_order_state.dart';

final createOrderProvider =
    StateNotifierProvider<CreateOrderNotifier, CreateOrderState>(
  (ref) => CreateOrderNotifier(ordersRepository),
);
