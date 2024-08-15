import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';
import 'package:venderuzmart/domain/handlers/handlers.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

class LooksRepository extends LooksFacade {
  @override
  Future<ApiResult<LooksResponse>> getLooks({
    int? page,
  }) async {
    final data = {
      'page': page,
      'perPage': 10,
      'type': 'look',
      'lang': LocalStorage.getLanguage()?.locale ?? 'en',
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/seller/banners/paginate',
        queryParameters: data,
      );
      return ApiResult.success(
        data: LooksResponse.fromJson(response.data),
      );
    } catch (e,s) {
      debugPrint('==> get all looks failure: $e,$s');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<void>> deleteLooks(int? id) async {
    final data = {
      'ids': [id]
    };
    debugPrint('====> delete looks request ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: true);
      await client.delete(
        '/api/v1/dashboard/seller/banners/delete',
        data: data,
      );
      return const ApiResult.success(data: null);
    } catch (e) {
      debugPrint('==> delete looks failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<SingleLooksResponse>> addLooks({
    required bool active,
    required String title,
    required String description,
    required List<dynamic> products,
    String? image,
  }) async {
    final data = {
      'type': "look",
      'active': active ? 1 : 0,
      'title': {LocalStorage.getLanguage()?.locale ?? 'en': title},
      if (description.isNotEmpty)
        'description': {
          LocalStorage.getLanguage()?.locale ?? 'en': description
        },
      for (int i = 0; i < products.length; i++) 'products[$i]': products[i],
      if (image != null) 'images[0]': image
    };
    debugPrint('====> add looks request ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: true);
      final res = await client.post(
        '/api/v1/dashboard/seller/banners/',
        queryParameters: data,
      );
      return ApiResult.success(data: SingleLooksResponse.fromJson(res.data));
    } catch (e) {
      debugPrint('==> add looks failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<SingleLooksResponse>> updateLooks({
    required bool active,
    required String title,
    required String description,
    required List<dynamic> products,
    String? image,
    required int id,
  }) async {
    final data = {
      'type': "look",
      'active': active ? 1 : 0,
      'title': {LocalStorage.getLanguage()?.locale ?? 'en': title},
      if (description.isNotEmpty)
        'description': {
          LocalStorage.getLanguage()?.locale ?? 'en': description
        },
      for (int i = 0; i < products.length; i++) 'products[$i]': products[i],
      if (image != null) 'images[0]': image
    };
    debugPrint('====> update looks request ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: true);
      final res = await client.put(
        '/api/v1/dashboard/seller/banners/$id',
        queryParameters: data,
      );
      return ApiResult.success(data: SingleLooksResponse.fromJson(res.data));
    } catch (e) {
      debugPrint('==> update looks failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<SingleLooksResponse>> getLooksDetails({
    required int id,
  }) async {
    final data = {
      'type': 'look',
      'lang': LocalStorage.getLanguage()?.locale ?? 'en',
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/seller/banners/$id',
        queryParameters: data,
      );
      return ApiResult.success(
        data: SingleLooksResponse.fromJson(response.data),
      );
    } catch (e, s) {
      debugPrint('==> get looks details failure: $e,$s');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }
}
