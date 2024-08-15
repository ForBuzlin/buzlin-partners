import 'translation.dart';

class ShopCategoryData {
  int? id;
  String? uuid;
  String? keywords;
  String? type;
  dynamic img;
  bool? active;
  Translation? translation;

  ShopCategoryData({
    this.id,
    this.uuid,
    this.keywords,
    this.type,
    this.img,
    this.active,
    this.translation,
  });

  ShopCategoryData copyWith({
    int? id,
    String? uuid,
    String? keywords,
    String? type,
    dynamic img,
    bool? active,
    Translation? translation,
  }) =>
      ShopCategoryData(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        keywords: keywords ?? this.keywords,
        type: type ?? this.type,
        img: img ?? this.img,
        active: active ?? this.active,
        translation: translation ?? this.translation,
      );

  factory ShopCategoryData.fromJson(Map<String, dynamic> json) =>
      ShopCategoryData(
        id: json["id"],
        uuid: json["uuid"],
        keywords: json["keywords"],
        type: json["type"],
        img: json["img"],
        active: json["active"],
        translation: json["translation"] == null
            ? null
            : Translation.fromJson(json["translation"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "keywords": keywords,
        "type": type,
        "img": img,
        "active": active,
        "translation": translation?.toJson(),
      };
}
