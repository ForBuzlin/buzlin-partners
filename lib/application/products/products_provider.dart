import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'products_state.dart';
import 'products_notifier.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';

final productsProvider = StateNotifierProvider<ProductsNotifier, ProductsState>(
  (ref) => ProductsNotifier(productRepository),
);
