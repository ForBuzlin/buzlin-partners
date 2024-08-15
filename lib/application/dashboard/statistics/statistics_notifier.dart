import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'statistics_state.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';

class StatisticsNotifier extends StateNotifier<StatisticsState> {
  final StatisticsFacade _statisticsRepository;
  int page = 1;
  int productPage = 1;

  StatisticsNotifier(this._statisticsRepository)
      : super(const StatisticsState());

  Future<void> fetchStatistics({
    DateTime? endTime,
    DateTime? startTime,
    RefreshController? controller,
  }) async {
    state = state.copyWith(isLoading: true);
    final response = await _statisticsRepository.getStatistics();
    response.when(
      success: (data) {
        if (controller != null) {
          controller.refreshCompleted();
        }
        state = state.copyWith(countData: data.data, isLoading: false);
      },
      failure: (failure, status) {
        if (controller != null) {
          controller.refreshFailed();
        }
        state = state.copyWith(isLoading: false);
        debugPrint('==> error with fetching statistics $failure');
      },
    );
  }

  Future<void> fetchProducts({
    RefreshController? refreshController,
    bool isRefresh = false,
  }) async {
    if (isRefresh) {
      productPage = 0;
      refreshController?.resetNoData();
      state = state.copyWith(topSaleProducts: [], isLoading: true);
    }
    final response = await _statisticsRepository.getTopSaleProducts(
      page: ++productPage,
      type: TrKeys.month,
    );
    response.when(
      success: (data) {
        List<TopSaleProducts> list = List.from(state.topSaleProducts);
        list.addAll(data.data ?? []);
        state = state.copyWith(isLoading: false, topSaleProducts: list);
        if (isRefresh) {
          refreshController?.refreshCompleted();
          return;
        } else if (data.data?.isEmpty ?? true) {
          refreshController?.loadNoData();
          return;
        }
        refreshController?.loadComplete();
        return;
      },
      failure: (failure, status) {
        debugPrint('====> fetch products fail $failure');
      },
    );
  }

}
