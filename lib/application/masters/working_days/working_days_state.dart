import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:venderuzmart/infrastructure/models/models.dart';

part 'working_days_state.freezed.dart';

@freezed
class MasterWorkingDaysState with _$MasterWorkingDaysState {
  const factory MasterWorkingDaysState({
    @Default(0) int currentIndex,
    @Default(false) bool isLoading,
    @Default(false) bool isUpdating,
    @Default(null) String? masterStatus,
    @Default(false) bool isCloseDayLoading,
    @Default(false) bool isDisableLoading,
    @Default([]) List<WorkingDay> workingDays,
    @Default([]) List<ClosedDates> closedDays,
    @Default([]) List<DisableTimes> disableTimes,
  }) = _MasterWorkingDaysState;

  const MasterWorkingDaysState._();
}
