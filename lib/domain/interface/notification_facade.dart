import 'package:venderuzmart/domain/handlers/api_result.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

abstract class NotificationFacade {
  Future<ApiResult<TransactionListResponse>> getTransactions({
    int? page,
  });

  Future<ApiResult<NotificationResponse>> getNotifications({
    int? page,
  });

  Future<ApiResult<ReadOneNotificationResponse>> readOne({
    int? id,
  });

  Future<ApiResult<NotificationResponse>> readAll();

  Future<ApiResult<NotificationResponse>> showSingleUser({
    int? id,
  });

  Future<ApiResult<CountNotificationData>> getCount();

  Future<ApiResult<bool>> deleteNotification({int? id});
}
