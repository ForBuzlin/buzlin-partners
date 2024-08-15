import 'shop_data.dart';

class Brand {
  int? id;
  bool? active;
  String? slug;
  String? uuid;
  String? title;
  int? shopId;
  DateTime? createdAt;
  DateTime? updatedAt;
  ShopData? shop;
  String? img;
  int? productsCount;

  Brand({
    this.id,
    this.active,
    this.slug,
    this.uuid,
    this.title,
    this.shopId,
    this.createdAt,
    this.updatedAt,
    this.shop,
    this.img,
    this.productsCount,
  });

  Brand copyWith({
    int? id,
    bool? active,
    String? slug,
    String? uuid,
    String? title,
    int? shopId,
    DateTime? createdAt,
    DateTime? updatedAt,
    ShopData? shop,
    String? img,
    int? productsCount,
  }) =>
      Brand(
        id: id ?? this.id,
        active: active ?? this.active,
        slug: slug ?? this.slug,
        uuid: uuid ?? this.uuid,
        title: title ?? this.title,
        shopId: shopId ?? this.shopId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        shop: shop ?? this.shop,
        img: img ?? this.img,
        productsCount: productsCount ?? this.productsCount,
      );

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"],
        active: json["active"],
        slug: json["slug"],
        uuid: json["uuid"],
        title: json["title"],
        shopId: json["shop_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.tryParse(json["created_at"])?.toLocal(),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.tryParse(json["updated_at"])?.toLocal(),
        shop: json["shop"] == null ? null : ShopData.fromJson(json["shop"]),
        img: json["img"],
        productsCount: json["products_count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "active": active,
        "slug": slug,
        "uuid": uuid,
        "title": title,
        "shop_id": shopId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "shop": shop?.toJson(),
        "img": img,
        "products_count": productsCount,
      };
}
