import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';
import 'package:venderuzmart/domain/handlers/handlers.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/models/response/gift_card_response.dart';
import 'package:venderuzmart/infrastructure/models/response/single_gift_card_response.dart';
import '../../domain/interface/gift_card_facade.dart';
import '../services/services.dart';

class GiftCardRepository implements GiftCardFacade {
  @override
  Future<ApiResult<SingleGiftCardResponse>> getGiftCardDetails(
      int? id) async {
    final data = {
      'lang': LocalStorage.getLanguage()?.locale ?? 'en',
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/seller/gift-carts/$id',
        queryParameters: data,
      );
      return ApiResult.success(
        data: SingleGiftCardResponse.fromJson(response.data),
      );
    } catch (e, s) {
      debugPrint('==> get gift card details failure: $e,$s');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<GiftCardResponse>> getGiftCarts({int? page}) async {
    final data = {
      'page': page,
      'perPage': 10,
      'lang': LocalStorage.getLanguage()?.locale ?? 'en',
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/seller/gift-carts',
        queryParameters: data,
      );
      return ApiResult.success(
        data: GiftCardResponse.fromJson(response.data),
      );
    } catch (e, s) {
      debugPrint('==> get all memberships failure: $e,$s');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }
  //
  @override
  Future<ApiResult> addGiftCards({
    required String title,
    required String description,
    required String? time,
    required num price,
    required bool active,
  }) async {
    final data = {
      'title': {LocalStorage.getLanguage()?.locale ?? 'en': title},
      'description': {LocalStorage.getLanguage()?.locale ?? 'en': description},
      'time': time,
      'price': price,
      'active': active ? 1 : 0,
    };
    debugPrint('====> create gift cards request ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: true);
      final res = await client.post(
        '/api/v1/dashboard/seller/gift-carts',
        data: data,
      );
      return ApiResult.success(data: res.data);
    } catch (e) {
      debugPrint('==> create gift cards failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult> updateGiftCard({
    required String title,
    required String description,
    required String? time,
    required num price,
    required int? id,
    required bool active
  }) async {
    final data = {
      'title': {LocalStorage.getLanguage()?.locale ?? 'en': title},
      'description': {LocalStorage.getLanguage()?.locale ?? 'en': description},
      'time': time,
      'price': price,
      'active': active ? 1 : 0,
    };
    debugPrint('====> update gift card request ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: true);
      final res = await client.put(
        '/api/v1/dashboard/seller/gift-carts/$id',
        data: data,
      );
      return ApiResult.success(
          data: SingleMembershipResponse.fromJson(res.data));
    } catch (e) {
      debugPrint('==> update gift cards failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<void>> deleteGiftCard(int? id) async {
    final data = {
      'ids': [id]
    };
    debugPrint('====> delete memberships request ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: true);
      await client.delete(
        '/api/v1/dashboard/seller/gift-carts/delete',
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
  Future<ApiResult<UserGiftCardResponse>> getUserGiftCards({
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
        '/api/v1/dashboard/seller/user-gift-carts',
        queryParameters: data,
      );
      return ApiResult.success(
        data: UserGiftCardResponse.fromJson(response.data),
      );
    } catch (e, s) {
      debugPrint('==> get user gift cards failure: $e,$s');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

}
