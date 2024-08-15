import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

part 'service_state.freezed.dart';

@freezed
class ServiceState with _$ServiceState {
  const factory ServiceState({
    @Default(false) bool isLoading,
    @Default([]) List<ServiceData> allServices,
    @Default([]) List<ServiceData> services,
  }) = _ServiceState;

  const ServiceState._();
}
