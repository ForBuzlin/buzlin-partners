import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';

import 'products_filter_notifier.dart';
import 'products_filter_state.dart';

final productsFilterProvider =
    StateNotifierProvider<ProductsFilterNotifier, ProductsFilterState>(
  (ref) => ProductsFilterNotifier(productRepository),
);
