import '../handlers/handlers.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

abstract class ServiceMasterFacade {
  Future<ApiResult<ServiceResponse>> createService({
    required int? masterId,
    required num price,
    required int pause,
    required int interval,
    required num discount,
    required num commissionFee,
    required int serviceId,
  });

  Future<ApiResult<ServiceResponse>> updateService({
    required int? id,
    required num price,
    required num discount,
    required num commissionFee,
    required int pause,
    required int interval,
    required int serviceId,
    required int masterId,
  });

  Future<ApiResult<ServicePaginateResponse>> getServices({
    int? page,
    int? categoryId,
    num? priceFrom,
    num? priceTo,
    int? intervalFrom,
    int? intervalTo,
    int? masterId,
    int? pauseFrom,
    int? pauseTo,
    String? query,
    String? status,
    bool? active,
  });

  Future<ApiResult<ServiceResponse>> fetchSingleService(int? id);

  Future<ApiResult> deleteService(int? id);
}
