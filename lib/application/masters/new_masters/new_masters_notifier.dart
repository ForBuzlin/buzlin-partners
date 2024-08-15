import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter/material.dart';

import 'new_masters_state.dart';

class NewMastersNotifier extends StateNotifier<NewMastersState> {
  final MastersFacade _mastersRepository;

  NewMastersNotifier(this._mastersRepository) : super(const NewMastersState());
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
      inviteStatus: TrKeys.newKey,
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
        debugPrint('====> fetch new masters fail $failure');
      },
    );
  }

  addCreatedUser(UserData? user) {
    if (user == null) return;
    List<UserData> users = List.from(state.users);
    users.add(user);
    state = state.copyWith(users: users);
  }
}
