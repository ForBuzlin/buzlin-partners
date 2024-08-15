import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

import 'membership_state.dart';

class MembershipNotifier extends StateNotifier<MembershipState> {
  final MembershipFacade _membershipRepository;

  int _page = 0;

  MembershipNotifier(this._membershipRepository)
      : super(const MembershipState());

  fetchMemberships({
    BuildContext? context,
    bool? isRefresh,
    RefreshController? controller,
  }) async {
    if (isRefresh ?? false) {
      controller?.resetNoData();
      _page = 0;
      state = state.copyWith(list: [], isLoading: true);
    }
    final res = await _membershipRepository.getMemberships(
      page: ++_page,
    );
    res.when(success: (data) {
      List<MembershipData> list = List.from(state.list);
      list.addAll(data.data ?? []);
      state = state.copyWith(isLoading: false, list: list);
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
      state = state.copyWith(isLoading: false);
      debugPrint(" ==> fetch ads fail: $failure");
      if (context != null) {
        AppHelpers.errorSnackBar(context, text: failure);
      }
    });
  }

  Future<void> deleteMembership(BuildContext context, int? id) async {
    state = state.copyWith(isLoading: true);
    final response = await _membershipRepository.deleteMembership(id);
    response.when(
      success: (success) {
        List<MembershipData> list = List.from(state.list);
        list.removeWhere((element) => element.id == id);
        state = state.copyWith(list: list);
      },
      failure: (failure, status) {
        AppHelpers.errorSnackBar(
          context,
          text: failure,
        );
      },
    );
    state = state.copyWith(isLoading: false);
  }
}
