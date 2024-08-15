import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter/material.dart';

import 'cancelled_masters_state.dart';

class CancelledMastersNotifier extends StateNotifier<CancelledMastersState> {
  final MastersFacade _mastersRepository;

  CancelledMastersNotifier(this._mastersRepository) : super(const CancelledMastersState());
  int _page = 0;

  Future<void> fetchMembers({
    RefreshController? refreshController,
    bool isRefresh = false,
  }) async {
    if (isRefresh) {
      _page = 0;
      refreshController?.resetNoData();
      state = state.copyWith(users: [], isLoading: true);
    }
    final response = await _mastersRepository.getMasters(
      page: ++_page,
      inviteStatus: TrKeys.canceled,
    );
    response.when(
      success: (data) {
        List<UserData> list = List.from(state.users);
        list.addAll(data.data ?? []);
        state = state.copyWith(
          isLoading: false,
          users: list,
          totalCount: data.meta?.total ?? 0,
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
        debugPrint('====> fetch cancelled masters fail $failure');
      },
    );
  }
}
