import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:venderuzmart/domain/interface/brands_facade.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'brand_state.dart';

class BrandNotifier extends StateNotifier<BrandState> {
  final BrandsFacade _brandsRepository;
  int _page = 0;

  BrandNotifier(this._brandsRepository) : super(const BrandState());

  fetchBrands({
    BuildContext? context,
    bool? isRefresh,
    RefreshController? controller,
  }) async {
    if (isRefresh ?? false) {
      controller?.resetNoData();
      _page = 0;
      state = state.copyWith(brands: [], isLoading: true);
    }
    final res = await _brandsRepository.getAllBrands(
      page: ++_page,
      isActive: false,
    );
    res.when(success: (data) {
      List<Brand> list = List.from(state.brands);
      list.addAll(data.data ?? []);
      state = state.copyWith(isLoading: false, brands: list);
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
      debugPrint(" ==> fetch brands fail: $failure");
      if (context != null) {
        AppHelpers.errorSnackBar(context, text: failure);
      }
    });
  }
}
