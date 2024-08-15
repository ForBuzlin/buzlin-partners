import '../response/single_category_response.dart';
import 'translation.dart';

class CategoryData {
  int? id;
  String? uuid;
  String? keywords;
  int? parentId;
  String? type;
  String? img;
  int? shopId;
  int? input;
  bool? active;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? productsCount;
  int? stocksCount;
  dynamic shop;
  Translation? translation;
  List<Translation>? translations;
  List<String>? locales;
  List<CategoryData>? children;
  Parent? parent;

  CategoryData({
    this.id,
    this.uuid,
    this.keywords,
    this.parentId,
    this.type,
    this.img,
    this.input,
    this.active,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.productsCount,
    this.stocksCount,
    this.shop,
    this.shopId,
    this.translation,
    this.translations,
    this.locales,
    this.children,
    this.parent,
  });

  CategoryData copyWith({
    int? id,
    String? uuid,
    String? keywords,
    int? parentId,
    String? type,
    int? shopId,
    int? input,
    String? img,
    bool? active,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? productsCount,
    int? stocksCount,
    dynamic shop,
    Translation? translation,
    List<Translation>? translations,
    List<String>? locales,
    List<CategoryData>? children,
    Parent? parent,
  }) =>
      CategoryData(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        input: input ?? this.input,
        keywords: keywords ?? this.keywords,
        parentId: parentId ?? this.parentId,
        type: type ?? this.type,
        img: img ?? this.img,
        active: active ?? this.active,
        shopId: shopId ?? this.shopId,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        productsCount: productsCount ?? this.productsCount,
        stocksCount: stocksCount ?? this.stocksCount,
        shop: shop ?? this.shop,
        translation: translation ?? this.translation,
        translations: translations ?? this.translations,
        locales: locales ?? this.locales,
        children: children ?? this.children,
        parent: parent ?? this.parent,
      );

  factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
        id: json["id"],
        uuid: json["uuid"],
        input: json["input"],
        keywords: json["keywords"],
        parentId: json["parent_id"],
        type: json["type"],
        img: json["img"],
        shopId: json["shop_id"],
        active: json["active"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.tryParse(json["created_at"])?.toLocal(),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.tryParse(json["updated_at"])?.toLocal(),
        productsCount: json["products_count"],
        stocksCount: json["stocks_count"],
        shop: json["shop"],
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
        children: json["children"] == null
            ? []
            : List<CategoryData>.from(
                json["children"]!.map((x) => CategoryData.fromJson(x))),
        parent: json["parent"] == null ? null : Parent.fromJson(json["parent"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "input": input,
        "keywords": keywords,
        "parent_id": parentId,
        "type": type,
        "img": img,
        "shop_id": shopId,
        "active": active,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "products_count": productsCount,
        "stocks_count": stocksCount,
        "shop": shop,
        "translation": translation?.toJson(),
        "translations": translations == null
            ? []
            : List<dynamic>.from(translations!.map((x) => x.toJson())),
        "locales":
            locales == null ? [] : List<dynamic>.from(locales!.map((x) => x)),
        "children": children == null
            ? []
            : List<dynamic>.from(children!.map((x) => x.toJson())),
        "parent": parent?.toJson(),
      };
}
