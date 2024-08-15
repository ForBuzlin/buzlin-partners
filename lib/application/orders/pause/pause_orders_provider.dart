import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'pause_orders_state.dart';
import 'pause_orders_notifier.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';

final pauseOrdersProvider =
    StateNotifierProvider<PauseOrdersNotifier, PauseOrdersState>(
  (ref) => PauseOrdersNotifier(ordersRepository),
);
