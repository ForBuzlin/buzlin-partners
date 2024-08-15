import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';
import '../models/models.dart';
import '../services/services.dart';
import 'package:venderuzmart/domain/handlers/handlers.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';

class ProductsRepository implements ProductsFacade {
  @override
  Future<ApiResult<Digital>> updateDigitalFile({
    required String filePath,
    required int? productId,
  }) async {
    final data = FormData.fromMap({
      'file': await MultipartFile.fromFile(filePath),
      'product_id': productId,
      'active': 1,
    });

    try {
      final client = dioHttp.client(requireAuth: true);
      final res = await client.post(
        '/api/v1/dashboard/seller/digital-files',
        data: data,
      );
      return ApiResult.success(data: Digital.fromJson(res.data['data']));
    } catch (e) {
      debugPrint('==> update digital failure: $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult> updateGalleries(
    Map<String, List<String?>> galleries,
  ) async {
    final data = {
      'data': [
        for (var i in galleries.keys) {"id": i, "images": galleries[i]}
      ],
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      final res = await client.post(
        '/api/v1/dashboard/seller/stocks/galleries',
        data: data,
      );
      return ApiResult.success(data: res.data);
    } catch (e) {
      debugPrint('==> update galleries failure: $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<void>> deleteProduct(int? productId) async {
    final data = {
      'ids': [productId]
    };
    debugPrint('====> delete product request ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: true);
      await client.delete(
        '/api/v1/dashboard/seller/products/delete',
        data: data,
      );
      return const ApiResult.success(data: null);
    } catch (e) {
      debugPrint('==> delete product failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<SingleProductResponse>> updateStocks({
    required List<Stocks> stocks,
    required List<int> deletedStocks,
    String? uuid,
  }) async {
    final List<Map<String, dynamic>> extras = [];
    for (final stock in stocks) {
      List<int> ids = [];
      if (stock.extras != null && (stock.extras?.isNotEmpty ?? false)) {
        for (final item in stock.extras!) {
          ids.add(item.id ?? 0);
        }
      }
      ids = ids.toSet().toList();

      extras.add(
        {
          'price': stock.price,
          'quantity': stock.quantity,
          if (stock.sku != null) 'sku': stock.sku,
          if (ids.isNotEmpty) 'ids': ids,
          if (stock.wholeSalePrices != null)
            'whole_sales': List<dynamic>.from(
              stock.wholeSalePrices!.map((x) => x.toJson(withOutId: true)),
            ),
          if (deletedStocks.isNotEmpty) 'delete_ids': deletedStocks
        },
      );
    }
    final data = {'extras': extras};
    debugPrint('===> update stocks request ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.post(
        '/api/v1/dashboard/seller/products/$uuid/stocks',
        data: data,
      );
      return ApiResult.success(
        data: SingleProductResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> update stocks fail: $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<SingleProductResponse>> updateProduct({
    required Map<String, List<String>> titlesAndDescriptions,
    required String tax,
    required String minQty,
    required String maxQty,
    required bool active,
    bool? digital,
    int? ageLimit,
    int? categoryId,
    int? unitId,
    int? brandId,
    List<String>? images,
    List<String>? previews,
    String? uuid,
    required String interval,
    bool needAddons = false,
  }) async {
    final data = {
      'title': {
        for (int i = 0; i < titlesAndDescriptions.keys.length; i++)
          titlesAndDescriptions.keys.toList()[i]:
              titlesAndDescriptions[titlesAndDescriptions.keys.toList()[i]]
                      ?.first ??
                  ""
      },
      'description': {
        for (String locale in titlesAndDescriptions.keys)
          locale: titlesAndDescriptions[locale]?.last ?? ""
      },
      'tax': num.tryParse(tax),
      'min_qty': int.tryParse(minQty),
      'max_qty': int.tryParse(maxQty),
      'active': active ? true : false,
      if (brandId != null) 'brand_id': brandId,
      'age_limit': ageLimit,
      'digital': digital,
      if (categoryId != null) 'category_id': categoryId,
      if (unitId != null) 'unit_id': unitId,
      if (previews != null) 'previews': previews,
      'images': images,
      if (needAddons) 'addon': 1,
      'interval': num.tryParse(interval),
    };
    debugPrint('===> update product ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.put(
        '/api/v1/dashboard/seller/products/$uuid',
        data: data,
      );
      return ApiResult.success(
        data: SingleProductResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> update product fail: $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
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
  }) async {
    final data = {
      'title': {LocalStorage.getLanguage()?.locale ?? 'en': title},
      'description': {
        LocalStorage.getLanguage()?.locale ?? 'en': description
      },
      'tax': num.tryParse(tax),
      'min_qty': num.tryParse(minQty),
      'max_qty': num.tryParse(maxQty),
      'age_limit': num.tryParse(ageLimit),
      'active': active ? 1 : 0,
      'digital': digital ? 1 : 0,
      'bar_code': "qrcode",
      'interval': num.tryParse(interval),
      if (categoryId != null) 'category_id': categoryId,
      if (unitId != null) 'unit_id': unitId,
      if (brandId != null) 'brand_id': brandId,
      if (image != null) 'images': image,
      if (previews != null) 'previews': previews,
    };
    debugPrint('===> create product ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.post(
        '/api/v1/dashboard/seller/products',
        data: data,
      );
      return ApiResult.success(
        data: SingleProductResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> create product fail: $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<SingleProductResponse>> getProductDetails(
    String uuid,
  ) async {
    final data = {
      'currency_id': LocalStorage.getSelectedCurrency()?.id,
      'lang': LocalStorage.getLanguage()?.locale,
    };
    try {
      final client = dioHttp.client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/products/$uuid',
        queryParameters: data,
      );
      return ApiResult.success(
        data: SingleProductResponse.fromJson(response.data),
      );
    } catch (e, s) {
      debugPrint('==> get product details failure: $e,$s');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<SingleProductResponse>> getProductDetailsEdited(
    String uuid,
  ) async {
    final data = {
      'currency_id': LocalStorage.getSelectedCurrency()?.id,
      'lang': LocalStorage.getLanguage()?.locale,
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/seller/products/$uuid',
        queryParameters: data,
      );
      return ApiResult.success(
        data: SingleProductResponse.fromJson(response.data),
      );
    } catch (e, s) {
      debugPrint('==> get product details failure: $e,$s');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<ProductsPaginateResponse>> getProducts({
    required int page,
    int? categoryId,
    String? query,
    ProductStatus? status,
    int? brandId,
    int? shopId,
    bool? isNew,
    List<int>? brandIds,
    List<int>? categoryIds,
    List<int>? extrasId,
    num? priceTo,
    num? priceFrom,
    bool active = false,
  }) async {
    String? statusText;
    if (status != null) {
      switch (status) {
        case ProductStatus.pending:
          statusText = 'pending';
          break;
        case ProductStatus.published:
          statusText = 'published';
          break;
        case ProductStatus.unpublished:
          statusText = 'unpublished';
          break;
        default:
          statusText = 'published';
          break;
      }
    }

    final data = {
      if (query != null) 'search': query,
      'perPage': 10,
      "page": page,
      if (categoryIds != null)
        for (int i = 0; i < categoryIds.length; i++)
          'category_ids[$i]': categoryIds[i],
      if (brandIds != null)
        for (int i = 0; i < brandIds.length; i++) 'brand_ids[$i]': brandIds[i],
      if (extrasId != null)
        for (int i = 0; i < extrasId.length; i++) 'extras[$i]': extrasId[i],
      if (priceTo != null) "price_to": priceTo,
      if (priceFrom != null) 'price_from': priceFrom,
      if (categoryId != null) 'category_id': categoryId,
      if (brandId != null) 'brand_id': brandId,
      if (shopId != null) 'shop_id': shopId,
      if (isNew ?? false) "column": "created_at",
      if (isNew ?? false) 'sort': 'desc',
      'currency_id': LocalStorage.getSelectedCurrency()?.id,
      'lang': LocalStorage.getLanguage()?.locale,
      if (active) 'active': 1,
      if (statusText != null) 'status': statusText,
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/seller/products/paginate',
        queryParameters: data,
      );
      return ApiResult.success(
        data: ProductsPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get products failure: $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<FilterResponse>> fetchFilter({
    required String type,
    List<int>? brandId,
    List<int>? categoryId,
    List<int>? extrasId,
    num? priceTo,
    num? priceFrom,
  }) async {
    final data = {
      if (categoryId != null)
        for (int i = 0; i < categoryId.length; i++)
          'category_ids[$i]': categoryId[i],
      if (brandId != null)
        for (int i = 0; i < brandId.length; i++) 'brand_ids[$i]': brandId[i],
      if (extrasId != null)
        for (int i = 0; i < extrasId.length; i++) 'extras[$i]': extrasId[i],
      if (priceTo != null) "price_to": priceTo,
      'shop_ids[0]': LocalStorage.getUser()?.shop?.id,
      if (priceFrom != null) 'price_from': priceFrom,
      'currency_id': LocalStorage.getSelectedCurrency()?.id,
      'lang': LocalStorage.getLanguage()?.locale,
      'type': type,
      // 'active': true,
      // 'status': "published",
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
        '/api/v1/rest/filter',
        queryParameters: data,
      );
      return ApiResult.success(data: FilterResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> fetch filter rest failure: $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<FilterResponse>> fetchAllFilter({
    required String type,
    List<int>? brandId,
    List<int>? categoryId,
    List<int>? extrasId,
    num? priceTo,
    num? priceFrom,
  }) async {
    final data = {
      if (categoryId != null)
        for (int i = 0; i < categoryId.length; i++)
          'category_ids[$i]': categoryId[i],
      if (brandId != null)
        for (int i = 0; i < brandId.length; i++) 'brand_ids[$i]': brandId[i],
      if (extrasId != null)
        for (int i = 0; i < extrasId.length; i++) 'extras[$i]': extrasId[i],
      if (priceTo != null) "price_to": priceTo,
      if (priceFrom != null) 'price_from': priceFrom,
      'currency_id': LocalStorage.getSelectedCurrency()?.id,
      'lang': LocalStorage.getLanguage()?.locale,
      'type': type,
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/seller/filter',
        queryParameters: data,
      );
      return ApiResult.success(data: FilterResponse.fromJson(response.data));
    } catch (e, s) {
      debugPrint('==> fetch filter failure: $e, $s');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }
}
