import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

part 'booking_statistics_state.freezed.dart';

@freezed
class BookingStatisticsState with _$BookingStatisticsState {
  const factory BookingStatisticsState({
    @Default(false) bool isLoading,
    @Default(true) bool isRefresh,
    @Default([]) List<BookingChartData> chart,
    @Default([]) List<MasterReportData> masters,
    @Default([]) List<num> totalPrices,
    @Default([]) List<num> cancelPrices,
    @Default([]) List<int> counts,
    @Default([]) List<DateTime> time,
    @Default([]) List<PaymentReportData> payments,
    PaymentReportData? summary,
    BookingReportsData? bookingReportsData,
    BookingReportsData? dailyReport,
    @Default(TrKeys.week) String selectType,
  }) = _BookingStatisticsState;

  const BookingStatisticsState._();
}
