import 'package:venderuzmart/infrastructure/models/models.dart';
import '../handlers/handlers.dart';

abstract class LooksFacade {
  Future<ApiResult<LooksResponse>> getLooks({int? page});

  Future<ApiResult<void>> deleteLooks(int? id);

  Future<ApiResult<SingleLooksResponse>> addLooks({
    required bool active,
    required String title,
    required String description,
    required List<dynamic> products,
    String? image,
  });

  Future<ApiResult<SingleLooksResponse>> updateLooks({
    required bool active,
    required String title,
    required String description,
    required List<dynamic> products,
    String? image,
    required int id,
  });

  Future<ApiResult<SingleLooksResponse>> getLooksDetails({required int id});
}
