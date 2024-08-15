import 'package:venderuzmart/infrastructure/models/models.dart';
import '../handlers/handlers.dart';

abstract class DiscountsFacade {
  Future<ApiResult<DiscountPaginateResponse>> getAllDiscounts({
    int? page,
    bool isPagination = false,
  });

  Future<ApiResult<void>> deleteDiscount(int? discountId);

  Future<ApiResult> addDiscount({
    required String type,
    required num price,
    required bool active,
    required String startDate,
    required String endDate,
    required List ids,
    String? image,
  });

  Future<ApiResult> updateDiscount({
    required String type,
    required num price,
    required bool active,
    required String startDate,
    required String endDate,
    required List ids,
    String? image,
    required int id,
  });

  Future<ApiResult> getDiscountDetails({required int id});
}
