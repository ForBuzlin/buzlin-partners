import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';
import 'package:venderuzmart/domain/handlers/handlers.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import '../services/services.dart';

class MembershipRepository implements MembershipFacade {
  @override
  Future<ApiResult<SingleMembershipResponse>> getMembershipsDetails(
      int? id) async {
    final data = {
      'lang': LocalStorage.getLanguage()?.locale ?? 'en',
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/seller/memberships/$id',
        queryParameters: data,
      );
      return ApiResult.success(
        data: SingleMembershipResponse.fromJson(response.data),
      );
    } catch (e, s) {
      debugPrint('==> get memberships details failure: $e,$s');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<MembershipResponse>> getMemberships({int? page}) async {
    final data = {
      'page': page,
      'perPage': 10,
      'lang': LocalStorage.getLanguage()?.locale ?? 'en',
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/seller/memberships',
        queryParameters: data,
      );
      return ApiResult.success(
        data: MembershipResponse.fromJson(response.data),
      );
    } catch (e, s) {
      debugPrint('==> get all memberships failure: $e,$s');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<SingleMembershipResponse>> addMembership({
    required String title,
    required String description,
    required String term,
    required Color? color,
    required String? time,
    required List<int?> services,
    required num price,
    required int? sessions,
  }) async {
    final data = {
      'title': {LocalStorage.getLanguage()?.locale ?? 'en': title},
      'description': {LocalStorage.getLanguage()?.locale ?? 'en': description},
      'term': {LocalStorage.getLanguage()?.locale ?? 'en': term},
      'color': color?.toHex(),
      'time': time,
      'price': price,
      'services': [
        for (int i = 0; i < services.length; i++) {'service_id': services[i]}
      ],
      'sessions': sessions != null ? 1 : 2,
      if (sessions != null) 'sessions_count': sessions,
    };
    debugPrint('====> create memberships request ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: true);
      final res = await client.post(
        '/api/v1/dashboard/seller/memberships',
        data: data,
      );
      return ApiResult.success(
          data: SingleMembershipResponse.fromJson(res.data));
    } catch (e) {
      debugPrint('==> create memberships failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<SingleMembershipResponse>> updateMembership({
    required String title,
    required String description,
    required String term,
    required Color? color,
    required String? time,
    required List<int?> services,
    required num price,
    required int? sessions,
    required int? id,
  }) async {
    final data = {
      'title': {LocalStorage.getLanguage()?.locale ?? 'en': title},
      'description': {LocalStorage.getLanguage()?.locale ?? 'en': description},
      'term': {LocalStorage.getLanguage()?.locale ?? 'en': term},
      'color': color?.toHex(),
      'time': time,
      'price': price,
      'services': [
        for (int i = 0; i < services.length; i++) {'service_id': services[i]}
      ],
      'sessions': sessions != null ? 1 : 2,
      if (sessions != null) 'sessions_count': sessions,
    };
    debugPrint('====> update memberships request ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: true);
      final res = await client.put(
        '/api/v1/dashboard/seller/memberships/$id',
        data: data,
      );
      return ApiResult.success(
          data: SingleMembershipResponse.fromJson(res.data));
    } catch (e) {
      debugPrint('==> update memberships failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<void>> deleteMembership(int? id) async {
    final data = {
      'ids': [id]
    };
    debugPrint('====> delete memberships request ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: true);
      await client.delete(
        '/api/v1/dashboard/seller/memberships/delete',
        data: data,
      );
      return const ApiResult.success(data: null);
    } catch (e) {
      debugPrint('==> delete memberships failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<UserMembershipsResponse>> getUserMemberships({
    int? page,
    String? search,
  }) async {
    final data = {
      'page': page,
      'perPage': 10,
      'lang': LocalStorage.getLanguage()?.locale ?? 'en',
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/seller/user-memberships',
        queryParameters: data,
      );
      return ApiResult.success(
        data: UserMembershipsResponse.fromJson(response.data),
      );
    } catch (e, s) {
      debugPrint('==> get user memberships failure: $e,$s');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

}
