import '../handlers/handlers.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

abstract class StockFacade {
  Future<ApiResult<StockPaginateResponse>> getStocks({
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
  });
}
