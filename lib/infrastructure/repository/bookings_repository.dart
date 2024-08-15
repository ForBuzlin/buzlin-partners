import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';
import '../models/models.dart';
import '../services/services.dart';
import 'package:venderuzmart/domain/handlers/handlers.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';

class BookingsRepository implements BookingsFacade {
  @override
  Future<ApiResult<BookingsCalculateResponse>> calculateBooking({
    int? userId,
    DateTime? startDate,
    Map<int, UserData>? serviceMasters,
  }) async {
    final data = {
      "data": [
        ...?serviceMasters?.values.map((e) {
          return {
            "service_master_id": e.serviceMaster?.id ?? 0,
            if (e.serviceMaster?.selectExtras?.isNotEmpty ?? false)
              "service_extras": [
                ...?e.serviceMaster?.selectExtras?.map((e) => e.id)
              ],
          };
        }),
      ],
      "user_id": userId,
      "currency_id": LocalStorage.getSelectedCurrency()?.id,
      "start_date": DateService.dateFormatYMDHm(startDate)
    };
    debugPrint('===> booking calculate request ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: true);
      final res = await client.post(
        '/api/v1/dashboard/${AppHelpers.getUserRole}/bookings/calculate',
        data: data,
      );
      return ApiResult.success(
          data: BookingsCalculateResponse.fromJson(res.data));
    } catch (e) {
      debugPrint('==> booking calculate failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<BookingResponse>> createBooking({
    int? userId,
    int? paymentId,
    DateTime? startDate,
    List<UserData>? serviceMasters,
  }) async {
    final data = {
      "data": [
        for (int i = 0; i < (serviceMasters?.length ?? 0); i++)
          {
            "service_master_id": serviceMasters?[i].serviceMaster?.id,
            if (serviceMasters?[i].serviceMaster?.selectExtras?.isNotEmpty ?? false)
              "service_extras": [
                ...?serviceMasters?[i].serviceMaster?.selectExtras?.map((e) => e.id)
              ],
            if (serviceMasters?[i].note?.isNotEmpty ?? false)
              "note": serviceMasters?[i].note,
            if (serviceMasters?[i].address?.isNotEmpty ?? false)
              "address": serviceMasters?[i].address,
          }
      ],
      "user_id": userId,
      "payment_id": paymentId,
      "currency_id": LocalStorage.getSelectedCurrency()?.id,
      "start_date": DateService.dateFormatYMDHm(startDate)
    };
    debugPrint('===> create booking request ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: true);
      final res = await client.post(
        '/api/v1/dashboard/${AppHelpers.getUserRole}/bookings',
        data: data,
      );
      return ApiResult.success(data: BookingResponse.fromJson(res.data));
    } catch (e) {
      debugPrint('==> create booking failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<SingleBookingResponse>> updateBooking({
    required int? id,
    required int? userId,
    required ServiceData? serviceData,
    required DateTime? startDate,
    required DateTime? endDate,
  }) async {
    final data = {
      "service_master_id": serviceData?.id,
      if (serviceData?.note?.isNotEmpty ?? false) "note": serviceData?.note,
      if (serviceData?.address?.isNotEmpty ?? false)
        "address": serviceData?.address,
      "currency_id": LocalStorage.getSelectedCurrency()?.id,
      "start_date": DateService.dateFormatYMDHm(startDate),
      "end_date": DateService.dateFormatYMDHm(endDate)
    };
    debugPrint('===> update booking request ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: true);
      final res = await client.put(
        '/api/v1/dashboard/${AppHelpers.getUserRole}/bookings/$id',
        data: data,
      );
      return ApiResult.success(data: SingleBookingResponse.fromJson(res.data));
    } catch (e) {
      debugPrint('==> update booking failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<BookingResponse>> getBookings({
    int? page,
    DateTime? startDate,
    DateTime? endDate,
    String? status,
    int? masterId,
  }) async {
    final data = {
      if (page != null) 'page': page,
      if (status != null) 'status': status,
      if (startDate != null) 'start_date': DateService.dateFormatDay(startDate),
      if (endDate != null)
        'end_date': DateService.dateFormatDay(endDate.addDay(1)),
      if (masterId != null) 'master_id': masterId,
      'perPage': (startDate != null && endDate != null) ? 60 : 10,
      'lang': LocalStorage.getLanguage()?.locale ?? 'en',
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/${AppHelpers.getUserRole}/bookings',
        queryParameters: data,
      );
      return ApiResult.success(
        data: BookingResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get bookings paginate failure: $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<SingleBookingResponse>> fetchSingleBooking(int? id) async {
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/${AppHelpers.getUserRole}/bookings/$id',
      );
      return ApiResult.success(
        data: SingleBookingResponse.fromJson(response.data),
      );
    } catch (e, s) {
      debugPrint('==> fetch single booking failure: $e, $s');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult> deleteBooking(int? id) async {
    final data = {'ids[0]': id};
    debugPrint('====> delete booking request ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: true);
      await client.delete(
        '/api/v1/dashboard/${AppHelpers.getUserRole}/bookings/delete',
        queryParameters: data,
      );
      return const ApiResult.success(data: null);
    } catch (e) {
      debugPrint('==> delete booking failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<CheckTimeResponse>> checkTime({
    required DateTime start,
    required List<int> serviceId,
  }) async {
    final data = {
      "start_date": DateService.dateFormatYMDHm(start),
      for (int i = 0; i < serviceId.length; i++)
        "service_master_ids[$i]": serviceId[i],
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      final res = await client.get('/api/v1/rest/master/times-all',
          queryParameters: data);
      return ApiResult.success(data: CheckTimeResponse.fromJson(res.data));
    } catch (e) {
      debugPrint('==> check time failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<OrderStatusResponse>> updateBookingStatus(
      {required BookingStatus status, int? id}) async {
    String? statusText = status == BookingStatus.newOrder ? 'new' : status.name;
    final data = {'status': statusText};
    debugPrint('===> update booking status request ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: true);
      final res = await client.post(
        '/api/v1/dashboard/${AppHelpers.getUserRole}/bookings/$id/status/update',
        data: data,
      );
      return ApiResult.success(data: OrderStatusResponse.fromJson(res.data));
    } catch (e) {
      debugPrint('==> delete booking failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<SingleBookingResponse>> updateBookingNotes({
    required int? id,
    required String? note,
  }) async {
    final data = {"note": note};
    debugPrint('===> update booking notes request ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: true);
      final res = await client.post(
        '/api/v1/dashboard/${AppHelpers.getUserRole}/bookings/$id/notes/update',
        data: data,
      );
      return ApiResult.success(data: SingleBookingResponse.fromJson(res.data));
    } catch (e) {
      debugPrint('==> update booking notes failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }
}
