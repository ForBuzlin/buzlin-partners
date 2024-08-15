import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/domain/handlers/handlers.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class FormOptionRepository implements FormOptionFacade {
  @override
  Future<ApiResult<SingleFormOptionsResponse>> getFormOptionsDetails(
      int? id) async {
    final data = {
      'lang': LocalStorage.getLanguage()?.locale ?? 'en',
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/${AppHelpers.getUserRole}/form-options/$id',
        queryParameters: data,
      );
      return ApiResult.success(
        data: SingleFormOptionsResponse.fromJson(response.data),
      );
    } catch (e, s) {
      debugPrint('==> get form options details failure: $e,$s');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<FormOptionsResponse>> getFormOptions({int? page}) async {
    final data = {
      'page': page,
      'perPage': 10,
      'lang': LocalStorage.getLanguage()?.locale ?? 'en',
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/${AppHelpers.getUserRole}/form-options',
        queryParameters: data,
      );
      return ApiResult.success(
        data: FormOptionsResponse.fromJson(response.data),
      );
    } catch (e, s) {
      debugPrint('==> get all form-options failure: $e,$s');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<FormOptionsResponse>> getFormParents({int? page}) async {
    final data = {
      'page': page,
      'perPage': 10,
      'lang': LocalStorage.getLanguage()?.locale ?? 'en',
      if (AppHelpers.getUserRole == TrKeys.master) 'master_form_options': 1,
      if (AppHelpers.getUserRole == TrKeys.seller) 'shop_form_options': 1,
      if (AppHelpers.getUserRole == TrKeys.master) 'shop_id': LocalStorage.getUser()?.invite?.shopId,
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/${AppHelpers.getUserRole}/form-options',
        queryParameters: data,
      );
      return ApiResult.success(
        data: FormOptionsResponse.fromJson(response.data),
      );
    } catch (e, s) {
      debugPrint('==> get all form-options failure: $e,$s');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<SingleFormOptionsResponse>> addForm({
    required String title,
    required int serviceId,
    required bool required,
    required bool active,
    required String description,
    required List<QuestionData> questions,
  }) async {
    final data = {
      'title': {LocalStorage.getLanguage()?.locale ?? 'en': title},
      if (description.isNotEmpty)
        'description': {
          LocalStorage.getLanguage()?.locale ?? 'en': description
        },
      'required': required ? 1 : 0,
      'active': active ? 1 : 0,
      'service_master_id': serviceId,
      'data': questions.map((e) => e.toJson()).toList(),
    };
    debugPrint('====> create form-options request ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: true);
      final res = await client.post(
        '/api/v1/dashboard/${AppHelpers.getUserRole}/form-options',
        data: data,
      );
      return ApiResult.success(
          data: SingleFormOptionsResponse.fromJson(res.data));
    } catch (e) {
      debugPrint('==> create form-options failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<SingleFormOptionsResponse>> updateForm({
    required int? id,
    required int? serviceId,
    required bool required,
    required bool active,
    required String title,
    required String description,
    required List<QuestionData> questions,
  }) async {
    final data = {
      'title': {LocalStorage.getLanguage()?.locale ?? 'en': title},
      if (description.isNotEmpty)
        'description': {
          LocalStorage.getLanguage()?.locale ?? 'en': description
        },
      'required': required ? 1 : 0,
      'active': active ? 1 : 0,
      'service_master_id': serviceId,
      'data': questions.map((e) => e.toJson()).toList(),
    };
    debugPrint('====> update form-options request ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: true);
      final res = await client.put(
        '/api/v1/dashboard/${AppHelpers.getUserRole}/form-options/$id',
        data: data,
      );
      return ApiResult.success(
          data: SingleFormOptionsResponse.fromJson(res.data));
    } catch (e) {
      debugPrint('==> update form-options failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<void>> deleteFormOption(int? id) async {
    final data = {
      'ids': [id]
    };
    debugPrint('====> delete form-options request ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: true);
      await client.delete(
        '/api/v1/dashboard/${AppHelpers.getUserRole}/form-options/delete',
        data: data,
      );
      return const ApiResult.success(data: null);
    } catch (e) {
      debugPrint('==> delete form-options failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }
}
