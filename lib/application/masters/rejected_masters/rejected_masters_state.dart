import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rejected_masters_state.freezed.dart';

@freezed
class RejectedMastersState with _$RejectedMastersState {
  const factory RejectedMastersState({
    @Default(false) bool isLoading,
    @Default([]) List<UserData> users,
    @Default(0) int totalCount,
  }) = _RejectedMastersState;

  const RejectedMastersState._();
}
