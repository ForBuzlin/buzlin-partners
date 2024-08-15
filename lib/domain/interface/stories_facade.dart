import 'package:venderuzmart/infrastructure/models/models.dart';
import '../handlers/handlers.dart';

abstract class StoriesFacade {
  Future<ApiResult<StoriesResponse>> getStories({
    int? page,
  });

  Future<ApiResult<void>> deleteStories(int id);

  Future<ApiResult> createStories({required List<String> img, int? id});

  Future<ApiResult> updateStories({
    required List<String> img,
    int? id,
    required int storyId,
  });
}
