import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

part 'add_service_state.freezed.dart';

@freezed
class AddServiceState with _$AddServiceState {
  const factory AddServiceState({
    @Default(true) bool active,
    @Default(false) bool isLoading,
    ServiceData? serviceData,
    @Default([]) List<String> images,
    @Default([]) List<Galleries> listOfUrls,
  }) = _AddServiceState;

  const AddServiceState._();
}
