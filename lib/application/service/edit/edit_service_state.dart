import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

part 'edit_service_state.freezed.dart';

@freezed
class EditServiceState with _$EditServiceState {
  const factory EditServiceState({
    @Default(true) bool active,
    @Default(false) bool isLoading,
    @Default(false) bool isUpdating,
    ServiceData? serviceData,
    @Default([]) List<String> images,
    @Default([]) List<Galleries> listOfUrls,
  }) = _EditServiceState;

  const EditServiceState._();
}
