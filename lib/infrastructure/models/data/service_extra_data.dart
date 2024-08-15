import 'service_data.dart';
import 'shop_data.dart';
import 'translation.dart';

class ServiceExtrasData {
  int? id;
  int? serviceId;
  bool? active;
  num? price;
  String? img;
  DateTime? createdAt;
  DateTime? updatedAt;
  ServiceData? service;
  ShopData? shop;
  Translation? translation;
  List<Translation>? translations;
  List<String>? locales;
  int? shopId;

  ServiceExtrasData({
    this.id,
    this.serviceId,
    this.active,
    this.price,
    this.img,
    this.createdAt,
    this.updatedAt,
    this.service,
    this.shop,
    this.translation,
    this.translations,
    this.locales,
    this.shopId,
  });

  ServiceExtrasData copyWith({
    int? id,
    int? serviceId,
    bool? active,
    num? price,
    String? img,
    DateTime? createdAt,
    DateTime? updatedAt,
    ServiceData? service,
    ShopData? shop,
    Translation? translation,
    List<Translation>? translations,
    List<String>? locales,
    int? shopId,
  }) =>
      ServiceExtrasData(
        id: id ?? this.id,
        serviceId: serviceId ?? this.serviceId,
        active: active ?? this.active,
        price: price ?? this.price,
        img: img ?? this.img,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        service: service ?? this.service,
        shop: shop ?? this.shop,
        translation: translation ?? this.translation,
        translations: translations ?? this.translations,
        locales: locales ?? this.locales,
        shopId: shopId ?? this.shopId,
      );

  factory ServiceExtrasData.fromJson(Map<String, dynamic> json) => ServiceExtrasData(
    id: json["id"],
    serviceId: json["service_id"],
    active: json["active"],
    price: json["price"],
    img: json["img"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    service: json["service"] == null ? null : ServiceData.fromJson(json["service"]),
    shop: json["shop"] == null ? null : ShopData.fromJson(json["shop"]),
    translation: json["translation"] == null ? null : Translation.fromJson(json["translation"]),
    translations: json["translations"] == null ? [] : List<Translation>.from(json["translations"]!.map((x) => Translation.fromJson(x))),
    locales: json["locales"] == null ? [] : List<String>.from(json["locales"]!.map((x) => x)),
    shopId: json["shop_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "service_id": serviceId,
    "active": active,
    "price": price,
    "img": img,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "service": service?.toJson(),
    "shop": shop?.toJson(),
    "translation": translation?.toJson(),
    "translations": translations == null ? [] : List<dynamic>.from(translations!.map((x) => x.toJson())),
    "locales": locales == null ? [] : List<dynamic>.from(locales!.map((x) => x)),
    "shop_id": shopId,
  };
}
