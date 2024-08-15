
import '../handlers/handlers.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

abstract class ServiceExtrasFacade {
  Future<ApiResult<ServiceExtrasResponse>> createExtras({
    required ServiceExtraRequest request,
  });

  Future<ApiResult<ServiceExtrasResponse>> updateExtras({
    required int? id,
    required ServiceExtraRequest request,
  });

  Future<ApiResult<ServiceExtrasPaginateResponse>> getExtras(
      {int? page, int? serviceId});

  Future<ApiResult<ServiceExtrasResponse>> fetchSingleExtras(int? id);

  Future<ApiResult> deleteExtras(int? id);
}
