import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

part 'edit_service_master_state.freezed.dart';

@freezed
class EditServiceMasterState with _$EditServiceMasterState {
  const factory EditServiceMasterState({
    @Default(true) bool active,
    @Default(false) bool isLoading,
    @Default(false) bool isUpdating,
    ServiceData? serviceData,
  }) = _EditServiceMasterState;

  const EditServiceMasterState._();
}
