import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';
import 'package:venderuzmart/domain/handlers/handlers.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

class StoriesRepository extends StoriesFacade {
  @override
  Future<ApiResult<StoriesResponse>> getStories({
    int? page,
  }) async {
    final data = {
      'page': page,
      'perPage': 12,
      'lang': LocalStorage.getLanguage()?.locale ?? 'en',
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
        "/api/v1/dashboard/seller/stories",
        queryParameters: data,
      );
      return ApiResult.success(
        data: StoriesResponse.fromJson(response.data),
      );
    } catch (e, s) {
      debugPrint('==> get stories failure: $e,$s');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<void>> deleteStories(int id) async {
    final data = {
      'ids': [id]
    };
    debugPrint('====> delete brand request ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: true);
      await client.delete(
        '/api/v1/dashboard/seller/stories/delete',
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
  Future<ApiResult<void>> createStories(
      {required List<String> img, int? id}) async {
    final data = {
      for (int i = 0; i < img.length; i++) 'file_urls[$i]': img[i],
      if (id != null) 'product_id': id
    };
    debugPrint('====> add stories request ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: true);
      await client.post(
        '/api/v1/dashboard/seller/stories',
        queryParameters: data,
      );
      return const ApiResult.success(data: null);
    } catch (e) {
      debugPrint('==> create stories failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<void>> updateStories(
      {required List<String> img, int? id, required int storyId}) async {
    final data = {
      for (int i = 0; i < img.length; i++) 'file_urls[$i]': img[i],
      if (id != null) 'product_id': id
    };
    debugPrint('====> update stories request ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: true);
      await client.put(
        '/api/v1/dashboard/seller/stories/$storyId',
        queryParameters: data,
      );
      return const ApiResult.success(data: null);
    } catch (e) {
      debugPrint('==> update stories failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }
}
