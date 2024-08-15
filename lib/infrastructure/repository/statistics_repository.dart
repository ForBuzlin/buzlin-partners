import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';
import 'package:venderuzmart/domain/handlers/handlers.dart';
import 'package:venderuzmart/domain/interface/statistics_facade.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

class StatisticsRepository extends StatisticsFacade {
  @override
  Future<ApiResult<List<IncomeChartResponse>>> getIncomeChart(
      {required String type,
      required DateTime? from,
      required DateTime? to}) async {
    try {
      final data = {
        "type": type == TrKeys.week ? TrKeys.month : type,
        "date_from": from.toString().substring(0, from.toString().indexOf(" ")),
        "date_to": to.toString().substring(0, to.toString().indexOf(" "))
      };
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
          '/api/v1/dashboard/${AppHelpers.getUserRole}/sales-chart',
          queryParameters: data);
      return ApiResult.success(
        data: incomeChartResponseFromJson(jsonEncode(response.data)),
      );
    } catch (e) {
      debugPrint('==> get sale cart failure: $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<ChartResponse>> getStatisticsChart({
    required String type,
  }) async {
    try {
      final data = {
        "time": type == TrKeys.month
            ? "subMonth"
            : type == TrKeys.week
                ? "subWeek"
                : "subYear",
      };
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
          '/api/v1/dashboard/${AppHelpers.getUserRole}/statistics/orders/chart',
          queryParameters: data);
      return ApiResult.success(
        data: ChartResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get sale cart failure: $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<TopSaleProductsResponse>> getTopSaleProducts({
    required String type,
    required int page,
  }) async {
    try {
      final data = {
        "time": type == TrKeys.month
            ? "subMonth"
            : type == TrKeys.week
                ? "subWeek"
                : "subYear",
        "page": page,
        "lang": LocalStorage.getLanguage()?.locale,
      };
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
          '/api/v1/dashboard/${AppHelpers.getUserRole}/statistics/products',
          queryParameters: data);
      return ApiResult.success(
        data: TopSaleProductsResponse.fromJson(response.data),
      );
    } catch (e, s) {
      debugPrint('==> get top sale products failure: $e, $s');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<StatisticsResponse>> getStatistics() async {
    try {
      final data = {"time": "subYear"};
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
          '/api/v1/dashboard/${AppHelpers.getUserRole}/statistics',
          queryParameters: data);
      return ApiResult.success(
        data: StatisticsResponse.fromJson(response.data),
      );
    } catch (e, s) {
      debugPrint('===> get statistics error $e,$s');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<StatisticsOrderResponse>> getStatisticsOrder(
      {DateTime? startTime, DateTime? endTime, int? page, int? perPage}) async {
    try {
      final data = {
        if (endTime != null)
          "date_from":
              endTime.toString().substring(0, endTime.toString().indexOf(" ")),
        if (startTime != null)
          "date_to": startTime
              .toString()
              .substring(0, startTime.toString().indexOf(" ")),
        "page": page,
        "perPage": perPage ?? 10
      };
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
          '/api/v1/dashboard/${AppHelpers.getUserRole}/orders/report/paginate',
          queryParameters: data);
      return ApiResult.success(
        data: StatisticsOrderResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('===> get statistics order error $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<BookingReportsData>> getBookingReports({
    required String type,
    DateTime? from,
    DateTime? to,
  }) async {
    try {
      final data = {
        "type": type == TrKeys.week ? TrKeys.month : type,
        "date_from": from.toString().substring(0, from.toString().indexOf(" ")),
        "date_to": to.toString().substring(0, to.toString().indexOf(" "))
      };
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/${AppHelpers.getUserRole}/booking/reports/statistic',
        queryParameters: data,
      );
      return ApiResult.success(
        data: BookingReportsData.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get booking reports failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<List<BookingChartData>>> getBookingChart({
    required String type,
    required DateTime? from,
    required DateTime? to,
  }) async {
    try {
      final data = {
        "type": type == TrKeys.week ? TrKeys.month : type,
        "date_from": from.toString().substring(0, from.toString().indexOf(" ")),
        "date_to": to.toString().substring(0, to.toString().indexOf(" "))
      };
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
          '/api/v1/dashboard/${AppHelpers.getUserRole}/booking/reports/chart',
          queryParameters: data);
      return ApiResult.success(
        data: bookingChartDataFromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get booking chart failure: $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<MastersReportResponse>> getTopMasters({
    required String type,
    required DateTime? from,
    required DateTime? to,
    required int page,
  }) async {
    try {
      final data = {
        "time": type == TrKeys.month
            ? "subMonth"
            : type == TrKeys.week
                ? "subWeek"
                : "subYear",
        "date_from": from.toString().substring(0, from.toString().indexOf(" ")),
        "date_to": to.toString().substring(0, to.toString().indexOf(" ")),
        "page": page,
        "lang": LocalStorage.getLanguage()?.locale,
      };
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
          '/api/v1/dashboard/${AppHelpers.getUserRole}/booking/reports/masters',
          queryParameters: data);
      return ApiResult.success(
        data: MastersReportResponse.fromJson(response.data),
      );
    } catch (e, s) {
      debugPrint('==> get top masters failure: $e, $s');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<List<PaymentReportData>>> getPaymentReports({
    required String type,
    required DateTime? from,
    required DateTime? to,
  }) async {
    try {
      final data = {
        "time": type == TrKeys.month
            ? "subMonth"
            : type == TrKeys.week
                ? "subWeek"
                : "subYear",
        "date_from": from.toString().substring(0, from.toString().indexOf(" ")),
        "date_to": to.toString().substring(0, to.toString().indexOf(" ")),
        "lang": LocalStorage.getLanguage()?.locale,
      };
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
          '/api/v1/dashboard/${AppHelpers.getUserRole}/booking/reports/payments',
          queryParameters: data);
      return ApiResult.success(data: paymentReportsFromJson(response.data));
    } catch (e, s) {
      debugPrint('==> get top masters failure: $e, $s');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }
}
