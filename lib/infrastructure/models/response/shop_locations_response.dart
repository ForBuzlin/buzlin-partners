import 'package:venderuzmart/infrastructure/models/data/shop_location_data.dart';

import 'response.dart';

class ShopLocationsResponse {
  List<ShopLocationData>? data;
  Links? links;
  Meta? meta;

  ShopLocationsResponse({
    this.data,
    this.links,
    this.meta,
  });

  ShopLocationsResponse copyWith({
    List<ShopLocationData>? data,
    Links? links,
    Meta? meta,
  }) =>
      ShopLocationsResponse(
        data: data ?? this.data,
        links: links ?? this.links,
        meta: meta ?? this.meta,
      );

  factory ShopLocationsResponse.fromJson(Map<String, dynamic> json) => ShopLocationsResponse(
    data: json["data"] == null ? [] : List<ShopLocationData>.from(json["data"]!.map((x) => ShopLocationData.fromJson(x))),
    links: json["links"] == null ? null : Links.fromJson(json["links"]),
    meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "links": links?.toJson(),
    "meta": meta?.toJson(),
  };
}



