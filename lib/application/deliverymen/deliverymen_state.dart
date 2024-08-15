import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'deliverymen_state.freezed.dart';

@freezed
class DeliverymenState with _$DeliverymenState {
  const factory DeliverymenState({
    @Default(false) bool isLoading,
    @Default(false) bool isUpdate,
    @Default([]) List<UserData> users,
    @Default(-1) int statusIndex,
  }) = _DeliverymenState;

  const DeliverymenState._();
}
