import 'delivery_points_data.dart';
import 'location_data.dart';

class DeliveryAddress {
  String? zipCode;
  String? homeNumber;
  String? phoneNumber;
  String? details;
  String? city;
  DeliveryPointsData? deliveryPrice;
  LocationData? location;

  DeliveryAddress({
    this.zipCode,
    this.homeNumber,
    this.phoneNumber,
    this.details,
    this.city,
    this.deliveryPrice,
    this.location,
  });

  DeliveryAddress copyWith({
    String? zipCode,
    String? homeNumber,
    String? phoneNumber,
    String? details,
    String? city,
    DeliveryPointsData? deliveryPrice,
    String? address,
    LocationData? location,
  }) =>
      DeliveryAddress(
        zipCode: zipCode ?? this.zipCode,
        homeNumber: homeNumber ?? this.homeNumber,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        deliveryPrice: deliveryPrice ?? this.deliveryPrice,
        details: details ?? this.details,
        city: city ?? this.city,
        location: location ?? this.location,
      );

  factory DeliveryAddress.fromJson(Map<String, dynamic> json) =>
      DeliveryAddress(
        zipCode: json["zip_code"],
        homeNumber: json["home_number"],
        deliveryPrice: json["delivery_price"] == null
            ? null
            : DeliveryPointsData.fromJson(json["delivery_price"]),
        phoneNumber: json["phone_number"],
        details: json["details"],
        city: json["city"],
        location: json["location"] == null
            ? null
            : LocationData.fromJson(json["location"]),
      );

  Map<String, dynamic> toJson() => {
        "zip_code": zipCode,
        "home_number": homeNumber,
        "phone_number": phoneNumber,
        "delivery_price": deliveryPrice?.toJson(),
        "details": details,
        "city": city,
        "location": location?.toJson(),
      };
}
