import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'working_days_state.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

class MasterWorkingDaysNotifier extends StateNotifier<MasterWorkingDaysState> {
  final MastersFacade _mastersRepository;
  int _page = 0;

  MasterWorkingDaysNotifier(this._mastersRepository)
      : super(const MasterWorkingDaysState());
  int? masterId;

  Future<void> updateWorkingDays({
    required List<WorkingDay> days,
    int? id,
    VoidCallback? updateSuccess,
  }) async {
    state = state.copyWith(isLoading: true, workingDays: days);
    final response = await _mastersRepository.updateWorkingDays(
      workingDays: days,
      id: id,
    );
    response.when(
      success: (data) {
        state = state.copyWith(isLoading: false);
        updateSuccess?.call();
      },
      failure: (failure, status) {
        state = state.copyWith(isLoading: false);
        debugPrint('==> error update master working days $failure');
      },
    );
  }

  Future<void> getClosedDays(
    DateTime? date, {
    VoidCallback? updateSuccess,
  }) async {
    state = state.copyWith(isCloseDayLoading: true);
    final response = await _mastersRepository.getClosedDays(
        masterId: masterId,
        from: date?.firstDayOfMonth,
        to: date?.lastDayOfMonth);
    response.when(
      success: (data) {
        state = state.copyWith(
            isCloseDayLoading: false, closedDays: data.data ?? []);
        updateSuccess?.call();
      },
      failure: (failure, status) {
        state = state.copyWith(isCloseDayLoading: false);
        debugPrint('==> get closed days failure: $failure');
      },
    );
  }

  Future<void> getDisableTimes(
    BuildContext context, {
    RefreshController? refreshController,
    VoidCallback? updateSuccess,
    bool isRefresh = false,
  }) async {
    if (isRefresh) {
      _page = 0;
      refreshController?.resetNoData();
      state = state.copyWith(disableTimes: [], isDisableLoading: true);
    }
    final response = await _mastersRepository.getDisableTimes(
      page: ++_page,
      masterId: masterId,
    );
    response.when(
      success: (data) {
        List<DisableTimes> list = List.from(state.disableTimes);
        list.addAll(data.data ?? []);
        state = state.copyWith(isDisableLoading: false, disableTimes: list);
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
        state = state.copyWith(isDisableLoading: false);
        debugPrint('==> get disable times failure: $failure');
        AppHelpers.errorSnackBar(context, text: failure);
      },
    );
  }

  void setWorkingDays(List<WorkingDay>? workingDays, UserData? master) async {
    masterId = master?.id;
    state = state.copyWith(
      workingDays: workingDays ?? [],
      masterStatus: (master?.invitations?.isNotEmpty ?? false)
          ? master?.invitations?.first.status
          : null,
    );
  }

  void setClosedDays(List<DateTime?> dates) async {
    state = state.copyWith(
      closedDays: dates.map((e) => ClosedDates(date: e)).toList(),
    );
  }

  void changeIndex(WorkingDay? day) {
    int index = 0;
    if (day != null) {
      for (int i = 0; i < state.workingDays.length; i++) {
        if (state.workingDays[i].id == day.id) {
          index = i;
        }
      }
    }
    state = state.copyWith(currentIndex: index);
  }

  Future<void> updateClosedDays({
    VoidCallback? updateSuccess,
  }) async {
    state = state.copyWith(isUpdating: true);
    final response = await _mastersRepository.updateClosedDays(
      days: state.closedDays.map((e) => e.date ?? DateTime.now()).toList(),
      masterId: masterId,
    );
    response.when(
      success: (data) {
        state = state.copyWith(isUpdating: false);
        updateSuccess?.call();
      },
      failure: (failure, status) {
        state = state.copyWith(isUpdating: false);
        debugPrint('==> error update master working days $failure');
      },
    );
  }

  deleteDisableTime(BuildContext context, int? id) async {
    state = state.copyWith(isLoading: true);
    final response = await _mastersRepository.deleteDisableTimes(id);
    response.when(
      success: (success) {
        List<DisableTimes> list = List.from(state.disableTimes);
        list.removeWhere((element) => element.id == id);
        state = state.copyWith(disableTimes: list);
      },
      failure: (failure, status) {
        AppHelpers.errorSnackBar(context, text: failure,);
      },
    );
    state = state.copyWith(isLoading: false);
  }
}
