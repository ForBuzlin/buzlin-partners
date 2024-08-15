import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';

import 'discount_notifier.dart';
import 'discount_state.dart';

final discountProvider = StateNotifierProvider<DiscountNotifier, DiscountState>(
  (ref) => DiscountNotifier(discountsRepository),
);
