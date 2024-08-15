import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

part 'income_state.freezed.dart';

@freezed
class IncomeState with _$IncomeState {
  const factory IncomeState({
    @Default(false) bool isLoading,
    @Default(TrKeys.week) String selectType,
    @Default([]) List<IncomeChartResponse>? incomeCharts,
    @Default([]) List<num> prices,
    @Default([]) List<DateTime> time,
    @Default(null) DateTime? start,
    @Default(null) DateTime? end,
  }) = _IncomeState;

  const IncomeState._();
}
