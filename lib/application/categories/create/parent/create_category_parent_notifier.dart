import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

import 'create_category_parent_state.dart';

class CreateCategoryParentNotifier
    extends StateNotifier<CreateCategoryParentState> {
  CreateCategoryParentNotifier()
      : super(
          const CreateCategoryParentState(),
        );

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

    list.add(category);
    if (category.type == "sub_main") {
      selectCategory = category;
    }
    if (category.type == "service") {
      selectCategory = category;
    }
    controllers.add(TextEditingController(
        text: category.translation?.title ??
            AppHelpers.getTranslation(TrKeys.noName)));
    state = state.copyWith(
      selectCategories: list,
      categoryControllers: controllers,
      selectCategory: selectCategory,
    );
  }

  void setCategories(List<CategoryData> categories) {
    state = state.copyWith(
      categories: categories,
      selectCategory: null,
      selectCategories: [],
      categoryControllers: [],
    );
  }
}
