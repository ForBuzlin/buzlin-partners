import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';
import 'package:venderuzmart/domain/handlers/handlers.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';

class AuthRepository implements AuthFacade {
  @override
  Future<ApiResult<LoginResponse>> login({
    required String email,
    required String password,
  }) async {
    final data = {
      if (AppValidators.isValidEmail(email)) 'email': email,
      if (!AppValidators.isValidEmail(email))
        'phone':
            email.replaceAll("+", "").replaceAll(" ", "").replaceAll("-", ""),
      'password': password,
    };
    debugPrint('===> login request ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: false);
      final response = await client.post(
        '/api/v1/auth/login',
        data: data,
      );
      return ApiResult.success(
        data: LoginResponse.fromJson(response.data),
      );
    } catch (e,s) {
      debugPrint('==> login failure: $e,$s');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<LoginResponse>> loginWithSocial({
    String? email,
    String? displayName,
    String? id,
  }) async {
    final data = {
      if (email != null) 'email': email,
      if (displayName != null) 'name': displayName,
      if (id != null) 'id': id,
    };
    debugPrint('===> login request ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: false);
      final response = await client.post(
        '/api/v1/auth/google/callback',
        data: data,
      );
      return ApiResult.success(data: LoginResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> login with google failure: $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<RegisterResponse>> sendOtp({required String phone}) async {
    final data = {
      'phone': phone.replaceAll("+", "").replaceAll(" ", "").replaceAll("-", "")
    };
    try {
      final client = dioHttp.client(requireAuth: false);
      final response = await client.post(
        '/api/v1/auth/register',
        data: data,
      );
      return ApiResult.success(data: RegisterResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> send otp failure: $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<VerifyPhoneResponse>> verifyPhone({
    required String verifyId,
    required String verifyCode,
  }) async {
    final data = {'verifyId': verifyId, 'verifyCode': verifyCode};
    try {
      final client = dioHttp.client(requireAuth: false);
      final response = await client.post(
        '/api/v1/auth/verify/phone',
        data: data,
      );
      debugPrint('==> verify phone request: $data');

      return ApiResult.success(
        data: VerifyPhoneResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> verify phone failure: $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<VerifyData>> sigUpWithData({required UserData user}) async {
    final data = {
      "firstname": user.firstname,
      "lastname": user.lastname,
      "phone": user.phone,
      "email": user.email,
      "password": user.password,
      "password_conformation": user.confirmPassword,
      if (user.referral?.isNotEmpty ?? false) 'referral': user.referral
    };
    debugPrint('==> after verify request: $data');

    try {
      final client = dioHttp.client(requireAuth: false);
      var res = await client.post(
        '/api/v1/auth/after-verify',
        data: data,
      );

      return ApiResult.success(
        data: VerifyData.fromJson(res.data["data"]),
      );
    } catch (e) {
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<RegisterResponse>> forgotPassword({
    required String email,
  }) async {
    final data = {'email': email};
    try {
      final client = dioHttp.client(requireAuth: false);
      final response = await client.post(
        '/api/v1/auth/forgot/password',
        data: data,
      );
      return ApiResult.success(data: RegisterResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> forgot password failure: $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<VerifyPhoneResponse>> forgotPasswordConfirm({
    required String verifyCode,
    required String email,
  }) async {
    try {
      final client = dioHttp.client(requireAuth: false);
      final response = await client.post(
        '/api/v1/auth/forgot/email-password/$verifyCode?email=$email',
      );
      return ApiResult.success(
        data: VerifyPhoneResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> forgot password confirm failure: $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<ProfileResponse>> sigUp({
    required String email,
  }) async {
    final data = {'email': email};
    debugPrint('===> register request ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: false);
      final response = await client.post('/api/v1/auth/register', data: data);
      return ApiResult.success(data: ProfileResponse.fromJson(response.data));
    } catch (e) {
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<VerifyData>> sigUpWithPhone({required UserData user}) async {
    final data = {
      "firstname": user.firstname,
      "lastname": user.lastname,
      "phone": user.phone,
      "email": user.email,
      "password": user.password,
      "password_conformation": user.confirmPassword,
      "type": "firebase",
      "id": user.refreshToken,
    };
    try {
      final client = dioHttp.client(requireAuth: false);
      var res = await client.post(
        '/api/v1/auth/verify/phone',
        data: data,
      );
      return ApiResult.success(
        data: VerifyData.fromJson(res.data["data"]),
      );
    } catch (e) {
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<VerifyData>> forgotPasswordConfirmWithPhone({
    required String phone,
    required String id,
    required String password,
  }) async {
    try {
      final client = dioHttp.client(requireAuth: false);
      final response =
          await client.post('/api/v1/auth/forgot/password/confirm', data: {
        'phone':
            phone.replaceAll("+", "").replaceAll(" ", "").replaceAll("-", ""),
        "id": id,
        "type": "firebase",
        "password": password
      });

      return ApiResult.success(
        data: VerifyData.fromJson(response.data["data"]),
      );
    } catch (e) {
      debugPrint('==> forgot password confirm failure: $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<VerifyPhoneResponse>> verifyEmail({
    required String verifyCode,
  }) async {
    try {
      final client = dioHttp.client(requireAuth: false);
      final response = await client.get(
        '/api/v1/auth/verify/$verifyCode',
      );
      return ApiResult.success(
          data: VerifyPhoneResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> verify email failure: $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<bool>> checkPhone({required String phone}) async {
    final data = {
      'phone': phone.replaceAll("+", "").replaceAll(" ", "").replaceAll("-", "")
    };
    debugPrint('===> login request $data');
    try {
      final client = dioHttp.client(requireAuth: false);
      final response = await client.post(
        '/api/v1/auth/check/phone',
        queryParameters: data,
      );
      return ApiResult.success(data: response.data['data']['exist']);
    } catch (e) {
      debugPrint('==> check phone failure: $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }
}
