import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/domain/handlers/handlers.dart';

abstract class ShopsFacade {
  Future<ApiResult<void>> createShop({
    required double tax,
    required double deliveryTo,
    required double deliveryFrom,
    required String phone,
    required String name,
    required String description,
    required String deliveryTimeType,
    required AddressData address,
    required String deliveryType,
    String? logoImage,
    String? backgroundImage,
  });

  Future<ApiResult<SingleShopResponse>> updateShop({
    String? tax,
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
    LocationData? latLong,
  });

  Future<ApiResult<void>> updateDeliveryZones({
    required List<LatLng> points,
  });

  Future<ApiResult<DeliveryZonePaginate>> getDeliveryZone();

  Future<ApiResult<void>> updateShopWorkingDays({
    required List<WorkingDay> workingDays,
    String? uuid,
  });

  Future<ApiResult<ShopLocationsResponse>> getShopLocations({
    required int type,
    required int page,
  });

  Future<ApiResult> updateShopLocations({
    int? cityId,
    required int regionId,
    required int countryId,
    required int type,
  });

  Future<ApiResult> deleteShopLocation({required int countryId});

  Future<ApiResult> addShopSocials({
    required List socialTypes,
    required List socialContents,
  });

  Future<ApiResult<SocialsResponse>> getShopSocials();

  Future<ApiResult<GalleriesResponse>> getGalleries();

  Future<ApiResult> setGalleries({
    required List<String> images,
    List<String>? previews,
  });
}
