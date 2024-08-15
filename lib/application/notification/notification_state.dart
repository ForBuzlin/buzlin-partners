import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

part 'notification_state.freezed.dart';

@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState({
    @Default([]) List<NotificationTransactionData> transaction,
    @Default(0) int totalCount,
    @Default(false) bool isTransactionsLoading,
    @Default(true) bool hasMoreTransactions,
    @Default([]) List<NotificationData> notifications,
    @Default(null) CountNotificationData? countOfNotifications,
    @Default(0) int totalCountNotification,
    @Default(false) bool isNotificationLoading,
    @Default(false) bool isMoreNotificationLoading,
    @Default(true) bool hasMoreNotification,
    @Default(false) bool isReadAllLoading,
    @Default(false) bool isShowUserLoading,
    @Default(false) bool isAllNotificationsLoading,
    @Default(false) bool isFirstTimeNotification,
    @Default(false) bool isFirstTransaction,
    @Default(0) int total,
  }) = _NotificationState;

  const NotificationState._();
}
