import 'city_data.dart';
import 'delivery_points_data.dart';
import 'location_data.dart';

class MyAddress {
  int? id;
  int? userId;
  int? cityId;
  CityData? city;
  int? regionId;
  int? countryId;
  bool? active;
  LocationData? location;
  String? firstname;
  String? lastname;
  String? phone;
  String? zipcode;
  DeliveryPointsData? deliveryPrice;
  String? streetHouseNumber;
  String? additionalDetails;
  DateTime? createdAt;
  DateTime? updatedAt;

  MyAddress({
    this.id,
    this.city,
    this.cityId,
    this.regionId,
    this.countryId,
    this.userId,
    this.active,
    this.location,
    this.firstname,
    this.lastname,
    this.phone,
    this.zipcode,
    this.deliveryPrice,
    this.streetHouseNumber,
    this.additionalDetails,
    this.createdAt,
    this.updatedAt,
  });

  MyAddress copyWith({
    int? id,
    int? userId,
    int? cityId,
    int? regionId,
    int? countryId,
    CityData? city,
    bool? active,
    LocationData? location,
    String? firstname,
    String? lastname,
    String? phone,
    String? zipcode,
    String? streetHouseNumber,
    String? additionalDetails,
    DateTime? createdAt,
    DateTime? updatedAt,
    DeliveryPointsData? deliveryPrice,
  }) =>
      MyAddress(
        id: id ?? this.id,
        city: city ?? this.city,
        userId: userId ?? this.userId,
        cityId: cityId ?? this.cityId,
        regionId: regionId ?? this.regionId,
        countryId: countryId ?? this.countryId,
        active: active ?? this.active,
        location: location ?? this.location,
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
        phone: phone ?? this.phone,
        zipcode: zipcode ?? this.zipcode,
        streetHouseNumber: streetHouseNumber ?? this.streetHouseNumber,
        additionalDetails: additionalDetails ?? this.additionalDetails,
        deliveryPrice: deliveryPrice ?? this.deliveryPrice,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory MyAddress.fromJson(Map<String, dynamic> json) => MyAddress(
        id: json["id"],
        userId: json["user_id"],
        city: json["city"] == null ? null : CityData.fromJson(json["city"]),
        deliveryPrice: json["delivery_price"] == null
            ? null
            : DeliveryPointsData.fromJson(json["delivery_price"]),
        cityId: json["city_id"],
        regionId: json["region_id"],
        countryId: json["country_id"],
        location: json["location"] == null
            ? null
            : LocationData.fromJson(json["location"]),
        firstname: json["firstname"],
        lastname: json["lastname"],
        phone: json["phone"],
        zipcode: json["zipcode"] == null ? null : (json["zipcode"].toString()),
        streetHouseNumber: json["street_house_number"] == null
            ? null
            : (json["street_house_number"].toString()),
        additionalDetails: json["additional_details"] == null
            ? null
            : (json["additional_details"].toString()),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.tryParse(json["created_at"])?.toLocal(),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.tryParse(json["updated_at"])?.toLocal(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "city_id": cityId,
        "region_id": regionId,
        "country_id": countryId,
        "location": location?.toJson(),
        "city": city?.toJson(),
        "firstname": firstname,
        "delivery_price": deliveryPrice,
        "lastname": lastname,
        "phone": phone,
        "zipcode": zipcode,
        "street_house_number": streetHouseNumber,
        "additional_details": additionalDetails,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
