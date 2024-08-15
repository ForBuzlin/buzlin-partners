import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';
import '../models/models.dart';
import '../services/services.dart';
import 'package:venderuzmart/domain/handlers/handlers.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';

class UsersRepository implements UsersFacade {
  @override
  Future<ApiResult<ProfileResponse>> createUser({
    required String firstname,
    required String phone,
    required String email,
    String? lastname,
    String? title,
    String? desc,
    String? role,
    String? image,
    String? password,
  }) async {
    final data = {
      'firstname': firstname,
      'email': email,
      'phone':
          phone.replaceAll("+", "").replaceAll(" ", "").replaceAll("-", ""),
      'role': role ?? 'user',
      if (lastname != null) 'lastname': lastname,
      if (image != null) 'image': image,
      if (password?.isNotEmpty ?? false) 'password': password,
      if (password?.isNotEmpty ?? false) 'password_confirmation': password,
      if (title?.isNotEmpty ?? false)
        'title': {LocalStorage.getLanguage()?.locale: title},
      if (desc != null)
        'description': {LocalStorage.getLanguage()?.locale: desc},
      if (role != null) 'shop_id': [LocalStorage.getShop()?.id],
    };
    debugPrint('===> create user ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.post(
          '/api/v1/dashboard/${AppHelpers.getUserRole}/users',
          data: data);
      return ApiResult.success(data: ProfileResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('===> create user fail $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<UsersPaginateResponse>> searchUsers({
    String? query,
    String? role,
    String? inviteStatus,
    int? page,
    int? serviceId,
  }) async {
    final data = {
      if (query?.isNotEmpty ?? false) 'search': query,
      'perPage': 10,
      if (page != null) 'page': page,
      'sort': 'desc',
      'column': 'created_at',
      if (inviteStatus != null) 'invite_status': inviteStatus,
      if (role != null) 'role': role,
      if (serviceId != null) 'service_id': serviceId,
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
        serviceId != null
            ? '/api/v1/rest/masters'
            : role == TrKeys.deliveryman
                ? '/api/v1/dashboard/${AppHelpers.getUserRole}/shop/users/role/$role'
                : role != null
                    ? '/api/v1/dashboard/${AppHelpers.getUserRole}/shop/users/paginate'
                    : AppHelpers.getUserRole == TrKeys.master
                        ? '/api/v1/dashboard/${AppHelpers.getUserRole}/users'
                        : '/api/v1/dashboard/${AppHelpers.getUserRole}/users/paginate',
        queryParameters: data,
      );
      return ApiResult.success(
        data: UsersPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> search users failure: $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<SingleShopResponse>> getMyShop() async {
    final data = {
      'lang': LocalStorage.getLanguage()?.locale,
      //'currency_id': LocalStorage.getSelectedCurrency()?.id,
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/${AppHelpers.getUserRole}/shops',
        queryParameters: data,
      );
      return ApiResult.success(
        data: SingleShopResponse.fromJson(response.data),
      );
    } catch (e, s) {
      debugPrint('===> error fetching my shop $e $s');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<ShopCategoryResponse>> getCategory() async {
    final data = {
      'lang': LocalStorage.getLanguage()?.locale ?? "en",
      'search': '',
      'type': 'shop'
      //'currency_id': LocalStorage.getSelectedCurrency()?.id,
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/${AppHelpers.getUserRole}/categories/search',
        queryParameters: data,
      );
      return ApiResult.success(
        data: ShopCategoryResponse.fromJson(response.data),
      );
    } catch (e, s) {
      debugPrint('===> error fetching my shop $e $s');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<dynamic>> setOnlineOffline() async {
    try {
      final client = dioHttp.client(requireAuth: true);
      await client.post(
        '/api/v1/dashboard/${AppHelpers.getUserRole}/shops/working/status',
      );
      return const ApiResult.success(
        data: null,
      );
    } catch (e) {
      debugPrint('===> error switch shop online $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<ProfileResponse>> getProfileDetails() async {
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/user/profile/show',
      );
      return ApiResult.success(
        data: ProfileResponse.fromJson(response.data),
      );
    } catch (e) {
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<ProfileResponse>> editProfile({
    required EditProfile? user,
  }) async {
    final data = user?.toJson();
    debugPrint('===> update general info data ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.put(
        '/api/v1/dashboard/user/profile/update',
        data: data,
      );
      return ApiResult.success(
        data: ProfileResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> update profile details failure: $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<ProfileResponse>> updateProfileImage({
    required String firstName,
    required String imageUrl,
  }) async {
    final data = {
      'firstname': firstName,
      'images': [imageUrl],
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.put(
        '/api/v1/dashboard/user/profile/update',
        data: data,
      );
      return ApiResult.success(
        data: ProfileResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> update profile image failure: $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<ProfileResponse>> updatePassword({
    required String password,
    required String passwordConfirmation,
  }) async {
    final data = {
      'password': password,
      'password_confirmation': passwordConfirmation,
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.post(
        '/api/v1/dashboard/user/profile/password/update',
        data: data,
      );
      return ApiResult.success(
        data: ProfileResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> update password failure: $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<void>> updateFirebaseToken(String? token) async {
    final data = {if (token != null) 'firebase_token': token};
    debugPrint('===> update firebase token ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: true);
      await client.post(
        '/api/v1/dashboard/user/profile/firebase/token/update',
        data: data,
      );
      return const ApiResult.success(data: null);
    } catch (e) {
      debugPrint('==> update firebase token failure: $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<bool>> checkDriverZone(LatLng location,
      {int? shopId}) async {
    try {
      final client = dioHttp.client(requireAuth: false);
      final data = <String, dynamic>{
        'address[latitude]': location.latitude,
        'address[longitude]': location.longitude,
      };
      dynamic response;
      if (shopId == null) {
        response = await client.get(
            '/api/v1/rest/shop//delivery-zone/check/distance',
            queryParameters: data);
      } else {
        response = await client.get(
            '/api/v1/rest/shop/$shopId/delivery-zone/check/distance',
            queryParameters: data);
      }

      return ApiResult.success(
        data: response.data["status"],
      );
    } catch (e) {
      debugPrint('==> get delivery zone failure: $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult> deleteAccount() async {
    try {
      final client = dioHttp.client(requireAuth: true);
      await client.delete(
        '/api/v1/dashboard/user/profile/delete',
      );
      return const ApiResult.success(
        data: null,
      );
    } catch (e) {
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult> logOut() async {
    try {
      final client = dioHttp.client(requireAuth: true);
      final firebaseM = FirebaseMessaging.instance;
      firebaseM.requestPermission(
        sound: true,
        alert: true,
        badge: false,
      );
      final fcm = await firebaseM.getToken() ?? "";
      await client.post(
        '/api/v1/auth/logout',
        data: {"firebase_token": fcm},
      );
      LocalStorage.logout();
      return const ApiResult.success(
        data: null,
      );
    } catch (e) {
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<TransactionPaginationResponse>> getTransactions(
      int page) async {
    final data = {
      'page': page,
      'perPage': 10,
      if (LocalStorage.getSelectedCurrency()?.id != null)
        'currency_id': LocalStorage.getSelectedCurrency()?.id,
      "lang": LocalStorage.getLanguage()?.locale ?? "en"
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/user/wallet/histories',
        queryParameters: data,
      );
      return ApiResult.success(
        data: TransactionPaginationResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get wallet histories failure: $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult> updateStatus({
    required int? id,
    required String status,
  }) async {
    final data = {'status': status};
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.post(
        '/api/v1/dashboard/${AppHelpers.getUserRole}/shops/invites/$id/status/change',
        data: data,
      );
      return ApiResult.success(data: response.data);
    } catch (e) {
      debugPrint('==> update master status failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }
}
