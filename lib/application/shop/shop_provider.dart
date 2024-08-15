import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'shop_state.dart';
import 'shop_notifier.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';

final shopProvider = StateNotifierProvider<ShopNotifier, ShopState>(
  (ref) => ShopNotifier(usersRepository, settingsRepository, shopsRepository),
);
