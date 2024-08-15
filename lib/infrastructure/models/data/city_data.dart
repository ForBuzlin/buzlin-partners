import 'translation.dart';

class CityData {
  int? id;
  bool? active;
  int? regionId;
  int? countryId;
  Translation? translation;

  CityData({
    this.id,
    this.active,
    this.regionId,
    this.countryId,
    this.translation,
  });

  CityData copyWith({
    int? id,
    bool? active,
    int? regionId,
    int? countryId,
    Translation? translation,
  }) =>
      CityData(
        id: id ?? this.id,
        active: active ?? this.active,
        regionId: regionId ?? this.regionId,
        countryId: countryId ?? this.countryId,
        translation: translation ?? this.translation,
      );

  factory CityData.fromJson(Map<String, dynamic> json) => CityData(
        id: json["id"],
        active: json["active"],
        regionId: json["region_id"],
        countryId: json["country_id"],
        translation: json["translation"] == null
            ? null
            : Translation.fromJson(json["translation"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "active": active,
        "region_id": regionId,
        "country_id": countryId,
        "translation": translation?.toJson(),
      };
}
