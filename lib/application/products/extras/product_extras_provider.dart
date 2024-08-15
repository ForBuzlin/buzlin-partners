import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'product_extras_state.dart';
import 'product_extras_notifier.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';

final productExtrasProvider =
    StateNotifierProvider<ProductExtrasNotifier, ProductExtrasState>(
  (ref) => ProductExtrasNotifier(extrasRepository),
);
