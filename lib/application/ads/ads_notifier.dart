import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

import 'ads_state.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';

class AdsNotifier extends StateNotifier<AdsState> {
  final AdsFacade _adsRepository;
  int _page = 0;

  AdsNotifier(this._adsRepository) : super(const AdsState());

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
    final res = await _adsRepository.getAds(
      page: ++_page,
    );
    res.when(success: (data) {
      List<AdsData> list = List.from(state.list);
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
      debugPrint(" ==> fetch ads fail: $failure");
      if (context != null) {
        AppHelpers.errorSnackBar(context, text: failure);
      }
    });
  }

  Future<void> purchaseAds(
    BuildContext context, {
    VoidCallback? updated,
    required int index,
    VoidCallback? failed,
  }) async {
    state = state.copyWith(isLoading: true);
    final response =
        await _adsRepository.purchaseAds(id: state.list[index].id ?? 0);
    response.when(
      success: (data) {
        state = state.copyWith(isLoading: false);
        updated?.call();
      },
      failure: (failure, status) {
        state = state.copyWith(isLoading: false);
        AppHelpers.errorSnackBar(context, text: failure);
        debugPrint('===> assign ads fail $failure');
        failed?.call();
      },
    );
  }
}
