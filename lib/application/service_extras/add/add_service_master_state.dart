import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

part 'add_service_master_state.freezed.dart';

@freezed
class AddServiceExtrasState with _$AddServiceExtrasState {
  const factory AddServiceExtrasState({
    @Default(true) bool active,
    @Default(false) bool isLoading,
    ServiceExtrasData? extrasData,
    String? imageFile,
  }) = _AddServiceExtrasState;

  const AddServiceExtrasState._();
}
