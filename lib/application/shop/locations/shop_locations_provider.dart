import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';

import 'shop_locations_notifier.dart';
import 'shop_locations_state.dart';

final shopLocationsProvider =
    StateNotifierProvider<ShopLocationsNotifier, ShopLocationsState>(
  (ref) => ShopLocationsNotifier(shopsRepository),
);
