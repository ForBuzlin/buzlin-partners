import 'location_data.dart';
import 'notification_transactions_data.dart';
import 'translation.dart';
import 'working_day.dart';

class DeliveryPointsData {
  int? id;
  bool? active;
  int? regionId;
  int? countryId;
  int? cityId;
  int? areaId;
  num? price;
  num? fittingRooms;
  Translation? translation;
  Region? region;
  Area? country;
  Area? city;
  Area? area;
  String? img;
  Address? address;
  LocationData? location;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<WorkingDay>? workingDays;

  DeliveryPointsData({
    this.id,
    this.active,
    this.regionId,
    this.countryId,
    this.cityId,
    this.areaId,
    this.price,
    this.img,
    this.fittingRooms,
    this.translation,
    this.region,
    this.country,
    this.city,
    this.area,
    this.address,
    this.location,
    this.workingDays,
    this.createdAt,
    this.updatedAt,
  });

  DeliveryPointsData copyWith({
    int? id,
    bool? active,
    int? regionId,
    int? countryId,
    int? cityId,
    int? areaId,
    num? price,
    String? img,
    int? fittingRooms,
    Translation? translation,
    Region? region,
    Area? country,
    Area? city,
    Area? area,
    Address? address,
    LocationData? location,
    List<WorkingDay>? workingDays,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      DeliveryPointsData(
        id: id ?? this.id,
        active: active ?? this.active,
        regionId: regionId ?? this.regionId,
        countryId: countryId ?? this.countryId,
        cityId: cityId ?? this.cityId,
        img: img ?? this.img,
        areaId: areaId ?? this.areaId,
        price: price ?? this.price,
        fittingRooms: fittingRooms ?? this.fittingRooms,
        translation: translation ?? this.translation,
        region: region ?? this.region,
        country: country ?? this.country,
        city: city ?? this.city,
        area: area ?? this.area,
        address: address ?? this.address,
        location: location ?? this.location,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        workingDays: workingDays ?? this.workingDays,
      );

  factory DeliveryPointsData.fromJson(Map<String, dynamic> json) {
    return DeliveryPointsData(
      id: json["id"],
      active: json["active"],
      regionId: json["region_id"],
      countryId: json["country_id"],
      cityId: json["city_id"],
      areaId: json["area_id"],
      img: json["img"],
      price: json["price"],
      fittingRooms: json["fitting_rooms"],
      translation: json["translation"] == null
          ? null
          : Translation.fromJson(json["translation"]),
      region: json["region"] == null ? null : Region.fromJson(json["region"]),
      country: json["country"] == null ? null : Area.fromJson(json["country"]),
      city: json["city"] == null ? null : Area.fromJson(json["city"]),
      area: json["area"] == null ? null : Area.fromJson(json["area"]),
      address:
          json["address"] == null ? null : Address.fromJson(json["address"]),
      location: json["location"] == null
          ? null
          : LocationData.fromJson(json["location"]),
      createdAt: json["created_at"] == null
          ? null
          : DateTime.tryParse(json["created_at"])?.toLocal(),
      updatedAt: json["updated_at"] == null
          ? null
          : DateTime.tryParse(json["updated_at"])?.toLocal(),
      workingDays: json["working_days"] == null
          ? []
          : List<WorkingDay>.from(
              json["working_days"]!.map((x) => WorkingDay.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "active": active,
        "img": img,
        "region_id": regionId,
        "country_id": countryId,
        "city_id": cityId,
        "area_id": areaId,
        "price": price,
        "fitting_rooms": fittingRooms,
        "translation": translation?.toJson(),
        "region": region?.toJson(),
        "country": country?.toJson(),
        "city": city?.toJson(),
        "area": area?.toJson(),
        "address": address?.toJson(),
        "location": location?.toJson(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "working_days": workingDays == null
            ? []
            : List<dynamic>.from(workingDays!.map((x) => x.toJson())),
      };
}

class Region {
  int? id;
  bool? active;
  Translation? translation;

  Region({
    this.id,
    this.active,
    this.translation,
  });

  Region copyWith({
    int? id,
    bool? active,
    Translation? translation,
  }) =>
      Region(
        id: id ?? this.id,
        active: active ?? this.active,
        translation: translation ?? this.translation,
      );

  factory Region.fromJson(Map<String, dynamic> json) => Region(
        id: json["id"],
        active: json["active"],
        translation: json["translation"] == null
            ? null
            : Translation.fromJson(json["translation"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "active": active,
        "translation": translation?.toJson(),
      };
}

class Area {
  int? id;
  bool? active;
  int? regionId;
  int? countryId;
  int? cityId;
  Translation? translation;
  String? img;

  Area({
    this.id,
    this.active,
    this.regionId,
    this.countryId,
    this.cityId,
    this.translation,
    this.img,
  });

  Area copyWith({
    int? id,
    bool? active,
    int? regionId,
    int? countryId,
    int? cityId,
    Translation? translation,
    String? img,
  }) =>
      Area(
        id: id ?? this.id,
        active: active ?? this.active,
        regionId: regionId ?? this.regionId,
        countryId: countryId ?? this.countryId,
        cityId: cityId ?? this.cityId,
        translation: translation ?? this.translation,
        img: img ?? this.img,
      );

  factory Area.fromJson(Map<String, dynamic> json) => Area(
        id: json["id"],
        active: json["active"],
        regionId: json["region_id"],
        countryId: json["country_id"],
        cityId: json["city_id"],
        translation: json["translation"] == null
            ? null
            : Translation.fromJson(json["translation"]),
        img: json["img"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "active": active,
        "region_id": regionId,
        "country_id": countryId,
        "city_id": cityId,
        "translation": translation?.toJson(),
        "img": img,
      };
}

