import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

part 'statistics_state.freezed.dart';

@freezed
class StatisticsState with _$StatisticsState {
  const factory StatisticsState({
    @Default(false) bool isLoading,
    @Default(false) bool isTopSaleLoading,
    @Default(true) bool isRefresh,
    @Default([]) List<TopSaleProducts> topSaleProducts,
    @Default([]) List<ChartData> chart,
    @Default([]) List<DateTime> time,
    StatisticsData? countData,
  }) = _StatisticsState;

  const StatisticsState._();
}
