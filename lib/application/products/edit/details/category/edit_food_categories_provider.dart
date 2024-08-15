import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';

import 'edit_food_categories_state.dart';
import 'edit_food_categories_notifier.dart';

final editFoodCategoriesProvider =
    StateNotifierProvider<EditFoodCategoriesNotifier, EditFoodCategoriesState>(
  (ref) => EditFoodCategoriesNotifier(catalogRepository),
);
