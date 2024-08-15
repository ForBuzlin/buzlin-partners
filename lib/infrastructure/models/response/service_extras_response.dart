import '../data/service_extra_data.dart';
import 'response.dart';

class ServiceExtrasResponse {
  ServiceExtrasData? data;
  Links? links;
  Meta? meta;

  ServiceExtrasResponse({
    this.data,
    this.links,
    this.meta,
  });

  ServiceExtrasResponse copyWith({
    ServiceExtrasData? data,
    Links? links,
    Meta? meta,
  }) =>
      ServiceExtrasResponse(
        data: data ?? this.data,
        links: links ?? this.links,
        meta: meta ?? this.meta,
      );

  factory ServiceExtrasResponse.fromJson(Map<String, dynamic> json) =>
      ServiceExtrasResponse(
        data: json["data"] == null
            ? null
            : ServiceExtrasData.fromJson(json["data"]),
        links: json["links"] == null ? null : Links.fromJson(json["links"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "links": links?.toJson(),
        "meta": meta?.toJson(),
      };
}
