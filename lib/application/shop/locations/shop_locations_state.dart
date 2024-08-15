import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

part 'shop_locations_state.freezed.dart';

@freezed
class ShopLocationsState with _$ShopLocationsState {
  const factory ShopLocationsState({
    @Default(false) bool isLoading,
    @Default(false) bool isUpdating,
    @Default([]) List<ShopLocationData> locations,
    int? regionId,
    int? countryId,
    int? cityId,
  }) = _ShopLocationsState;

  const ShopLocationsState._();
}
