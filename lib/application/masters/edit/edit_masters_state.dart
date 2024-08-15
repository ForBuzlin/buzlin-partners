import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

part 'edit_masters_state.freezed.dart';

@freezed
class EditMastersState with _$EditMastersState {
  const factory EditMastersState({
    @Default(false) bool isLoading,
    @Default(false) bool isUpdating,
    @Default(null) String? imageFile,
    UserData? master,
  }) = _EditMastersState;

  const EditMastersState._();
}
