import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

part 'address_state.freezed.dart';

@freezed
class AddressState with _$AddressState {
  const factory AddressState({
    @Default([]) List<CountryData> countries,
    @Default([]) List<CityData> cities,
    @Default(false) bool isLoading,
    @Default(false) bool isCityLoading,
  }) = _AddressState;
}
