import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';

import 'shop_socials_notifier.dart';
import 'shop_socials_state.dart';

final shopSocialsProvider =
    StateNotifierProvider<ShopSocialsNotifier, ShopSocialsState>(
  (ref) => ShopSocialsNotifier(shopsRepository),
);
