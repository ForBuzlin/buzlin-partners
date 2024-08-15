import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter/material.dart';

import 'accepted_masters_state.dart';

class AcceptedMastersNotifier extends StateNotifier<AcceptedMastersState> {
  final MastersFacade _mastersRepository;

  AcceptedMastersNotifier(this._mastersRepository)
      : super(const AcceptedMastersState());
  int _page = 0;

  Future<void> fetchMembers({
    required BuildContext context,
    RefreshController? refreshController,
    bool isRefresh = false,
    int? serviceId,
  }) async {
    if (isRefresh) {
      _page = 0;
      refreshController?.resetNoData();
      state = state.copyWith(users: [], isLoading: true);
    }
    final response = await _mastersRepository.getMasters(
      page: ++_page,
      inviteStatus: TrKeys.accepted,
      serviceId: serviceId
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
        debugPrint('====> fetch accepted masters fail $failure');
        AppHelpers.errorSnackBar(context, text: failure);
      },
    );
  }
}
