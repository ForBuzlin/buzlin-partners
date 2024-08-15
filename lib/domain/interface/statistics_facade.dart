import 'package:venderuzmart/domain/handlers/handlers.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';


abstract class StatisticsFacade {
  Future<ApiResult<List<IncomeChartResponse>>> getIncomeChart({
    required String type,
    required DateTime? from,
    required DateTime? to,
  });

  Future<ApiResult<ChartResponse>> getStatisticsChart({required String type});

  Future<ApiResult<TopSaleProductsResponse>> getTopSaleProducts({
    required String type,
    required int page,
  });

  Future<ApiResult<StatisticsResponse>> getStatistics();

  Future<ApiResult<StatisticsOrderResponse>> getStatisticsOrder({
    DateTime? startTime,
    DateTime? endTime,
    int? page,
    int? perPage,
  });

  Future<ApiResult<BookingReportsData>> getBookingReports({
    required String type,
     DateTime? from,
     DateTime? to,
  });

  Future<ApiResult<List<BookingChartData>>> getBookingChart({
    required String type,
    required DateTime? from,
    required DateTime? to,
  });

  Future<ApiResult<MastersReportResponse>> getTopMasters({
    required String type,
    required DateTime? from,
    required DateTime? to,
    required int page,
  });

  Future<ApiResult<List<PaymentReportData>>> getPaymentReports({
    required String type,
    required DateTime? from,
    required DateTime? to,
  });

}
