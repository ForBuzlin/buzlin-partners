import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

import 'notification_state.dart';

class NotificationNotifier extends StateNotifier<NotificationState> {
  final NotificationFacade _notificationRepository;

  int _page = 0;

  NotificationNotifier(this._notificationRepository)
      : super(const NotificationState());

  Future<void> fetchAllTransactions({
    bool isRefresh = false,
    Function(int)? updateTotal,
  }) async {
    if (isRefresh) {
      _page = 0;
      state = state.copyWith(hasMoreTransactions: true);
    }
    if (!state.hasMoreTransactions) {
      return;
    }
    state = state.copyWith(
        isTransactionsLoading: state.transaction.isEmpty ? true : false);
    final response =
        await _notificationRepository.getTransactions(page: ++_page);
    response.when(
      success: (data) {
        List<NotificationTransactionData> transactions =
            isRefresh ? [] : List.from(state.transaction);
        final List<NotificationTransactionData> newTransactions =
            data.data ?? [];
        transactions.addAll(newTransactions);
        state =
            state.copyWith(hasMoreTransactions: newTransactions.length >= 4);
        if (_page == 1 && !isRefresh) {
          state = state.copyWith(
            isTransactionsLoading: false,
            transaction: transactions,
          );
        } else {
          state = state.copyWith(
            isTransactionsLoading: false,
            transaction: transactions,
          );
        }
      },
      failure: (failure, status) {
        _page--;
        if (_page == 0) {
          state = state.copyWith(isTransactionsLoading: false);
        }
      },
    );
  }

  changeFirst() {
    state =
        state.copyWith(isFirstTimeNotification: true, isFirstTransaction: true);
  }

  fetchNotifications({
    required BuildContext context,
    bool? isRefresh,
    RefreshController? controller,
  }) async {
    if (isRefresh ?? false) {
      controller?.resetNoData();
      _page = 0;
      state =
          state.copyWith(notifications: [], isAllNotificationsLoading: true);
    }
    final res = await _notificationRepository.getNotifications(page: ++_page);
    res.when(success: (data) {
      List<NotificationData> list = List.from(state.notifications);
      list.addAll(data.data ?? []);
      state =
          state.copyWith(isAllNotificationsLoading: false, notifications: list);
      if (isRefresh ?? false) {
        controller?.refreshCompleted();
        return;
      } else if (data.data?.isEmpty ?? true) {
        controller?.loadNoData();
        return;
      }
      controller?.loadComplete();
      return;
    }, failure: (failure, status) {
      state = state.copyWith(isAllNotificationsLoading: false);
      AppHelpers.errorSnackBar(context, text: failure);
    });
  }

  Future<void> readAll(BuildContext context) async {
    List<NotificationData> list = List.from(state.notifications);
    for (var i = 0; i < list.length; i++) {
      if (list[i].readAt == null) {
        list[i] = list[i].copyWith(readAt: DateTime.now());
      }
    }
    state = state.copyWith(
      notifications: list,
      countOfNotifications:
          state.countOfNotifications?.copyWith(notification: 0),
    );
    updateTotal();

    final response = await _notificationRepository.readAll();
    response.when(
      success: (data) {
        debugPrint('Read all success');
      },
      failure: (failure, status) {
        AppHelpers.errorSnackBar(context, text: failure);
      },
    );
  }

  Future<void> readOne(BuildContext context, int? id) async {
    List<NotificationData> list = List.from(state.notifications);
    for (int i = 0; i < list.length; i++) {
      if (list[i].id == id) {
        list[i] = list[i].copyWith(
          readAt: DateTime.now(),
        );
      }
    }
    final notification = state.countOfNotifications?.copyWith(
        notification: (state.countOfNotifications?.notification ?? 0) - 1);
    state =
        state.copyWith(notifications: list, countOfNotifications: notification);
    updateTotal();
    final response = await _notificationRepository.readOne(id: id);
    response.when(
      success: (data) {
        debugPrint('Success read one');
      },
      failure: (failure, status) {
        AppHelpers.errorSnackBar(context, text: failure);
      },
    );
  }

  Future<void> fetchCount(BuildContext context) async {
    final response = await _notificationRepository.getCount();
    response.when(
      success: (data) {
        state = state.copyWith(countOfNotifications: data);
        state = state.copyWith(
            totalCount: (data.notification ?? 0) + (data.transaction ?? 0));

        debugPrint('Success count');
      },
      failure: (failure, status) {
        AppHelpers.errorSnackBar(context, text: failure);
      },
    );
  }

  Future<void> deleteNotification({required int? id}) async {
    List<NotificationData> list = List.from(state.notifications);
    for (int i = 0; i < list.length; i++) {
      if (list[i].id == id) {
        list.removeAt(i);
      }
    }
    state = state.copyWith(notifications: list);
    final response = await _notificationRepository.deleteNotification(id: id);
    response.when(
      success: (data) {
        debugPrint('Success delete');
      },
      failure: (failure, status) {
        debugPrint('delete notification fail: $failure');
      },
    );
  }

  updateTotal() {
    state = state.copyWith(
        totalCount: (state.countOfNotifications?.notification ?? 0) +
            (state.countOfNotifications?.transaction ?? 0));
  }
}
