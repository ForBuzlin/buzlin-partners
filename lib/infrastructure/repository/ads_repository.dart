import 'package:flutter/material.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';
import 'package:venderuzmart/domain/handlers/handlers.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

import '../services/services.dart';

class AdsRepository implements AdsFacade {
  @override
  Future<ApiResult> addAdsPackages(
      {required int? id, required List productIds}) async {
    final data = {
      'ads_package_id': id,
      for (int i = 0; i < productIds.length; i++)
        'product_ids[$i]': productIds[i],
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.post(
        '/api/v1/dashboard/seller/shop-ads-packages',
        queryParameters: data,
      );
      return ApiResult.success(data: AdsResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> purchase ads failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<AdsResponse>> getAds({required int page}) async {
    final data = {
      'perPage': 10,
      'page': page,
      'sort': 'desc',
      'column': 'created_at',
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/seller/shop-ads-packages',
        queryParameters: data,
      );
      return ApiResult.success(data: AdsResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> get ads failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<AdsPackageResponse>> getAdsPackages(
      {required int page}) async {
    final data = {
      'perPage': 10,
      'page': page,
      'lang': LocalStorage.getLanguage()?.locale,
      'active': 1,
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/seller/ads-packages',
        queryParameters: data,
      );
      return ApiResult.success(
          data: AdsPackageResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> get ads packages failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult> purchaseAds({required int id}) async {
    final data = {
      'payment_sys_id': 2,
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.post(
        '/api/v1/payments/ads/$id/transactions',
        data: data,
      );
      return ApiResult.success(data: response.data);
    } catch (e) {
      debugPrint('==> purchase ads failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }
}
