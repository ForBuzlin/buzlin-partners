import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:venderuzmart/infrastructure/models/models.dart';

part 'food_categories_state.freezed.dart';

@freezed
class FoodCategoriesState with _$FoodCategoriesState {
  const factory FoodCategoriesState({
    @Default(false) bool isLoading,
    @Default([]) List<CategoryData> categories,
  }) = _FoodCategoriesState;

  const FoodCategoriesState._();
}
