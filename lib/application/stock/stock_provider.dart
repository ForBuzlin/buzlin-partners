import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'stock_state.dart';
import 'stock_notifier.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';

final stockProvider = StateNotifierProvider<StockNotifier, StockState>(
  (ref) => StockNotifier(stockRepository),
);
