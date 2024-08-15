import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';
import '../models/data/faq_data.dart';
import '../models/models.dart';
import '../services/services.dart';
import 'package:venderuzmart/domain/handlers/handlers.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';

class ServiceRepository implements ServiceFacade {
  @override
  Future<ApiResult<ServiceResponse>> createService({
    required num price,
    required int pause,
    required String type,
    required String gender,
    required int interval,
    required String title,
    required int categoryId,
    required List<String> images,
    String? description,
  }) async {
    final data = {
      'title': {LocalStorage.getLanguage()?.locale ?? 'en': title},
      if (description?.isNotEmpty ?? false)
        'description': {
          LocalStorage.getLanguage()?.locale ?? 'en': description
        },
      'images': images,
      'price': price,
      'interval': interval,
      'pause': pause,
      'category_id': categoryId,
      'type': type,
      'gender': DropDownValues.genderList.indexOf(gender) + 1,
    };
    debugPrint('===> create service request ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: true);
      final res = await client.post(
        '/api/v1/dashboard/${AppHelpers.getUserRole}/services',
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
    required String type,
    required String gender,
    required int interval,
    required String title,
    required int categoryId,
    required List<String> images,
    String? description,
  }) async {
    final data = {
      'title': {LocalStorage.getLanguage()?.locale ?? 'en': title},
      if (description?.isNotEmpty ?? false)
        'description': {
          LocalStorage.getLanguage()?.locale ?? 'en': description
        },
      'images': images,
      'price': price,
      'interval': interval,
      'pause': pause,
      'type': type,
      'gender': DropDownValues.genderList.indexOf(gender) + 1,
      'category_id': categoryId,
    };
    debugPrint('===> update service request ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: true);
      final res = await client.put(
        '/api/v1/dashboard/${AppHelpers.getUserRole}/services/$id',
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
      if (active != null) 'active': active ? 1 : 0,
      'perPage': 10,
      'lang': LocalStorage.getLanguage()?.locale ?? 'en',
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/${AppHelpers.getUserRole}/services',
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
        '/api/v1/dashboard/${AppHelpers.getUserRole}/services/$id',
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
    final data = {
      'ids': [id]
    };
    debugPrint('====> delete service request ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: true);
      await client.delete(
        '/api/v1/dashboard/${AppHelpers.getUserRole}/services/delete',
        data: data,
      );
      return const ApiResult.success(data: null);
    } catch (e) {
      debugPrint('==> delete product failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult> updateFaqs({
    required int? serviceId,
    required List<FaqData> faqs,
  }) async {
    List<Map<String, dynamic>> content = [];
    for (int i = 0; i < faqs.length; i++) {
      final data = {
        if (faqs[i].type != null) 'type': faqs[i].type,
        if (faqs[i].translation?.question?.isNotEmpty ?? false)
          'question': {
            LocalStorage.getLanguage()?.locale: faqs[i].translation?.question
          },
        if (faqs[i].translation?.answer != null)
          'answer': {
            LocalStorage.getLanguage()?.locale: faqs[i].translation?.answer
          },
        'active': 1,
      };
      content.add(data);
    }
    final data = {'faqs': content};
    debugPrint('====> faqs adding request ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: true);
      await client.post(
        '/api/v1/dashboard/seller/services/$serviceId/faqs',
        data: data,
      );
      return const ApiResult.success(data: null);
    } catch (e) {
      debugPrint('==> add faqs failure: $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }
}
