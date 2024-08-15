import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:venderuzmart/domain/di/dependency_manager.dart';

import 'edit_discount_notifier.dart';
import 'edit_discount_state.dart';

final editDiscountProvider =
    StateNotifierProvider<EditDiscountNotifier, EditDiscountState>(
  (ref) => EditDiscountNotifier(discountsRepository, settingsRepository),
);
