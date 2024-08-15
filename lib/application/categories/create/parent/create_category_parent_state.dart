import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:venderuzmart/infrastructure/models/models.dart';

part 'create_category_parent_state.freezed.dart';

@freezed
class CreateCategoryParentState with _$CreateCategoryParentState {
  const factory CreateCategoryParentState({
    @Default([]) List<CategoryData> categories,
    @Default(null) CategoryData? selectCategory,
    @Default([]) List<CategoryData> selectCategories,
    @Default(false) bool isLoading,
    @Default([]) List<TextEditingController> categoryControllers,
  }) = _CreateCategoryParentState;

  const CreateCategoryParentState._();
}
