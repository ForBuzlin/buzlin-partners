import 'translation.dart';

class CountryData {
  int? id;
  bool? active;
  String? img;
  int? regionId;
  int? citiesCount;
  Translation? translation;

  CountryData({
    this.id,
    this.active,
    this.img,
    this.regionId,
    this.citiesCount,
    this.translation,
  });

  CountryData copyWith({
    int? id,
    bool? active,
    String? img,
    int? regionId,
    int? citiesCount,
    Translation? translation,
  }) =>
      CountryData(
        id: id ?? this.id,
        active: active ?? this.active,
        img: img ?? this.img,
        regionId: regionId ?? this.regionId,
        citiesCount: citiesCount ?? this.citiesCount,
        translation: translation ?? this.translation,
      );

  factory CountryData.fromJson(Map<String, dynamic> json) => CountryData(
        id: json["id"],
        active: json["active"],
        img: json["img"],
        regionId: json["region_id"],
        citiesCount: json["cities_count"],
        translation: json["translation"] == null
            ? null
            : Translation.fromJson(json["translation"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "active": active,
        "img": img,
        "cities_count": citiesCount,
        "region_id": regionId,
        "translation": translation?.toJson(),
      };
}
