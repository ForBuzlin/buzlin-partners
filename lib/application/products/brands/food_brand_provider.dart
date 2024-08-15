import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';

import 'food_brand_notifier.dart';
import 'food_brand_state.dart';

final foodBrandProvider =
    StateNotifierProvider<FoodBrandNotifier, FoodBrandState>(
  (ref) => FoodBrandNotifier(brandsRepository),
);
