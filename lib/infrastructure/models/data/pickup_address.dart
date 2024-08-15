import 'city_data.dart';
import 'country_data.dart';
import 'delivery_points_data.dart';

class PickupAddress {
  CountryData? country;
  CityData? city;
  DeliveryPointsData? deliveryPoint;

  PickupAddress({
    this.country,
    this.city,
    this.deliveryPoint,
  });

  PickupAddress copyWith({
    CountryData? country,
    CityData? city,
    DeliveryPointsData? deliveryPoint,
  }) =>
      PickupAddress(
        country: country ?? this.country,
        city: city ?? this.city,
        deliveryPoint: deliveryPoint ?? this.deliveryPoint,
      );

  factory PickupAddress.fromJson(Map<String, dynamic> json) => PickupAddress(
        country: json["country"] == null
            ? null
            : CountryData.fromJson(json["country"]),
        city: json["city"] == null ? null : CityData.fromJson(json["city"]),
        deliveryPoint: json["delivery_point"] == null
            ? null
            : DeliveryPointsData.fromJson(json["delivery_point"]),
      );

  Map<String, dynamic> toJson() => {
        "country": country?.toJson(),
        "city": city?.toJson(),
        "delivery_point": deliveryPoint?.toJson(),
      };
}
