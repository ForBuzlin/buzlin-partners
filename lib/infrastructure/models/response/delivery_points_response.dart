import '../data/delivery_points_data.dart';
import 'response.dart';

class DeliveryPointsResponse {
  List<DeliveryPointsData>? data;
  Links? links;
  Meta? meta;

  DeliveryPointsResponse({
    this.data,
    this.links,
    this.meta,
  });

  DeliveryPointsResponse copyWith({
    List<DeliveryPointsData>? data,
    Links? links,
    Meta? meta,
  }) =>
      DeliveryPointsResponse(
        data: data ?? this.data,
        links: links ?? this.links,
        meta: meta ?? this.meta,
      );

  factory DeliveryPointsResponse.fromJson(Map<String, dynamic> json) =>
      DeliveryPointsResponse(
        data: json["data"] == null
            ? []
            : List<DeliveryPointsData>.from(
                json["data"]!.map((x) => DeliveryPointsData.fromJson(x))),
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
