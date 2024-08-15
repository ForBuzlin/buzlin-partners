import 'dart:convert';

import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/domain/handlers/handlers.dart';
import 'package:flutter/material.dart';
import 'package:venderuzmart/infrastructure/models/response/user_address_response.dart';

import '../services/services.dart';

class AddressRepository implements AddressFacade {
  @override
  Future<ApiResult<CountryPaginationResponse>> getCountry(
      {required int page}) async {
    final data = {
      'perPage': 48,
      'page': page,
      'has_price': 1,
      'lang': LocalStorage.getLanguage()?.locale,
    };
    try {
      final client = dioHttp.client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/countries',
        queryParameters: data,
      );
      return ApiResult.success(
          data: CountryPaginationResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> get country paginate failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<DeliveryPointsResponse>> getDeliveryPrice(
      {required int countryId, required int cityId}) async {
    final data = {
      'perPage': 1,
      'lang': LocalStorage.getLanguage()?.locale,
      'country_id': countryId,
      'city_id': cityId,
    };
    try {
      final client = dioHttp.client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/delivery-prices',
        queryParameters: data,
      );
      return ApiResult.success(
          data: DeliveryPointsResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> get country paginate failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<CountryPaginationResponse>> searchCountry(
      {required String search}) async {
    final data = {
      'perPage': 48,
      "search": search,
      'has_price': 1,
      'lang': LocalStorage.getLanguage()?.locale,
    };
    try {
      final client = dioHttp.client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/countries',
        queryParameters: data,
      );
      return ApiResult.success(
        data: CountryPaginationResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> search country paginate failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<CityResponseModel>> getCity(
      {required int page, required int countyId}) async {
    final data = {
      'perPage': 48,
      'page': page,
      'has_price': 1,
      'lang': LocalStorage.getLanguage()?.locale,
      'country_id': countyId,
    };
    try {
      final client = dioHttp.client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/cities',
        queryParameters: data,
      );
      return ApiResult.success(data: CityResponseModel.fromJson(response.data));
    } catch (e) {
      debugPrint('==> get city paginate failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<CityResponseModel>> searchCity(
      {required String search, required int countyId}) async {
    final data = {
      'perPage': 48,
      "search": search,
      'has_price': 1,
      'lang': LocalStorage.getLanguage()?.locale,
      'country_id': countyId,
    };
    try {
      final client = dioHttp.client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/cities',
        queryParameters: data,
      );
      return ApiResult.success(data: CityResponseModel.fromJson(response.data));
    } catch (e) {
      debugPrint('==> search city paginate failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<DeliveryPointsResponse>> getDeliveryPoints({
    required int page,
    required int countryId,
    int? cityId,
  }) async {
    final data = {
      'perPage': 48,
      'page': page,
      if (cityId == null) 'country_id': countryId,
      if (cityId != null) 'city_id': cityId,
    };
    try {
      final client = dioHttp.client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/delivery-points',
        queryParameters: data,
      );
      return ApiResult.success(
          data: DeliveryPointsResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> delivery points failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<UserAddressResponse>> getUserAddress({
    required int page,
    required int? userId,
    required int? cityId,
    required int? regionId,
    required int? countryId,
  }) async {
    final data = {
      'perPage': 10,
      'user_id': userId,
      if (cityId != null) "city_id": cityId,
      if (countryId != null) "country_id": countryId,
      if (regionId != null) "region_id": regionId,
      'page': page,
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/${AppHelpers.getUserRole}/user-addresses',
        queryParameters: data,
      );
      return ApiResult.success(
          data: UserAddressResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> get user address failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<MyAddress>> addUserAddress(
      {required MyAddress address, int? userId}) async {
    final data = {
      "firstname": address.firstname,
      "lastname": address.lastname,
      "phone": address.phone,
      "zipcode": address.zipcode,
      "additional_details": address.additionalDetails,
      "street_house_number": address.streetHouseNumber,
      if (address.countryId != null) "country_id": address.countryId,
      if (address.regionId != null) "region_id": address.regionId,
      if (address.cityId != null) "city_id": address.cityId,
      "location": address.location?.toJson(),
      "user_id": userId
    };
    debugPrint('==> add address request: ${(jsonEncode(data))}');

    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.post(
        '/api/v1/dashboard/${AppHelpers.getUserRole}/user-addresses',
        data: data,
      );
      return ApiResult.success(
        data: MyAddress.fromJson(response.data["data"]),
      );
    } catch (e) {
      debugPrint('==> add address failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }
}
