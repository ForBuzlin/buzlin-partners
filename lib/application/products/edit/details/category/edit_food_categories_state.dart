import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:venderuzmart/infrastructure/models/models.dart';

part 'edit_food_categories_state.freezed.dart';

@freezed
class EditFoodCategoriesState with _$EditFoodCategoriesState {
  const factory EditFoodCategoriesState({
    @Default(false) bool isLoading,
    @Default([]) List<CategoryData> categories,
    TextEditingController? categoryController,
    CategoryData? selectCategory,
    CategoryData? oldCategory,
    @Default([]) List<CategoryData> selectCategories,
    @Default([]) List<TextEditingController> categoryControllers,
  }) = _EditFoodCategoriesState;

  const EditFoodCategoriesState._();
}
