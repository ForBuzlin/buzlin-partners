import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venderuzmart/infrastructure/models/data/service_extra_data.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

part 'service_extras_state.freezed.dart';

@freezed
class ServiceExtrasState with _$ServiceExtrasState {
  const factory ServiceExtrasState({
    @Default(false) bool isLoading,
    @Default([]) List<ServiceExtrasData> extras,
  }) = _ServiceExtrasState;

  const ServiceExtrasState._();
}
