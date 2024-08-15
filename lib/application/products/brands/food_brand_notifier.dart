import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:venderuzmart/domain/interface/brands_facade.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'food_brand_state.dart';

class FoodBrandNotifier extends StateNotifier<FoodBrandState> {
  final BrandsFacade _brandsRepository;
  int page = 0;

  FoodBrandNotifier(this._brandsRepository) : super(const FoodBrandState());

  fetchBrands({
    required BuildContext context,
    bool? isRefresh,
    RefreshController? controller,
    VoidCallback? onSuccess,
  }) async {
    if (isRefresh ?? false) {
      page = 0;
      state = state.copyWith(brands: [], isLoading: true);
    }
    final res = await _brandsRepository.getAllBrands(page: ++page);
    res.when(success: (data) {
      List<Brand> list = List.from(state.brands);
      list.addAll(data.data ?? []);
      state = state.copyWith(isLoading: false, brands: list);
      onSuccess?.call();

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
