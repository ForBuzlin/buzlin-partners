import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'food_categories_state.dart';

class FoodCategoriesNotifier extends StateNotifier<FoodCategoriesState> {
  final CatalogFacade _catalogRepository;
  int _page = 0;

  FoodCategoriesNotifier(this._catalogRepository)
      : super(const FoodCategoriesState());

  fetchCategories({
    required BuildContext context,
    bool? isRefresh,
    RefreshController? controller,
  }) async {
    if (isRefresh ?? false) {
      controller?.resetNoData();
      _page = 0;
      state = state.copyWith(categories: [], isLoading: true);
    }
    final res = await _catalogRepository.getCategories(
        page: ++_page, status: CategoryStatus.published, active: true);
    res.when(success: (data) {
      List<CategoryData> list = List.from(state.categories);
      list.addAll(data.data ?? []);
      state = state.copyWith(isLoading: false, categories: list);
      if (isRefresh ?? false) {
        controller?.refreshCompleted();
        return;
      } else if (data.data?.isEmpty ?? true) {
        controller?.loadNoData();
        return;
      }
      controller?.loadComplete();
      return;
    }, failure: (failure, status) {
      state = state.copyWith(isLoading: false);
      AppHelpers.errorSnackBar(context, text: failure);
    });
  }
}
