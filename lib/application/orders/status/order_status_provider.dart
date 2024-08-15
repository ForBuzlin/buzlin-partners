import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'order_status_state.dart';
import 'order_status_notifier.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';

final orderStatusProvider =
    StateNotifierProvider<OrderStatusNotifier, OrderStatusState>(
  (ref) => OrderStatusNotifier(ordersRepository),
);
