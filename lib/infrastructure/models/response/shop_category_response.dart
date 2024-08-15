import '../data/shop_category_data.dart';
import 'response.dart';

class ShopCategoryResponse {
  List<ShopCategoryData>? data;
  Links? links;
  Meta? meta;

  ShopCategoryResponse({
    this.data,
    this.links,
    this.meta,
  });

  ShopCategoryResponse copyWith({
    List<ShopCategoryData>? data,
    Links? links,
    Meta? meta,
  }) =>
      ShopCategoryResponse(
        data: data ?? this.data,
        links: links ?? this.links,
        meta: meta ?? this.meta,
      );

  factory ShopCategoryResponse.fromJson(Map<String, dynamic> json) =>
      ShopCategoryResponse(
        data: json["data"] == null
            ? []
            : List<ShopCategoryData>.from(
                json["data"]!.map((x) => ShopCategoryData.fromJson(x))),
        links: json["links"] == null ? null : Links.fromJson(json["links"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "links": links?.toJson(),
        "meta": meta?.toJson(),
      };
}
