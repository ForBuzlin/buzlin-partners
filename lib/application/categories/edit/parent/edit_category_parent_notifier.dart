import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

import 'edit_category_parent_state.dart';

class EditCategoryParentNotifier
    extends StateNotifier<EditCategoryParentState> {
  EditCategoryParentNotifier()
      : super(
          EditCategoryParentState(categoryController: TextEditingController()),
        );

  void setInitial({
    required CategoryData? category,
    required List<CategoryData> categories,
  }) {
    setFoodCategory(category);
    setCategories(categories);
  }

  Future<void> setCategories(List<CategoryData> categories) async {
    state = state.copyWith(
      categories: categories,
      oldCategory: categories.isEmpty ? null : state.oldCategory,
      selectCategories: [],
      selectCategory: null,
      categoryControllers: [],
    );
  }

  void setFoodCategory(CategoryData? category) {
    if (category?.parent == null) {
      return;
    }
    CategoryData categoryData = CategoryData(
        translation: category?.parent?.translation,
        id: category?.parentId,
        uuid: category?.parent?.uuid,
        type: category?.parent?.type);
    state = state.copyWith(oldCategory: categoryData);
    state.categoryController?.text = categoryData.translation?.title ??
        AppHelpers.getTranslation(TrKeys.noName);
  }

  void setSelectCategory(CategoryData category) {
    if (state.selectCategory?.id == category.id) {
      return;
    }
    state = state.copyWith(selectCategory: category);
  }

  void setActiveIndex(CategoryData category) {
    List<CategoryData> list = List.from(state.selectCategories);
    List<TextEditingController> controllers =
        List.from(state.categoryControllers);
    CategoryData? selectCategory = state.selectCategory;
    if (list.isNotEmpty) {
      int index =
          list.indexWhere((element) => element.parentId == category.parentId);
      if (category.parentId == null) {
        index = 0;
      }
      if (index != -1) {
        list.removeRange(index, list.length);
        controllers.removeRange(index, controllers.length);
        if (category.children?.isNotEmpty ?? true) {
          selectCategory = null;
        }
      }
    }
    if (state.oldCategory?.type == "sub_main"
        ? list.length == 1
        : list.isEmpty) {
      selectCategory = category;
    }
    list.add(category);
    controllers.add(TextEditingController(
        text: category.translation?.title ??
            AppHelpers.getTranslation(TrKeys.noName)));
    state.categoryController?.text = '';
    state = state.copyWith(
      selectCategories: list,
      categoryControllers: controllers,
      selectCategory: selectCategory,
    );
  }
}
