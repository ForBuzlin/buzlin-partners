import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'today_orders_state.dart';
import 'today_orders_notifier.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';

final todayOrdersProvider =
    StateNotifierProvider<TodayOrdersNotifier, TodayOrdersState>(
  (ref) => TodayOrdersNotifier(ordersRepository),
);
