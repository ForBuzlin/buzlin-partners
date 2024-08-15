import 'package:venderuzmart/domain/di/dependency_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'add_discount_state.dart';
import 'add_discount_notifier.dart';
final addDiscountProvider =
    StateNotifierProvider<AddDiscountNotifier, AddDiscountState>(
  (ref) => AddDiscountNotifier(discountsRepository, settingsRepository),
);
