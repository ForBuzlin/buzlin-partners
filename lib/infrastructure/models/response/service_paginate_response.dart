import '../data/service_data.dart';
import 'response.dart';

class ServicePaginateResponse {
  List<ServiceData>? data;
  Links? links;
  Meta? meta;

  ServicePaginateResponse({
    this.data,
    this.links,
    this.meta,
  });

  ServicePaginateResponse copyWith({
    List<ServiceData>? data,
    Links? links,
    Meta? meta,
  }) =>
      ServicePaginateResponse(
        data: data ?? this.data,
        links: links ?? this.links,
        meta: meta ?? this.meta,
      );

  factory ServicePaginateResponse.fromJson(Map<String, dynamic> json) =>
      ServicePaginateResponse(
        data: json["data"] == null
            ? []
            : List<ServiceData>.from(
                json["data"]!.map((x) => ServiceData.fromJson(x))),
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
