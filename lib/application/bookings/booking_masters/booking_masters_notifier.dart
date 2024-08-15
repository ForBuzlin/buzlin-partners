import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter/material.dart';

import 'booking_masters_state.dart';

class BookingMastersNotifier extends StateNotifier<BookingMastersState> {
  final UsersFacade _usersRepository;

  BookingMastersNotifier(this._usersRepository)
      : super(const BookingMastersState());
  int _page = 0;

  Future<void> fetchMasters({
    required BuildContext context,
    RefreshController? refreshController,
    bool isRefresh = false,
    bool isInitial = false,
  }) async {
    if (isInitial) {
      _page = 0;
      refreshController?.resetNoData();
    }
    if (isRefresh) {
      _page = 0;
      refreshController?.resetNoData();
      state = state.copyWith(users: [], isLoading: true);
    }
    final response = await _usersRepository.searchUsers(
      page: ++_page,
      role: TrKeys.master,
      inviteStatus: TrKeys.accepted,
    );
    response.when(
      success: (data) {
        List<UserData> list = isInitial ? [] : List.from(state.users);
        list.addAll(data.data ?? []);
        state = state.copyWith(
          isLoading: false,
          users: list,
        );
        if (isRefresh) {
          refreshController?.refreshCompleted();
          return;
        } else if (data.data?.isEmpty ?? true) {
          refreshController?.loadNoData();
          return;
        }
        refreshController?.loadComplete();
        return;
      },
      failure: (failure, status) {
        debugPrint('====> fetch accepted masters fail $failure');
        AppHelpers.errorSnackBar(context, text: failure);
      },
    );
  }
}
