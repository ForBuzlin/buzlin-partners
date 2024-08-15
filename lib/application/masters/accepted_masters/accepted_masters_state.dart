import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'accepted_masters_state.freezed.dart';

@freezed
class AcceptedMastersState with _$AcceptedMastersState {
  const factory AcceptedMastersState({
    @Default(false) bool isLoading,
    @Default([]) List<UserData> users,
    @Default(0) int totalCount,
  }) = _AcceptedMastersState;

  const AcceptedMastersState._();
}
