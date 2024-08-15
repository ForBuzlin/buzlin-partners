import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

import 'add_food_categories_state.dart';

class AddFoodCategoriesNotifier extends StateNotifier<AddFoodCategoriesState> {
  final CatalogFacade _catalogRepository;
  int _page = 0;

  AddFoodCategoriesNotifier(this._catalogRepository)
      : super(
          const AddFoodCategoriesState(),
        );

  Future<void> updateCategories(BuildContext context) async {
    _page = 0;
    final response = await _catalogRepository.getCategories(page: ++_page);
    response.when(
      success: (data) {
        List<CategoryData> categories = List.from(state.categories);
        final List<CategoryData> newCategories = data.data ?? [];
        for (final category in newCategories) {
          bool contains = false;
          for (final oldCategory in categories) {
            if (category.id == oldCategory.id) {
              contains = true;
            }
          }
          if (!contains) {
            categories.insert(0, category);
          }
        }
        state = state.copyWith(categories: categories, selectCategory: null);
      },
      failure: (failure, status) {
        debugPrint('====> fetch categories fail $failure');
        _page--;
     AppHelpers.errorSnackBar(context, text: failure);
      },
    );
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
    state = state.copyWith(
      selectCategories: list,
      categoryControllers: controllers,
      selectCategory: selectCategory,
    );
  }

  void setCategories(List<CategoryData> categories) {
    if (state.categories.isEmpty) {
      _page = 0;
      state = state.copyWith(
        categories: categories,
        selectCategory: null,
        selectCategories: [],
        categoryControllers: [],
      );
    } else {
      state = state.copyWith(
        selectCategory: null,
        selectCategories: [],
        categoryControllers: [],
      );
    }
  }
}
