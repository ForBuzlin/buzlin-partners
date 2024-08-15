import 'package:flutter/material.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/infrastructure/models/data/disable_times.dart';
import 'package:venderuzmart/infrastructure/models/data/translation.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'disable_times_state.dart';

class MasterDisableTimesNotifier
    extends StateNotifier<MasterDisableTimesState> {
  final MastersFacade _mastersRepository;

  MasterDisableTimesNotifier(this._mastersRepository)
      : super(const MasterDisableTimesState());
  String? _endValue;
  String? _customRepeatValue;
  String? _customRepeatType;

  setRepeats(String repeats) {
    state = state.copyWith(
      disableTime: state.disableTime?.copyWith(repeats: repeats),
    );
  }

  setEndType(String endType) {
    state = state.copyWith(
      disableTime: state.disableTime?.copyWith(endType: endType),
    );
  }

  setTimeTo(String? value) {
    state = state.copyWith(
      disableTime: state.disableTime?.copyWith(to: value),
    );
  }

  setTimeFrom(String? value) {
    state = state.copyWith(
      disableTime: state.disableTime?.copyWith(from: value),
    );
  }

  setDateTime(DateTime? value) {
    state = state.copyWith(
      disableTime: state.disableTime?.copyWith(date: value),
    );
  }

  setEndDate(DateTime? value) => _endValue = DateService.dateFormatDay(value);

  setEndValue(String value) => _endValue = value;

  setCustomRepeatValue(String value) => _customRepeatValue = value;

  setCustomRepeatType(String value) => _customRepeatType = value;

  clearAll() {
    DisableTimes disableTime = DisableTimes(
      repeats: DropDownValues.repeatsList.first,
      endType: DropDownValues.endTypeList.first,
      customRepeatType: DropDownValues.customRepeatType.first,
    );
    state = state.copyWith(
      disableTime: disableTime,
      isLoading: false,
      isUpdate: false,
    );
  }

  fetchDisableTimeDetails(
    BuildContext context, {
    required DisableTimes? disableTime,
  }) async {
    disableTime = disableTime?.copyWith(
      repeats: disableTime.repeats ?? DropDownValues.repeatsList.first,
      endType: disableTime.endType ?? DropDownValues.endTypeList.first,
      customRepeatType:
          disableTime.customRepeatType ?? DropDownValues.customRepeatType.first,
    );
    state = state.copyWith(
      disableTime: disableTime,
      isLoading: true,
      isUpdate: false,
    );
    final res = await _mastersRepository.getDisableTimeDetails(disableTime?.id);
    res.when(success: (data) {
      state = state.copyWith(isLoading: false, disableTime: data.data);
    }, failure: (failure, status) {
      state = state.copyWith(isLoading: false);
      AppHelpers.errorSnackBar(context, text: failure);
    });
  }

  Future<void> updateDisableTimes({
    required String title,
    required String desc,
    VoidCallback? updateSuccess,
  }) async {
    state = state.copyWith(isUpdate: true);
    final response = await _mastersRepository.updateDisableTimes(
      time: state.disableTime?.copyWith(
          translation: Translation(
            title: title,
            description: desc,
          ),
          customRepeatValue: (_customRepeatValue?.isNotEmpty ?? false)
              ? [_customRepeatValue!]
              : null,
          endValue: _endValue,
          customRepeatType: _customRepeatType),
      id: state.disableTime?.id,
    );
    response.when(
      success: (data) {
        state = state.copyWith(isUpdate: false);
        updateSuccess?.call();
      },
      failure: (failure, status) {
        state = state.copyWith(isUpdate: false);
        debugPrint('==> error update disable times days $failure');
      },
    );
  }

  Future<void> addDisableTimes({
    required String title,
    required String desc,
    VoidCallback? createdSuccess,
  }) async {
    state = state.copyWith(isUpdate: true);
    final response = await _mastersRepository.addDisableTimes(
      time: state.disableTime?.copyWith(
          translation: Translation(
            title: title,
            description: desc,
          ),
          customRepeatValue: (_customRepeatValue?.isNotEmpty ?? false)
              ? [_customRepeatValue!]
              : null,
          endValue: _endValue,
          customRepeatType: _customRepeatType),
    );
    response.when(
      success: (data) {
        state = state.copyWith(isUpdate: false);
        createdSuccess?.call();
      },
      failure: (failure, status) {
        state = state.copyWith(isUpdate: false);
        debugPrint('==> error update disable times days $failure');
      },
    );
  }
}
