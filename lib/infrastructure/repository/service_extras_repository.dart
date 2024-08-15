import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';
import '../../domain/interface/service_extras_facade.dart';
import '../models/models.dart';
import '../services/services.dart';
import 'package:venderuzmart/domain/handlers/handlers.dart';

class ServiceExtrasRepository implements ServiceExtrasFacade {
  @override
  Future<ApiResult<ServiceExtrasResponse>> createExtras({
    required ServiceExtraRequest request,
  }) async {
    debugPrint(
        '===> create service extras request ${jsonEncode(request.toJson())}');
    try {
      final client = dioHttp.client(requireAuth: true);
      final res = await client.post(
        '/api/v1/dashboard/${AppHelpers.getUserRole}/service-extras/',
        data: request.toJson(),
      );
      return ApiResult.success(data: ServiceExtrasResponse.fromJson(res.data));
    } catch (e) {
      debugPrint('==> create service extras failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<ServiceExtrasResponse>> updateExtras({
    required int? id,
    required ServiceExtraRequest request,
  }) async {
    debugPrint(
        '===> update service extras request ${jsonEncode(request.toJson())}');
    try {
      final client = dioHttp.client(requireAuth: true);
      final res = await client.put(
        '/api/v1/dashboard/${AppHelpers.getUserRole}/service-extras/$id',
        data: request.toJson(),
      );
      return ApiResult.success(data: ServiceExtrasResponse.fromJson(res.data));
    } catch (e) {
      debugPrint('==> update service extras failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<ServiceExtrasPaginateResponse>> getExtras(
      {int? page, int? serviceId}) async {
    final data = {
      if (page != null) 'page': page,
      if (serviceId != null) 'service_id': serviceId,
      'perPage': 10,
      'lang': LocalStorage.getLanguage()?.locale ?? 'en',
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/${AppHelpers.getUserRole}/service-extras',
        queryParameters: data,
      );
      return ApiResult.success(
        data: ServiceExtrasPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get service extras paginate failure: $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<ServiceExtrasResponse>> fetchSingleExtras(int? id) async {
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/${AppHelpers.getUserRole}/service-extras/$id',
      );
      return ApiResult.success(
        data: ServiceExtrasResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> fetch single service extras failure: $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult> deleteExtras(int? id) async {
    final data = {
      'ids': [id]
    };
    debugPrint('====> delete service extras request ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: true);
      await client.delete(
        '/api/v1/dashboard/${AppHelpers.getUserRole}/service-extras/delete',
        data: data,
      );
      return const ApiResult.success(data: null);
    } catch (e) {
      debugPrint('==> delete service extras failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }
}
