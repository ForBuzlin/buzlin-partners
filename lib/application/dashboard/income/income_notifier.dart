import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/interface/statistics_facade.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

import 'income_state.dart';

class IncomeNotifier extends StateNotifier<IncomeState> {
  final StatisticsFacade _statisticsRepository;

  IncomeNotifier(this._statisticsRepository) : super(const IncomeState());

  changeIndex(String type) {
    state = state.copyWith(selectType: type);
    fetchIncomeCharts();
  }

  fetchIncomeCharts({DateTime? start, DateTime? end}) async {
    state=state.copyWith(isLoading: true);
    final response = await _statisticsRepository.getIncomeChart(
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
        List<num> prices = [];
        List<DateTime> times = [];
        if (data.isNotEmpty) {
          num price = data.first.totalPrice ?? 0;
          for (var element in data) {
            if (price < (element.totalPrice ?? 0)) {
              price = element.totalPrice ?? 0;
            }
          }
          num a = price / 6;
          prices = List.generate(7, (index) => (price - (index * a)));
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
            incomeCharts: data, prices: prices.reversed.toList(), time: times,isLoading: false);
      },
      failure: (failure, status) {
        state=state.copyWith(isLoading: false);
      },
    );
  }
}
