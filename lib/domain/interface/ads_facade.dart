import 'package:venderuzmart/domain/handlers/api_result.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

abstract class AdsFacade {
  Future<ApiResult<AdsResponse>> getAds({required int page});

  Future<ApiResult> purchaseAds({required int id});

  Future<ApiResult<AdsPackageResponse>> getAdsPackages({required int page});

  Future<ApiResult> addAdsPackages(
      {required int? id, required List productIds});
}
