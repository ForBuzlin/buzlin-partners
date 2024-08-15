import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_masters_state.freezed.dart';

@freezed
class NewMastersState with _$NewMastersState {
  const factory NewMastersState({
    @Default(false) bool isLoading,
    @Default([]) List<UserData> users,
    @Default(0) int totalCount,
  }) = _NewMastersState;

  const NewMastersState._();
}
