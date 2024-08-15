import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';

import 'orders_filter_state.dart';
import 'orders_filter_notifier.dart';

final ordersFilterProvider =
    StateNotifierProvider<OrdersFilterNotifier, OrdersFilterState>(
  (ref) => OrdersFilterNotifier(paymentRepository),
);
