import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';
import 'package:venderuzmart/domain/handlers/handlers.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

class MastersRepository implements MastersFacade {
  @override
  Future<ApiResult<UsersPaginateResponse>> getMasters({
    String? query,
    String? inviteStatus,
    int? page,
    int? serviceId,
  }) async {
    final data = {
      if (query?.isNotEmpty ?? false) 'search': query,
      'perPage': 10,
      if (page != null) 'page': page,
      'sort': 'desc',
      'column': 'created_at',
      if (inviteStatus != null) 'invite_status': inviteStatus,
      'role': "master",
      if (serviceId != null) 'service_id': serviceId,
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
        serviceId != null
            ? '/api/v1/rest/masters'
            : '/api/v1/dashboard/${AppHelpers.getUserRole}/shop/users/paginate',
        queryParameters: data,
      );
      return ApiResult.success(
        data: UsersPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> search users failure: $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult> updateMasterStatus({
    required int? id,
    required String status,
  }) async {
    final data = {'status': status};
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.post(
        '/api/v1/dashboard/${AppHelpers.getUserRole}/shops/invites/$id/status/change',
        data: data,
      );
      return ApiResult.success(
        data: response.data,
      );
    } catch (e) {
      debugPrint('==> update master status failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<ProfileResponse>> updateMaster(UserData? user) async {
    final data = {
      "firstname": user?.firstname,
      "lastname": user?.lastname,
      "phone": user?.phone,
      "gender": user?.gender,
      "img": user?.img,
    };
    debugPrint('===> update master info ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.put(
        '/api/v1/dashboard/${AppHelpers.getUserRole}/users/${user?.uuid}',
        data: data,
      );
      return ApiResult.success(
        data: ProfileResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> update master info failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<ProfileResponse>> getMastersDetails(String? uuid) async {
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/${AppHelpers.getUserRole}/users/$uuid',
      );
      return ApiResult.success(
        data: ProfileResponse.fromJson(response.data),
      );
    } catch (e) {
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<void>> updateClosedDays(
      {required List<DateTime> days, int? masterId}) async {
    final data = {
      for (int i = 0; i < days.length; i++)
        'dates': days.map((e) => DateService.dateFormatDay(e)).toList(),
      "master_id": masterId
    };
    debugPrint('====> update master closed days ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: true);
      await client.put(
        '/api/v1/dashboard/${AppHelpers.getUserRole}/master-closed-dates/$masterId',
        data: data,
      );
      return const ApiResult.success(data: null);
    } catch (e) {
      debugPrint('==> update master closed days failure: $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<void>> updateDisableTimes({
    required DisableTimes? time,
    int? id,
  }) async {
    final data = {
      'master_id': time?.masterId,
      'title': {
        LocalStorage.getLanguage()?.locale ?? 'en': time?.translation?.title
      },
      if (time?.translation?.description?.isNotEmpty ?? false)
        'description': {
          LocalStorage.getLanguage()?.locale ?? 'en':
              time?.translation?.description
        },
      'from': time?.from,
      'to': time?.to,
      'date': DateService.dateFormatDay(time?.date),
      'repeats': time?.repeats,
      if (time?.repeats == 'custom')
        'custom_repeat_type': time?.customRepeatType,
      if (time?.repeats == 'custom')
        'custom_repeat_value': time?.customRepeatValue,
      'end_type': time?.endType,
      if (time?.endType != 'never') 'end_value': time?.endValue,
      'can_booking': (time?.canBooking ?? true) ? 1 : 0,
    };
    debugPrint('====> update master disable time request: ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: true);
      await client.put(
        '/api/v1/dashboard/${AppHelpers.getUserRole}/master-disabled-times/$id',
        data: data,
      );
      return const ApiResult.success(data: null);
    } catch (e) {
      debugPrint('==> update master disable time failure: $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<void>> addDisableTimes({
    required DisableTimes? time,
  }) async {
    final data = {
      'master_id': time?.masterId,
      'title': {
        LocalStorage.getLanguage()?.locale ?? 'en': time?.translation?.title
      },
      if (time?.translation?.description?.isNotEmpty ?? false)
        'description': {
          LocalStorage.getLanguage()?.locale ?? 'en':
              time?.translation?.description
        },
      'from': time?.from,
      'to': time?.to,
      'date': DateService.dateFormatDay(time?.date),
      'repeats': time?.repeats,
      if (time?.repeats == 'custom')
        'custom_repeat_type': time?.customRepeatType,
      if (time?.repeats == 'custom')
        'custom_repeat_value': time?.customRepeatValue,
      'end_type': time?.endType,
      if (time?.endType != 'never') 'end_value': time?.endValue,
      'can_booking': (time?.canBooking ?? true) ? 1 : 0,
    };
    debugPrint('====> add master disable time request: ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: true);
      await client.post(
        '/api/v1/dashboard/${AppHelpers.getUserRole}/master-disabled-times',
        data: data,
      );
      return const ApiResult.success(data: null);
    } catch (e) {
      debugPrint('==> add master disable time failure: $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<void>> createDisableTimes(DisableTimes? time) async {
    final data = {
      'master_id': time?.masterId,
      'title': {
        LocalStorage.getLanguage()?.locale ?? 'en': time?.translation?.title
      },
      if (time?.translation?.description?.isNotEmpty ?? false)
        'description': {
          LocalStorage.getLanguage()?.locale ?? 'en':
              time?.translation?.description
        },
      'from': time?.from,
      'to': time?.to,
      'date': DateService.dateFormatDay(time?.date),
      'repeats': time?.repeats,
      if (time?.repeats == 'custom')
        'custom_repeat_type': time?.customRepeatType,
      if (time?.repeats == 'custom')
        'custom_repeat_value': time?.customRepeatValue,
      'end_type': time?.endType,
      if (time?.endType != 'never') 'end_value': time?.endValue,
      'can_booking': (time?.canBooking ?? true) ? 1 : 0,
    };
    debugPrint('====> create master disable time request: ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: true);
      await client.post(
        '/api/v1/dashboard/${AppHelpers.getUserRole}/master-disabled-times/',
        data: data,
      );
      return const ApiResult.success(data: null);
    } catch (e) {
      debugPrint('==> create master disable time failure: $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<ClosedDatesResponse>> getClosedDays({
    int? masterId,
    DateTime? to,
    DateTime? from,
  }) async {
    final data = {
      'master_id': masterId,
      if (to != null) 'date_to': DateService.dateFormatDay(to),
      if (from != null) 'date_from': DateService.dateFormatDay(from),
    };
    debugPrint('====> get closed days body: ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: true);
      final res = await client.get(
        '/api/v1/dashboard/${AppHelpers.getUserRole}/master-closed-dates/',
        queryParameters: data,
      );
      return ApiResult.success(data: ClosedDatesResponse.fromJson(res.data));
    } catch (e) {
      debugPrint('==> get closed days failure: $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<DisableTimesResponse>> getDisableTimes(
      {int? masterId, int? page}) async {
    final data = {
      'master_id': masterId,
      if (page != null) 'page': page,
      'perPage': 10
    };
    debugPrint('====> get closed days body: ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: true);
      final res = await client.get(
        '/api/v1/dashboard/${AppHelpers.getUserRole}/master-disabled-times',
        queryParameters: data,
      );
      return ApiResult.success(data: DisableTimesResponse.fromJson(res.data));
    } catch (e) {
      debugPrint('==> get closed days failure: $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<SingleDisableTimeResponse>> getDisableTimeDetails(
      int? id) async {
    try {
      final client = dioHttp.client(requireAuth: true);
      final res = await client.get(
        '/api/v1/dashboard/${AppHelpers.getUserRole}/master-disabled-times/$id',
      );
      return ApiResult.success(
        data: SingleDisableTimeResponse.fromJson(res.data),
      );
    } catch (e) {
      debugPrint('==> get closed days failure: $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<void>> updateWorkingDays({
    required List<WorkingDay> workingDays,
    int? id,
  }) async {
    List<Map<String, dynamic>> days = [];
    for (final workingDay in workingDays) {
      final data = {
        'day': workingDay.day,
        'from': workingDay.from?.replaceAll('-', ':'),
        'to': workingDay.to?.replaceAll('-', ':'),
        'disabled': workingDay.disabled ?? false
      };
      days.add(data);
    }

    final data = {'dates': days, 'user_id': id};
    debugPrint('====> update master working days ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: true);
      await client.put(
        '/api/v1/dashboard/${AppHelpers.getUserRole}/user-working-days/$id ',
        data: data,
      );
      return const ApiResult.success(data: null);
    } catch (e) {
      debugPrint('==> update master working days failure: $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<void>> deleteDisableTimes(int? id) async {
    final data = {
      'ids': [id]
    };
    debugPrint('====> delete disable times request ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: true);
      await client.delete(
        '/api/v1/dashboard/${AppHelpers.getUserRole}/master-disabled-times/delete',
        data: data,
      );
      return const ApiResult.success(data: null);
    } catch (e) {
      debugPrint('==> delete disable times failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }
  @override
  Future<ApiResult<List<Galleries>>> getGalleries() async {
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/${AppHelpers.getUserRole}/galleries',
      );
      return ApiResult.success(
        data: response.data["data"] == null ? [] : List<Galleries>.from(response.data["data"]!.map((x) => Galleries.fromJson(x))),
      );
    } catch (e) {
      debugPrint('==> get master galleries failure: $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult> setGalleries({
    required List<String> images,
    List<String>? previews,
  }) async {
    try {
      final data = {
        "active": 1,
        "images": images,
        if (previews?.isNotEmpty ?? false) 'previews': previews,
      };
      debugPrint('====> set master galleries request ${jsonEncode(data)}');
      final client = dioHttp.client(requireAuth: true);
      final response = await client.post(
        '/api/v1/dashboard/${AppHelpers.getUserRole}/galleries',
        data: data,
      );
      return ApiResult.success(data: response.data);
    } catch (e) {
      debugPrint('==> set master galleries failure: $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }
}
