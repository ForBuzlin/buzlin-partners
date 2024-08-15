import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'working_days_state.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

class WorkingDaysNotifier extends StateNotifier<WorkingDaysState> {
  final ShopsFacade _shopsRepository;

  WorkingDaysNotifier(this._shopsRepository) : super(const WorkingDaysState());

  Future<void> updateWorkingDays({
    required List<WorkingDay> days,
    String? shopUuid,
    VoidCallback? updateSuccess,
  }) async {
    state = state.copyWith(isLoading: true, workingDays: days);
    final response = await _shopsRepository.updateShopWorkingDays(
      workingDays: days,
      uuid: shopUuid,
    );
    response.when(
      success: (data) {
        state = state.copyWith(isLoading: false);
        updateSuccess?.call();
      },
      failure: (failure, status) {
        state = state.copyWith(isLoading: false);
        debugPrint('==> error update working days $failure');
      },
    );
  }

  void setShopWorkingDays(List<WorkingDay>? workingDays) async {
    state = state.copyWith(workingDays: workingDays ?? []);
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
}
