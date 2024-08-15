import 'country_data.dart';
import 'translation.dart';

class ShopLocationData {
  int? id;
  int? shopId;
  int? regionId;
  int? countryId;
  DateTime? createdAt;
  DateTime? updatedAt;
  ShopRegion? region;
  CountryData? country;
  City? city;
  dynamic area;
  int? cityId;

  ShopLocationData({
    this.id,
    this.shopId,
    this.regionId,
    this.countryId,
    this.createdAt,
    this.updatedAt,
    this.region,
    this.country,
    this.city,
    this.area,
    this.cityId,
  });

  ShopLocationData copyWith({
    int? id,
    int? shopId,
    int? regionId,
    int? countryId,
    DateTime? createdAt,
    DateTime? updatedAt,
    ShopRegion? region,
    CountryData? country,
    City? city,
    dynamic area,
    int? cityId,
  }) =>
      ShopLocationData(
        id: id ?? this.id,
        shopId: shopId ?? this.shopId,
        regionId: regionId ?? this.regionId,
        countryId: countryId ?? this.countryId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        region: region ?? this.region,
        country: country ?? this.country,
        city: city ?? this.city,
        area: area ?? this.area,
        cityId: cityId ?? this.cityId,
      );

  factory ShopLocationData.fromJson(Map<String, dynamic> json) => ShopLocationData(
    id: json["id"],
    shopId: json["shop_id"],
    regionId: json["region_id"],
    countryId: json["country_id"],
    createdAt: json["created_at"] == null
        ? null
        : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null
        ? null
        : DateTime.parse(json["updated_at"]),
    region:
    json["region"] == null ? null : ShopRegion.fromJson(json["region"]),
    country: json["country"] == null
        ? null
        : CountryData.fromJson(json["country"]),
    city: json["city"] == null ? null : City.fromJson(json["city"]),
    area: json["area"],
    cityId: json["city_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "shop_id": shopId,
    "region_id": regionId,
    "country_id": countryId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "region": region?.toJson(),
    "country": country?.toJson(),
    "city": city?.toJson(),
    "area": area,
    "city_id": cityId,
  };
}

class City {
  int? id;
  bool? active;
  int? regionId;
  int? countryId;
  Translation? translation;
  String? img;

  City({
    this.id,
    this.active,
    this.regionId,
    this.countryId,
    this.translation,
    this.img,
  });

  City copyWith({
    int? id,
    bool? active,
    int? regionId,
    int? countryId,
    Translation? translation,
    String? img,
  }) =>
      City(
        id: id ?? this.id,
        active: active ?? this.active,
        regionId: regionId ?? this.regionId,
        countryId: countryId ?? this.countryId,
        translation: translation ?? this.translation,
        img: img ?? this.img,
      );

  factory City.fromJson(Map<String, dynamic> json) => City(
    id: json["id"],
    active: json["active"],
    regionId: json["region_id"],
    countryId: json["country_id"],
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
    "translation": translation?.toJson(),
    "img": img,
  };
}

class ShopRegion {
  int? id;
  bool? active;
  Translation? translation;

  ShopRegion({
    this.id,
    this.active,
    this.translation,
  });

  ShopRegion copyWith({
    int? id,
    bool? active,
    Translation? translation,
  }) =>
      ShopRegion(
        id: id ?? this.id,
        active: active ?? this.active,
        translation: translation ?? this.translation,
      );

  factory ShopRegion.fromJson(Map<String, dynamic> json) => ShopRegion(
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