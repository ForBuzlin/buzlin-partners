import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/domain/handlers/handlers.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import '../services/services.dart';

class ShopsRepository implements ShopsFacade {
  @override
  Future<ApiResult<void>> createShop({
    required double tax,
    required double deliveryTo,
    required double deliveryFrom,
    required String phone,
    required String name,
    required String description,
    required AddressData address,
    required String deliveryTimeType,
    required String deliveryType,
    String? logoImage,
    String? backgroundImage,
  }) async {
    final data = {
      'tax': tax,
      'type': "shop",
      'location': address.location?.toJson(),
      'phone':
          phone.replaceAll("+", "").replaceAll(" ", "").replaceAll("-", ""),
      'delivery_time_from': deliveryFrom,
      'delivery_time_to': deliveryTo,
      'delivery_type': deliveryType == TrKeys.inHouse ? 1 : 2,
      'delivery_time_type': deliveryTimeType,
      'title': {LocalStorage.getLanguage()?.locale ?? "": name},
      'description': {LocalStorage.getLanguage()?.locale ?? "": description},
      'address': {
        LocalStorage.getLanguage()?.locale ?? "":
            "${address.title}, ${address.address}"
      },
      if (logoImage != null) 'images[0]': logoImage,
      if (backgroundImage != null) "images[1]": backgroundImage,
    };
    debugPrint('==> create shop request: ${jsonEncode(data)}');

    try {
      final client = dioHttp.client(requireAuth: true);
      await client.post(
        '/api/v1/dashboard/user/shops',
        queryParameters: data,
      );
      return const ApiResult.success(data: null);
    } catch (e) {
      debugPrint('==> create shop failure: $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<void>> updateDeliveryZones({
    required List<LatLng> points,
  }) async {
    List<Map<String, dynamic>> tapped = [];
    for (final point in points) {
      final location = {'0': point.latitude, '1': point.longitude};
      tapped.add(location);
    }
    final data = {
      'shop_id': LocalStorage.getShop()?.id,
      'address': tapped,
    };
    debugPrint('====> update delivery zone ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: true);
      await client.post(
        '/api/v1/dashboard/seller/delivery-zones',
        data: data,
      );
      return const ApiResult.success(data: null);
    } catch (e) {
      debugPrint('==> update delivery zones failure: $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<DeliveryZonePaginate>> getDeliveryZone() async {
    final data = {
      'lang': LocalStorage.getLanguage()?.locale,
      'currency_id': LocalStorage.getSelectedCurrency()?.id,
      'perPage': 1,
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/seller/delivery-zones',
        queryParameters: data,
      );
      return ApiResult.success(
        data: DeliveryZonePaginate.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('===> error get delivery zone $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<void>> updateShopWorkingDays({
    required List<WorkingDay> workingDays,
    String? uuid,
  }) async {
    List<Map<String, dynamic>> days = [];
    for (final workingDay in workingDays) {
      final data = {
        'day': workingDay.day,
        'from': workingDay.from,
        'to': workingDay.to,
        'disabled': workingDay.disabled
      };
      days.add(data);
    }

    final data = {
      'dates': days,
    };
    debugPrint('====> update working days ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: true);
      await client.put(
        '/api/v1/dashboard/seller/shop-working-days/${uuid ?? LocalStorage.getShop()?.uuid}',
        data: data,
      );
      return const ApiResult.success(data: null);
    } catch (e) {
      debugPrint('==> update shop working days failure: $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<SingleShopResponse>> updateShop(
      {String? tax,
      String? percentage,
      String? phone,
      String? type,
      num? pricePerKm,
      String? minAmount,
      num? price,
      String? backImg,
      String? logoImg,
      required String? deliveryType,
      int? categoryId,
      List<CategoryData>? categories,
      DeliveryTime? deliveryTime,
      Translation? translation,
      LocationData? latLong}) async {
    List<int> categoryIds = [];
    List<int> tagIds = [];
    if (categories != null && categories.isNotEmpty) {
      for (int i = 0; i < categories.length; i++) {
        categoryIds.add(categories[i].id ?? 0);
      }
    }
    categoryIds = categoryIds.toSet().toList();
    tagIds = tagIds.toSet().toList();
    final data = {
      'tax': tax,
      'phone':
          phone?.replaceAll("+", "").replaceAll(" ", "").replaceAll("-", ""),
      'type': type,
      if (pricePerKm != null) 'price_per_km': pricePerKm,
      if (price != null) 'price': price,
      'title': {
        LocalStorage.getLanguage()?.locale ?? 'en': translation?.title
      },
      'description': {
        LocalStorage.getLanguage()?.locale ?? 'en':
            translation?.description
      },
      'address': {
        LocalStorage.getLanguage()?.locale ?? 'en': translation?.address
      },
      'images': [logoImg, backImg],
      // 'categories': [categoryId],
      'delivery_type': deliveryType == TrKeys.inHouse ? 1 : 2,
      'delivery_time_type': deliveryTime?.type,
      'delivery_time_from': deliveryTime?.from,
      'delivery_time_to': deliveryTime?.to,
      'lat_long': latLong,
    };
    debugPrint('====> update shop ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.put(
        '/api/v1/dashboard/seller/shops',
        data: data,
      );
      return ApiResult.success(
        data: SingleShopResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> update shop failure: $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<ShopLocationsResponse>> getShopLocations({
    required int type,
    required int page,
  }) async {
    final data = {
      'lang': LocalStorage.getLanguage()?.locale,
      'type': type,
      'perPage': 10,
      'page': page,
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/seller/shop-locations',
        queryParameters: data,
      );
      return ApiResult.success(
        data: ShopLocationsResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('===> get shop locations failure $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult> updateShopLocations({
    int? cityId,
    required int regionId,
    required int countryId,
    required int type,
  }) async {
    final data = {
      'type': type,
      'region_id': regionId,
      'country_id': countryId,
      if (cityId != null) 'city_id': cityId,
    };
    debugPrint('====> add shop locations ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: true);
      await client.post(
        '/api/v1/dashboard/seller/shop-locations',
        data: data,
      );
      return const ApiResult.success(data: null);
    } catch (e) {
      debugPrint('==> add locations failure: $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult> deleteShopLocation({
    required int countryId,
  }) async {
    final data = {
      'ids': [countryId],
    };
    debugPrint('====> delete shop locations ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: true);
      await client.delete(
        '/api/v1/dashboard/seller/shop-locations/delete',
        data: data,
      );
      return const ApiResult.success(data: null);
    } catch (e) {
      debugPrint('==> add locations failure: $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<SocialsResponse>> getShopSocials() async {
    final data = <String, dynamic>{
      'lang': LocalStorage.getLanguage()?.locale,
      'shop_id': LocalStorage.getUser()?.shop?.id
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/seller/shop-socials',
        queryParameters: data,
      );
      return ApiResult.success(
        data: SocialsResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get shop socials failure: $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult> addShopSocials({
    required List socialTypes,
    required List socialContents,
  }) async {
    List<Map<String, dynamic>> content = [];
    for (int i = 0; i < socialTypes.length; i++) {
      final data = {
        'type': socialTypes[i],
        'content': socialContents[i],
      };
      content.add(data);
    }
    final data = {'data': content};
    debugPrint('====> error shop social adding ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: true);
      await client.post(
        '/api/v1/dashboard/seller/shop-socials',
        data: data,
      );
      return const ApiResult.success(data: null);
    } catch (e) {
      debugPrint('==> add shop socials failure: $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<GalleriesResponse>> getGalleries() async {
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/seller/galleries',
      );
      return ApiResult.success(
        data: GalleriesResponse.fromJson(response.data['data']),
      );
    } catch (e) {
      debugPrint('==> get shop galleries failure: $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult> setGalleries({
    required List<String> images,
    List<String>? previews,
  }) async {
    try {
      final data = {
        "active": 1,
        "images": images,
        if (previews != null) 'previews': previews,
      };
      final client = dioHttp.client(requireAuth: true);
      final response = await client.post(
        '/api/v1/dashboard/seller/galleries',
        data: data,
      );
      return ApiResult.success(data: response.data);
    } catch (e) {
      debugPrint('==> set shop galleries failure: $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }
}
