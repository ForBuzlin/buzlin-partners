import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:venderuzmart/infrastructure/models/models.dart';

part 'disable_times_state.freezed.dart';

@freezed
class MasterDisableTimesState with _$MasterDisableTimesState {
  const factory MasterDisableTimesState({
    @Default(false) bool isLoading,
    @Default(false) bool isUpdate,
    DisableTimes? disableTime,
  }) = _MasterDisableTimesState;

  const MasterDisableTimesState._();
}
