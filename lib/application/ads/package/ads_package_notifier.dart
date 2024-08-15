import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

import 'ads_package_state.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';

class AdsPackageNotifier extends StateNotifier<AdsPackageState> {
  final AdsFacade _adsRepository;
  int _page = 0;

  AdsPackageNotifier(this._adsRepository) : super(const AdsPackageState());

  fetchAds({
    BuildContext? context,
    bool? isRefresh,
    RefreshController? controller,
  }) async {
    if (isRefresh ?? false) {
      controller?.resetNoData();
      _page = 0;
      state = state.copyWith(list: [], isLoading: true);
    }
    final res = await _adsRepository.getAdsPackages(
      page: ++_page,
    );
    res.when(success: (data) {
      List<AdsPackage> list = List.from(state.list);
      list.addAll(data.data ?? []);
      state = state.copyWith(isLoading: false, list: list);
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
      debugPrint(" ==> fetch ads packages fail: $failure");
      if (context != null) {
        AppHelpers.errorSnackBar(context, text: failure);
      }
    });
  }
}
