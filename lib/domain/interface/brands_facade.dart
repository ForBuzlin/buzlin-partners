import 'package:venderuzmart/infrastructure/models/models.dart';
import '../handlers/handlers.dart';

abstract class BrandsFacade {
  Future<ApiResult<BrandsPaginateResponse>> searchBrands(String? query);

  Future<ApiResult<BrandsPaginateResponse>> getAllBrands({
    bool isActive = true,
    int? page,
  });

  Future<ApiResult<void>> deleteBrand(int? brandId);

  Future<ApiResult> addBrand({
    required String title,
    required bool active,
    String? image,
  });

  Future<ApiResult> updateBrand({
    required String title,
    required bool active,
    required int id,
    String? image,
  });
}
