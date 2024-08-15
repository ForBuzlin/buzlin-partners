import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cancelled_masters_state.freezed.dart';

@freezed
class CancelledMastersState with _$CancelledMastersState {
  const factory CancelledMastersState({
    @Default(false) bool isLoading,
    @Default([]) List<UserData> users,
    @Default(0) int totalCount,
  }) = _CancelledMastersState;

  const CancelledMastersState._();
}
