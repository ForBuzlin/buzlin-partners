import 'package:venderuzmart/domain/handlers/handlers.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

abstract class ProductsFacade {
  Future<ApiResult<Digital>> updateDigitalFile({
    required String filePath,
    required int? productId,
  });

  Future<ApiResult> updateGalleries(
    Map<String, List<String?>> galleries,
  );

  Future<ApiResult<SingleProductResponse>> updateStocks({
    required List<Stocks> stocks,
    required List<int> deletedStocks,
    String? uuid,
  });

  Future<ApiResult<void>> deleteProduct(int? productId);

  Future<ApiResult<SingleProductResponse>> updateProduct({
    required Map<String, List<String>> titlesAndDescriptions,
    required String tax,
    required String minQty,
    required String maxQty,
    required bool active,
    required String interval,
    bool? digital,
    int? categoryId,
    int? unitId,
    int? brandId,
    int? ageLimit,
    List<String>? images,
    List<String>? previews,
    String? uuid,
    bool needAddons = false,
  });

  Future<ApiResult<SingleProductResponse>> createProduct({
    required String title,
    required String description,
    required String tax,
    required String minQty,
    required String maxQty,
    required String ageLimit,
    required bool active,
    required String interval,
    bool digital = false,
    int? categoryId,
    int? brandId,
    int? unitId,
    List<String>? image,
    List<String>? previews,
  });

  Future<ApiResult<SingleProductResponse>> getProductDetails(String uuid);

  Future<ApiResult<SingleProductResponse>> getProductDetailsEdited(String uuid);

  Future<ApiResult<ProductsPaginateResponse>> getProducts({
    required int page,
    int? categoryId,
    String? query,
    ProductStatus? status,
    int? brandId,
    bool? isNew,
    List<int>? brandIds,
    List<int>? categoryIds,
    List<int>? extrasId,
    num? priceTo,
    num? priceFrom,
    bool active = false,
  });

  Future<ApiResult<FilterResponse>> fetchFilter({
    required String type,
    List<int>? brandId,
    List<int>? categoryId,
    List<int>? extrasId,
    num? priceTo,
    num? priceFrom,
  });

  Future<ApiResult<FilterResponse>> fetchAllFilter({
    required String type,
    List<int>? brandId,
    List<int>? categoryId,
    List<int>? extrasId,
    num? priceTo,
    num? priceFrom,
  });
}
