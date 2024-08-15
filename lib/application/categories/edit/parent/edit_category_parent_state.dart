import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:venderuzmart/infrastructure/models/models.dart';

part 'edit_category_parent_state.freezed.dart';

@freezed
class EditCategoryParentState with _$EditCategoryParentState {
  const factory EditCategoryParentState({
    @Default(false) bool isLoading,
    @Default([]) List<CategoryData> categories,
    TextEditingController? categoryController,
    CategoryData? selectCategory,
    CategoryData? oldCategory,
    @Default([]) List<CategoryData> selectCategories,
    @Default([]) List<TextEditingController> categoryControllers,
  }) = _EditCategoryParentState;

  const EditCategoryParentState._();
}
