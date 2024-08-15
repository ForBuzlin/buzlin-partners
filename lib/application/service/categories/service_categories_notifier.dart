import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'service_categories_state.dart';

class ServiceCategoriesNotifier extends StateNotifier<ServiceCategoriesState> {
  final CatalogFacade _catalogRepository;
  int _page = 0;
  int _allPage = 0;

  ServiceCategoriesNotifier(this._catalogRepository)
      : super(const ServiceCategoriesState());

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
      page: ++_page,
      status: CategoryStatus.published,
      active: true,
      type: TrKeys.service
    );
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

  fetchAllCategories({
    required BuildContext context,
    bool? isRefresh,
    RefreshController? controller,
  }) async {
    if (isRefresh ?? false) {
      controller?.resetNoData();
      _allPage = 0;
      state = state.copyWith(
          allCategories: [], isLoading: true, selectSubs: [], selectParents: []);
    }
    final res = await _catalogRepository.getCategories(
      page: ++_allPage,
      type: TrKeys.service,
    );
    res.when(success: (data) {
      List<CategoryData> list = List.from(state.allCategories);
      list.addAll(data.data ?? []);
      state = state.copyWith(isLoading: false, allCategories: list);
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

  onTapParent(int? id) {
    if (id == null) {
      return;
    }
    List<int> list = List.from(state.selectParents);
    if (list.contains(id)) {
      list.remove(id);
    } else {
      list.add(id);
    }
    state = state.copyWith(selectParents: list, selectSubs: []);
  }

  onTapSub(int? id) {
    if (id == null) {
      return;
    }
    List<int> list = List.from(state.selectSubs);
    if (list.contains(id)) {
      list.remove(id);
    } else {
      list.add(id);
    }
    state = state.copyWith(selectSubs: list);
  }
}
