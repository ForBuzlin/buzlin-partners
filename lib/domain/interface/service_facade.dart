import 'package:venderuzmart/infrastructure/models/data/faq_data.dart';
import '../handlers/handlers.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

abstract class ServiceFacade {
  Future<ApiResult<ServiceResponse>> createService({
    required num price,
    required int pause,
    required String type,
    required int interval,
    required String title,
    required String gender,
    required int categoryId,
    required List<String> images,
    String? description,
  });

  Future<ApiResult<ServiceResponse>> updateService({
    required int? id,
    required num price,
    required int pause,
    required String type,
    required String gender,
    required int interval,
    required String title,
    required int categoryId,
    required List<String> images,
    String? description,
  });

  Future<ApiResult<ServicePaginateResponse>> getServices({
    int? page,
    int? categoryId,
    num? priceFrom,
    num? priceTo,
    int? intervalFrom,
    int? intervalTo,
    int? pauseFrom,
    int? pauseTo,
    String? query,
    String? status,
    bool? active
  });

  Future<ApiResult<ServiceResponse>> fetchSingleService(int? id);

  Future<ApiResult> deleteService(int? id);

  Future<ApiResult> updateFaqs({
    required int? serviceId,
    required List<FaqData> faqs,
  });
}
