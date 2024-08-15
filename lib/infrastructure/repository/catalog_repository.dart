import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';
import '../models/models.dart';
import '../services/services.dart';
import 'package:venderuzmart/domain/handlers/handlers.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';

class CatalogRepository implements CatalogFacade {
  @override
  Future<ApiResult<UnitsPaginateResponse>> getUnits() async {
    final data = {'lang': LocalStorage.getLanguage()?.locale};
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/${AppHelpers.getUserRole}/units/paginate',
        queryParameters: data,
      );
      return ApiResult.success(
        data: UnitsPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get units paginate failure: $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<void>> createCategory({
    required String title,
    required bool active,
    String? image,
    String? description,
    String? type,
    int? parentId,
    int? input,
  }) async {
    final data = {
      'title': {LocalStorage.getLanguage()?.locale ?? 'en': title},
      if (description?.isNotEmpty ?? false)
        'description': {
          LocalStorage.getLanguage()?.locale ?? 'en': description
        },
      if (parentId != null) 'parent_id': parentId,
      'active': 1,
      'type': type ?? 'main',
      if (input != null) 'input': input,
    };
    debugPrint('===> create category request ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: true);
      await client.post(
        '/api/v1/dashboard/${AppHelpers.getUserRole}/categories',
        data: data,
      );
      return const ApiResult.success(data: null);
    } catch (e) {
      debugPrint('==> create category failure: $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<void>> updateCategory({
    required String title,
    required bool active,
    required String id,
    String? image,
    String? description,
    String? type,
    int? input,
    int? parentId,
  }) async {
    final data = {
      'title': {LocalStorage.getLanguage()?.locale ?? 'en': title},
      'active': active ? 1 : 0,
      if (input != null) 'input': input,
      if (description?.isNotEmpty ?? false)
        'description': {
          LocalStorage.getLanguage()?.locale ?? 'en': description
        },
      if (parentId != null) 'parent_id': parentId,
      'type': type ?? 'main',
      if (image != null) 'images[0]': image
    };
    debugPrint('====> update category request ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: true);
      await client.put(
        '/api/v1/dashboard/${AppHelpers.getUserRole}/categories/$id',
        queryParameters: data,
      );
      return const ApiResult.success(data: null);
    } catch (e) {
      debugPrint('==> update category failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<CategoriesPaginateResponse>> getCategories({
    int? page,
    String? query,
    String? type,
    CategoryStatus? status,
    bool? active,
  }) async {
    final data = {
      if (page != null) 'page': page,
      if (query != null) 'search': query,
      if (status != null) 'status': status.name,
      'perPage': 10,
      if (active ?? false) 'active': 1,
      'lang': LocalStorage.getLanguage()?.locale ?? 'en',
      'type': type ?? 'main',
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/${AppHelpers.getUserRole}/categories/paginate',
        queryParameters: data,
      );
      return ApiResult.success(
        data: CategoriesPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get categories paginate failure: $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<SingleCategoryResponse>> fetchSingleCategory(
      String? uuid) async {
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/${AppHelpers.getUserRole}/categories/$uuid',
      );
      return ApiResult.success(
        data: SingleCategoryResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> fetch single category failure: $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }
}
