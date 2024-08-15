import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

part 'edit_service_master_state.freezed.dart';

@freezed
class EditServiceExtrasState with _$EditServiceExtrasState {
  const factory EditServiceExtrasState({
    @Default(true) bool active,
    @Default(false) bool isLoading,
    @Default(false) bool isUpdating,
    ServiceExtrasData? extrasData,
    String? imageFile,
  }) = _EditServiceExtrasState;

  const EditServiceExtrasState._();
}
