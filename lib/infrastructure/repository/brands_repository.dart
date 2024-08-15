import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';
import 'package:venderuzmart/domain/handlers/handlers.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

class BrandsRepository extends BrandsFacade {
  @override
  Future<ApiResult<BrandsPaginateResponse>> searchBrands(String? query) async {
    final data = {'search': query};
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
        '/api/v1/rest/brands/paginate',
        queryParameters: data,
      );
      return ApiResult.success(
        data: BrandsPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> search brands failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<BrandsPaginateResponse>> getAllBrands({
    bool isActive = true,
    int? page,
  }) async {
    final data = {
      'page': page,
      'perPage': 12,
      'lang': LocalStorage.getLanguage()?.locale ?? 'en',
      if (isActive) 'status': 'published'
    };
    try {
      final client = dioHttp.client(requireAuth: !isActive);
      final response = await client.get(
        isActive
            ? '/api/v1/rest/brands/paginate'
            : '/api/v1/dashboard/seller/brands/paginate',
        queryParameters: data,
      );
      return ApiResult.success(
        data: BrandsPaginateResponse.fromJson(response.data),
      );
    } catch (e, s) {
      debugPrint('==> get all brands failure: $e,$s');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<void>> deleteBrand(int? brandId) async {
    final data = {
      'ids': [brandId]
    };
    debugPrint('====> delete brand request ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: true);
      await client.delete(
        '/api/v1/dashboard/seller/brands/delete',
        data: data,
      );
      return const ApiResult.success(data: null);
    } catch (e) {
      debugPrint('==> delete brand failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<void>> addBrand({
    required String title,
    required bool active,
    String? image,
  }) async {
    final data = {
      'title': title,
      'active': active ? 1 : 0,
      if (image != null) 'images[0]': image
    };
    debugPrint('====> add brand request ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: true);
      await client.post(
        '/api/v1/dashboard/seller/brands',
        queryParameters: data,
      );
      return const ApiResult.success(data: null);
    } catch (e) {
      debugPrint('==> add brand failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<void>> updateBrand({
    required String title,
    required bool active,
    required int id,
    String? image,
  }) async {
    final data = {
      'title': title,
      'active': active ? 1 : 0,
      if (image != null) 'images[0]': image
    };
    debugPrint('====> update brand request ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: true);
      await client.put(
        '/api/v1/dashboard/seller/brands/$id',
        queryParameters: data,
      );
      return const ApiResult.success(data: null);
    } catch (e) {
      debugPrint('==> update brand failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }
}
