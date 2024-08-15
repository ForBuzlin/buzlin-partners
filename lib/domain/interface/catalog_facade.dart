import 'package:venderuzmart/infrastructure/services/services.dart';

import '../handlers/handlers.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

abstract class CatalogFacade {
  Future<ApiResult<UnitsPaginateResponse>> getUnits();

  Future<ApiResult<void>> createCategory({
    required String title,
    required bool active,
    String? image,
    String? description,
    String? type,
    int? parentId,
    int? input,
  });

  Future<ApiResult> updateCategory({
    required String title,
    required bool active,
    required String id,
    String? image,
    String? description,
    String? type,
    int? input,
    int? parentId,
  });

  Future<ApiResult<CategoriesPaginateResponse>> getCategories({
    int? page,
    String? query,
    String? type,
    CategoryStatus? status,
    bool? active,
  });

  Future<ApiResult<SingleCategoryResponse>> fetchSingleCategory(String? uuid);
}
