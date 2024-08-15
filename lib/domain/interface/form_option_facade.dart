import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/domain/handlers/api_result.dart';

abstract class FormOptionFacade {
  Future<ApiResult<SingleFormOptionsResponse>> getFormOptionsDetails(int? id);

  Future<ApiResult<FormOptionsResponse>> getFormOptions({int? page});

  Future<ApiResult<FormOptionsResponse>> getFormParents({int? page});

  Future<ApiResult<SingleFormOptionsResponse>> addForm({
    required bool required,
    required bool active,
    required int serviceId,
    required String title,
    required String description,
    required List<QuestionData> questions,
  });

  Future<ApiResult<SingleFormOptionsResponse>> updateForm({
    required int? id,
    required int? serviceId,
    required bool required,
    required bool active,
    required String title,
    required String description,
    required List<QuestionData> questions,
  });

  Future<ApiResult<void>> deleteFormOption(int? id);
}
