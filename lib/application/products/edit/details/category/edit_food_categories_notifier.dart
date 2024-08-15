import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';

import 'edit_food_categories_state.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

class EditFoodCategoriesNotifier
    extends StateNotifier<EditFoodCategoriesState> {
  final CatalogFacade _categoryRepository;

  EditFoodCategoriesNotifier(this._categoryRepository)
      : super(
          EditFoodCategoriesState(categoryController: TextEditingController()),
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
    final res =
        await _categoryRepository.fetchSingleCategory(state.oldCategory?.uuid);
    res.when(
      success: (data) {
        if (data.data?.children?.isNotEmpty ?? false) {
          state = state.copyWith(oldCategory: null);
          state.categoryController?.clear();
        }
      },
      failure: (failure, status) {},
    );
  }

  void setFoodCategory(CategoryData? category) {
    state = state.copyWith(oldCategory: category);
    state.categoryController?.text = category?.translation?.title ?? '';
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

    list.add(category);

    controllers
        .add(TextEditingController(text: category.translation?.title ?? ''));
    state.categoryController?.text = '';
    state = state.copyWith(
      selectCategories: list,
      categoryControllers: controllers,
      selectCategory: selectCategory,
      oldCategory: null,
    );
  }
}
