import 'package:venderuzmart/infrastructure/services/services.dart';

import 'galleries.dart';
import 'product_data.dart';
import 'translation.dart';

class LooksData {
  int? id;
  dynamic url;
  String? img;
  bool? active;
  bool? clickable;
  String? type;
  dynamic input;
  int? shopId;
  DateTime? createdAt;
  DateTime? updatedAt;
  Translation? translation;
  List<Translation>? translations;
  List<String>? locales;
  List<Galleries>? galleries;
  List<ProductData>? products;

  LooksData({
    this.id,
    this.url,
    this.img,
    this.active,
    this.clickable,
    this.type,
    this.input,
    this.shopId,
    this.createdAt,
    this.updatedAt,
    this.translation,
    this.translations,
    this.locales,
    this.galleries,
    this.products,
  });

  LooksData copyWith({
    int? id,
    dynamic url,
    String? img,
    bool? active,
    bool? clickable,
    String? type,
    dynamic input,
    int? shopId,
    DateTime? createdAt,
    DateTime? updatedAt,
    Translation? translation,
    List<Translation>? translations,
    List<String>? locales,
    List<Galleries>? galleries,
    List<ProductData>? products,
  }) =>
      LooksData(
        id: id ?? this.id,
        url: url ?? this.url,
        img: img ?? this.img,
        active: active ?? this.active,
        clickable: clickable ?? this.clickable,
        type: type ?? this.type,
        input: input ?? this.input,
        shopId: shopId ?? this.shopId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        translation: translation ?? this.translation,
        translations: translations ?? this.translations,
        locales: locales ?? this.locales,
        galleries: galleries ?? this.galleries,
        products: products ?? this.products,
      );

  factory LooksData.fromJson(Map<String, dynamic> json) {
    return LooksData(
      id: json["id"],
      url: json["url"],
      img: json["img"],
      active: json["active"].toString().toBool(),
      clickable: json["clickable"].toString().toBool(),
      type: json["type"],
      input: json["input"],
      shopId: json["shop_id"],
      createdAt: json["created_at"] == null
          ? null
          : DateTime.tryParse(json["created_at"])?.toLocal(),
      updatedAt: json["updated_at"] == null
          ? null
          : DateTime.tryParse(json["updated_at"])?.toLocal(),
      translation: json["translation"] == null
          ? null
          : Translation.fromJson(json["translation"]),
      translations: json["translations"] == null
          ? []
          : List<Translation>.from(
              json["translations"]!.map((x) => Translation.fromJson(x))),
      locales: json["locales"] == null
          ? []
          : List<String>.from(json["locales"]!.map((x) => x)),
      galleries: json["galleries"] == null
          ? []
          : List<Galleries>.from(
              json["galleries"]!.map((x) => Galleries.fromJson(x))),
      products: json["products"] == null
          ? []
          : List<ProductData>.from(
              json["products"]!.map((x) => ProductData.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "img": img,
        "active": active,
        "clickable": clickable,
        "type": type,
        "input": input,
        "shop_id": shopId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "translation": translation?.toJson(),
        "translations": translations == null
            ? []
            : List<dynamic>.from(translations!.map((x) => x.toJson())),
        "locales":
            locales == null ? [] : List<dynamic>.from(locales!.map((x) => x)),
        "galleries": galleries == null
            ? []
            : List<dynamic>.from(galleries!.map((x) => x.toJson())),
        "products": products == null
            ? []
            : List<dynamic>.from(products!.map((x) => x.toJson())),
      };
}
