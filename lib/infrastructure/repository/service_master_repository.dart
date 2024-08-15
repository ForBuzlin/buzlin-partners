import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';
import '../models/models.dart';
import '../services/services.dart';
import 'package:venderuzmart/domain/handlers/handlers.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';

class ServiceMasterRepository implements ServiceMasterFacade {
  @override
  Future<ApiResult<ServiceResponse>> createService({
    required int? masterId,
    required num price,
    required int pause,
    required int interval,
    required num discount,
    required num commissionFee,
    required int serviceId,
  }) async {
    final data = {
      'price': price,
      'interval': interval,
      'pause': pause,
      'service_id': serviceId,
      'master_id': masterId,
      'discount': discount,
      'commission_fee': commissionFee,
      'shop_id': AppHelpers.getUserRole == TrKeys.master
          ? LocalStorage.getUser()?.invite?.shopId
          : LocalStorage.getShop()?.id,
      'active': 1,
    };
    debugPrint('===> create service request ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: true);
      final res = await client.post(
        '/api/v1/dashboard/${AppHelpers.getUserRole}/service-masters',
        data: data,
      );
      return ApiResult.success(data: ServiceResponse.fromJson(res.data));
    } catch (e) {
      debugPrint('==> create service failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<ServiceResponse>> updateService({
    required int? id,
    required num price,
    required int pause,
    required int interval,
    required num discount,
    required num commissionFee,
    required int serviceId,
    required int masterId,
  }) async {
    final data = {
      'price': price,
      'interval': interval,
      'pause': pause,
      'discount': discount,
      'commission_fee': commissionFee,
      'shop_id': AppHelpers.getUserRole == TrKeys.master
          ? LocalStorage.getUser()?.invite?.shopId
          : LocalStorage.getShop()?.id,
      'service_id': serviceId,
      'active': 1,
    };
    debugPrint('===> update service request ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: true);
      final res = await client.put(
        '/api/v1/dashboard/${AppHelpers.getUserRole}/service-masters/$id',
        data: data,
      );
      return ApiResult.success(data: ServiceResponse.fromJson(res.data));
    } catch (e) {
      debugPrint('==> update service failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<ServicePaginateResponse>> getServices({
    int? page,
    int? categoryId,
    num? priceFrom,
    num? priceTo,
    int? intervalFrom,
    int? intervalTo,
    int? pauseFrom,
    int? pauseTo,
    int? masterId,
    String? query,
    String? status,
    bool? active,
  }) async {
    final data = {
      if (page != null) 'page': page,
      if (query != null) 'search': query,
      if (status != null) 'status': status,
      if (categoryId != null) 'category_id': categoryId,
      if (priceFrom != null) 'price_from': priceFrom,
      if (priceTo != null) 'price_to': priceTo,
      if (intervalFrom != null) 'interval_from': priceFrom,
      if (intervalTo != null) 'interval_to': priceTo,
      if (pauseFrom != null) 'pause_from': pauseFrom,
      if (pauseTo != null) 'pause_to': pauseTo,
      if (masterId != null) 'master_id': masterId,
      if (active != null) 'active': active ? 1 : 0,
      'perPage': 10,
      'lang': LocalStorage.getLanguage()?.locale ?? 'en',
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/${AppHelpers.getUserRole}/service-masters',
        queryParameters: data,
      );
      return ApiResult.success(
        data: ServicePaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get services paginate failure: $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<ServiceResponse>> fetchSingleService(int? id) async {
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/${AppHelpers.getUserRole}/service-masters/$id',
      );
      return ApiResult.success(
        data: ServiceResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> fetch single services failure: $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult> deleteService(int? id) async {
    final data = {'ids[0]': id};
    debugPrint('====> delete service request ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: true);
      await client.delete(
        '/api/v1/dashboard/${AppHelpers.getUserRole}/service-masters/delete',
        queryParameters: data,
      );
      return const ApiResult.success(data: null);
    } catch (e) {
      debugPrint('==> delete service failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }
}
