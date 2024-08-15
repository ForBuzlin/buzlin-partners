import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'edit_food_stocks_state.dart';
import 'edit_food_stocks_notifier.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';

final editFoodStocksProvider = StateNotifierProvider<
    EditFoodStocksNotifier, EditFoodStocksState>(
  (ref) => EditFoodStocksNotifier(productRepository, extrasRepository),
);
