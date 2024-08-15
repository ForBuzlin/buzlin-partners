import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';

import 'create_food_brand_notifier.dart';
import 'create_food_brand_state.dart';

final createFoodBrandProvider =
    StateNotifierProvider<CreateFoodBrandNotifier, CreateFoodBrandState>(
  (ref) => CreateFoodBrandNotifier(brandsRepository),
);
