import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'booking_statistics_state.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';

class BookingStatisticsNotifier extends StateNotifier<BookingStatisticsState> {
  final StatisticsFacade _statisticsRepository;
  int page = 1;
  int productPage = 1;
  int masterPage = 1;

  BookingStatisticsNotifier(this._statisticsRepository)
      : super(const BookingStatisticsState());

  Future<void> fetchMasters({
    RefreshController? refreshController,
    bool isRefresh = false,
  }) async {
    if (isRefresh) {
      masterPage = 0;
      refreshController?.resetNoData();
      state = state.copyWith(masters: [], isLoading: true);
    }
    final response = await _statisticsRepository.getTopMasters(
      page: ++masterPage,
      type: TrKeys.month,
      to: DateTime.now(),
      from: DateTime.now().subtractDay(30),
    );
    response.when(
      success: (data) {
        List<MasterReportData> list = List.from(state.masters);
        list.addAll(data.data ?? []);
        state = state.copyWith(isLoading: false, masters: list);
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
        debugPrint('====> fetch top masters fail $failure');
      },
    );
  }

  Future<void> fetchPaymentReports({
    RefreshController? refreshController,
    bool isRefresh = false,
  }) async {
    if (isRefresh) {
      productPage = 0;
      refreshController?.resetNoData();
      state = state.copyWith(payments: [], isLoading: true);
    }
    final response = await _statisticsRepository.getPaymentReports(
      type: TrKeys.month,
      to: DateTime.now(),
      from: DateTime.now().subtractDay(30),
    );
    response.when(
      success: (data) {
        state = state.copyWith(isLoading: false, payments: data);
        if (isRefresh) {
          refreshController?.refreshCompleted();
          return;
        } else if (data.isEmpty) {
          refreshController?.loadNoData();
          return;
        }
        refreshController?.loadComplete();
        return;
      },
      failure: (failure, status) {
        debugPrint('====> fetch payments fail $failure');
      },
    );
  }

  fetchBookingCharts({DateTime? start, DateTime? end}) async {
    final response = await _statisticsRepository.getBookingChart(
        type: start == null ? state.selectType : TrKeys.month,
        from: start ??
            (state.selectType == TrKeys.day
                ? DateTime.now()
                : state.selectType == TrKeys.month
                    ? DateTime.now().subtract(const Duration(days: 30))
                    : DateTime.now().subtract(const Duration(days: 7))),
        to: end ?? DateTime.now());
    response.when(
      success: (data) async {
        List<num> totalPrices = [];
        List<num> cancelPrices = [];
        List<DateTime> times = [];
        if (data.isNotEmpty) {
          num totalPrice = data.first.totalPrice ?? 0;
          num cancelPrice = data.first.totalPrice ?? 0;
          for (var element in data) {
            if (totalPrice < (element.totalPrice ?? 0)) {
              totalPrice = element.totalPrice ?? 0;
            }
            if (cancelPrice < (element.canceledTotalPrice ?? 0)) {
              cancelPrice = element.canceledTotalPrice ?? 0;
            }
          }
          num a = totalPrice / 6;
          num b = cancelPrice / 6;
          totalPrices = List.generate(7, (index) => (totalPrice - (index * a)));
          cancelPrices =
              List.generate(7, (index) => (cancelPrice - (index * b)));
          times = List.generate(
            state.selectType == TrKeys.day
                ? 24
                : state.selectType == TrKeys.month
                    ? 30
                    : state.selectType == TrKeys.week
                        ? 7
                        : data.length,
            (index) => state.selectType == TrKeys.day
                ? DateTime.now().subtract(Duration(hours: index))
                : state.selectType == TrKeys.month
                    ? DateTime.now().subtract(Duration(days: index))
                    : state.selectType == TrKeys.week
                        ? DateTime.now().subtract(Duration(days: index))
                        : DateTime.now().subtract(Duration(days: index)),
          );
        }

        state = state.copyWith(
          chart: data,
          totalPrices: totalPrices.reversed.toList(),
          cancelPrices: cancelPrices.reversed.toList(),
          time: times,
        );
      },
      failure: (failure, status) {},
    );
  }

  Future<void> fetchBookingReports({
    RefreshController? controller,
  }) async {
    state = state.copyWith(isLoading: true);
    final response = await _statisticsRepository.getBookingReports(
      type: TrKeys.month,
      to: DateTime.now(),
      from: DateTime.now().subtractDay(30),
    );
    response.when(
      success: (data) {
        if (controller != null) {
          controller.refreshCompleted();
        }
        state = state.copyWith(bookingReportsData: data, isLoading: false);
      },
      failure: (failure, status) {
        if (controller != null) {
          controller.refreshFailed();
        }
        state = state.copyWith(isLoading: false);
        debugPrint('==> error with fetch booking statistic $failure');
      },
    );
  }

  Future<void> fetchDailyReport({
    RefreshController? controller,
  }) async {
    state = state.copyWith(isLoading: true);
    final response = await _statisticsRepository.getBookingReports(
      type: TrKeys.month,
      to: DateTime.now().addDay(1),
      from: DateTime.now(),
    );
    response.when(
      success: (data) {
        if (controller != null) {
          controller.refreshCompleted();
        }
        state = state.copyWith(dailyReport: data, isLoading: false);
      },
      failure: (failure, status) {
        if (controller != null) {
          controller.refreshFailed();
        }
        state = state.copyWith(isLoading: false);
        debugPrint('==> error with fetch booking statistic $failure');
      },
    );
  }
}
