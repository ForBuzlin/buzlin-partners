import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';

import 'product_detail_state.dart';
import 'product_detail_notifier.dart';

final productDetailProvider =
    StateNotifierProvider<ProductDetailNotifier, ProductDetailState>(
  (ref) => ProductDetailNotifier(productRepository),
);
