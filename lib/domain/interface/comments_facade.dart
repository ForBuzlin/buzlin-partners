import 'package:venderuzmart/domain/handlers/handlers.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

abstract class CommentsFacade {
  Future<ApiResult<CommentsPaginateResponse>> getProductComments({
    int? page,
  });

  Future<ApiResult<ShopCommentsPaginateResponse>> getShopComments({
    int? page,
  });
}
