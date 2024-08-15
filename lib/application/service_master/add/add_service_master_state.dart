import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

part 'add_service_master_state.freezed.dart';

@freezed
class AddServiceMasterState with _$AddServiceMasterState {
  const factory AddServiceMasterState({
    @Default(true) bool active,
    @Default(false) bool isLoading,
    ServiceData? serviceData,
  }) = _AddServiceMasterState;

  const AddServiceMasterState._();
}
