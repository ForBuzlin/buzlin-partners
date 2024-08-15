import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

part 'pickup_points_state.freezed.dart';

@freezed
class PickupPointsState with _$PickupPointsState {
  const factory PickupPointsState({
    @Default([]) List<DeliveryPointsData> deliveryPoints,
    @Default(false) bool isLoading,
    @Default({}) Set<Marker> markers,
    @Default(-1) int pickupIndex,
  }) = _PickupPointsState;
}
