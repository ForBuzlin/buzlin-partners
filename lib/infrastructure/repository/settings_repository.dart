import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';
import '../models/models.dart';
import '../services/services.dart';
import 'package:venderuzmart/domain/handlers/handlers.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';

class SettingsRepository implements SettingsFacade {
  @override
  Future<ApiResult<GalleryUploadResponse>> uploadImage(
    String filePath,
    UploadType uploadType,
  ) async {
    String type = '';
    switch (uploadType) {
      case UploadType.shopsLogo:
        type = 'shops/logo';
        break;
      case UploadType.shopsBack:
        type = 'shops/background';
        break;
      default:
        type = uploadType.name;
        break;
    }
    final data = FormData.fromMap(
      {
        'image': await MultipartFile.fromFile(filePath),
        'type': type,
      },
    );
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.post(
        '/api/v1/dashboard/galleries',
        data: data,
      );
      return ApiResult.success(
        data: GalleryUploadResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> upload image failure: $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<MultiGalleryUploadResponse>> uploadMultiImage(
    List<String?> filePaths,
    UploadType uploadType,
  ) async {
    String type = '';
    switch (uploadType) {
      case UploadType.shopsLogo:
        type = 'shops/logo';
        break;
      case UploadType.shopsBack:
        type = 'shops/background';
        break;
      default:
        type = uploadType.name;
        break;
    }
    final data = FormData.fromMap(
      {
        for (int i = 0; i < filePaths.length; i++)
          if (filePaths[i] != null)
            'images[$i]': await MultipartFile.fromFile(filePaths[i]!),
        'type': type,
      },
    );
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.post(
        '/api/v1/dashboard/galleries/store-many',
        data: data,
      );
      return ApiResult.success(
        data: MultiGalleryUploadResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> upload multi image failure: $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<CurrenciesResponse>> getCurrencies() async {
    try {
      final client = dioHttp.client(requireAuth: false);
      final response = await client.get('/api/v1/rest/currencies/active');
      if (LocalStorage.getSelectedCurrency() == null ||
          !(CurrenciesResponse.fromJson(response.data)
                  .data
                  ?.map((e) => e.id)
                  .contains(LocalStorage.getSelectedCurrency()?.id) ??
              true)) {
        CurrenciesResponse.fromJson(response.data).data?.forEach((element) {
          if (element.isDefault ?? false) {
            LocalStorage.setSelectedCurrency(element);
          }
        });
      }
      return ApiResult.success(
        data: CurrenciesResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get currencies failure: $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<SettingsResponse>> getGlobalSettings() async {
    try {
      final dioHttp = HttpService();
      final client = dioHttp.client(requireAuth: false);
      final response = await client.get('/api/v1/rest/settings');
      LocalStorage.setSettingsList(
          SettingsResponse.fromJson(response.data).data ?? []);
      return ApiResult.success(
        data: SettingsResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get settings failure: $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<MobileTranslationsResponse>> getTranslations({
    String? lang,
    int? id,
  }) async {
    final data = {'lang': lang ?? LocalStorage.getLanguage()?.locale ?? 'en'};
    try {
      final dioHttp = HttpService();
      final client = dioHttp.client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/translations/paginate',
        queryParameters: data,
      );
      await LocalStorage.setTranslations(
        MobileTranslationsResponse.fromJson(response.data).data,
      );
     await LocalStorage.setOtherTranslations(
        translations: MobileTranslationsResponse.fromJson(response.data).data,
        key: (id ?? LocalStorage.getLanguage()?.id).toString(),
      );
      return ApiResult.success(
        data: MobileTranslationsResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get translations failure: $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<LanguagesResponse>> getLanguages() async {
    try {
      final dioHttp = HttpService();
      final client = dioHttp.client(requireAuth: false);
      final response = await client.get('/api/v1/rest/languages/active');
      if (LocalStorage.getLanguage() == null ||
          !(LanguagesResponse.fromJson(response.data)
                  .data
                  ?.map((e) => e.id)
                  .contains(LocalStorage.getLanguage()?.id) ??
              true)) {
        LanguagesResponse.fromJson(response.data).data?.forEach((element) {
          if (element.isDefault ?? false) {
            LocalStorage.setLanguageData(element);
            LocalStorage.setLangLtr(element.backward);
          }
        });
      }
      return ApiResult.success(
        data: LanguagesResponse.fromJson(response.data),
      );
    } catch (e, s) {
      debugPrint('==> get languages failure: $e, $s');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<ProfileResponse>> updateProfile(
      {required String firstName,
      required String lastName,
      required String email,
      required String phone,
      required String birthday,
      required String gender,
      String? image,
      String? password,
      String? confirmPassword}) async {
    final data = {
      'firstname': firstName,
      'lastname': lastName,
      'gender': gender,
      'email': email,
      'birthday': birthday,
      'phone':
          phone.replaceAll("+", "").replaceAll(" ", "").replaceAll("-", ""),
      if (image != null) 'images[0]': image,
      if (password != null) 'password': password,
      if (password != null) 'password_confirmation': password
    };
    debugPrint('====> update profile request ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: true);
      final res = await client.put(
        '/api/v1/dashboard/user/profile/update',
        queryParameters: data,
      );
      return ApiResult.success(data: ProfileResponse.fromJson(res.data));
    } catch (e) {
      debugPrint('==> update profile failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }
}
