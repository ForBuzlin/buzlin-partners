import '../data/order_data.dart';
import 'response.dart';

class OrdersPaginateResponse {
  List<OrderData>? data;
  Links? links;
  Meta? meta;

  OrdersPaginateResponse({
    this.data,
    this.links,
    this.meta,
  });

  OrdersPaginateResponse copyWith({
    List<OrderData>? data,
    Links? links,
    Meta? meta,
  }) =>
      OrdersPaginateResponse(
        data: data ?? this.data,
        links: links ?? this.links,
        meta: meta ?? this.meta,
      );

  factory OrdersPaginateResponse.fromJson(Map<String, dynamic> json) =>
      OrdersPaginateResponse(
        data: json["data"] == null
            ? []
            : List<OrderData>.from(
                json["data"]!.map((x) => OrderData.fromJson(x))),
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
