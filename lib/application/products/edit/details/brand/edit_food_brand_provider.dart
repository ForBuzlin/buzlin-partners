import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'edit_food_brand_notifier.dart';
import 'edit_food_brand_state.dart';

final editFoodBrandProvider =
    StateNotifierProvider<EditFoodBrandNotifier, EditFoodBrandState>(
  (ref) => EditFoodBrandNotifier(),
);
