import 'package:venderuzmart/domain/handlers/api_result.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/models/response/user_address_response.dart';

abstract class AddressFacade {
  Future<ApiResult<CountryPaginationResponse>> getCountry({required int page});

  Future<ApiResult<CountryPaginationResponse>> searchCountry(
      {required String search});

  Future<ApiResult<CityResponseModel>> getCity(
      {required int page, required int countyId});

  Future<ApiResult<CityResponseModel>> searchCity(
      {required String search, required int countyId});

  Future<ApiResult<DeliveryPointsResponse>> getDeliveryPoints(
      {required int page, required int countryId, int? cityId});

  Future<ApiResult<DeliveryPointsResponse>> getDeliveryPrice(
      {required int countryId, required int cityId});

  Future<ApiResult<UserAddressResponse>> getUserAddress({
    required int page,
    required int? userId,
    required int? cityId,
    required int? regionId,
    required int? countryId,
  });

  Future<ApiResult<MyAddress>> addUserAddress({required MyAddress address, int? userId});
}
