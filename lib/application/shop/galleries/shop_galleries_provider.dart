import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';

import 'shop_galleries_notifier.dart';
import 'shop_galleries_state.dart';

final shopGalleriesProvider =
    StateNotifierProvider<ShopGalleriesNotifier, ShopGalleriesState>(
  (ref) => ShopGalleriesNotifier(shopsRepository,settingsRepository),
);
