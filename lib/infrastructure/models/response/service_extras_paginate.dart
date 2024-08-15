import '../data/service_extra_data.dart';
import 'response.dart';

class ServiceExtrasPaginateResponse {
  List<ServiceExtrasData>? data;
  Links? links;
  Meta? meta;

  ServiceExtrasPaginateResponse({
    this.data,
    this.links,
    this.meta,
  });

  ServiceExtrasPaginateResponse copyWith({
    List<ServiceExtrasData>? data,
    Links? links,
    Meta? meta,
  }) =>
      ServiceExtrasPaginateResponse(
        data: data ?? this.data,
        links: links ?? this.links,
        meta: meta ?? this.meta,
      );

  factory ServiceExtrasPaginateResponse.fromJson(Map<String, dynamic> json) => ServiceExtrasPaginateResponse(
    data: json["data"] == null ? [] : List<ServiceExtrasData>.from(json["data"]!.map((x) => ServiceExtrasData.fromJson(x))),
    links: json["links"] == null ? null : Links.fromJson(json["links"]),
    meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "links": links?.toJson(),
    "meta": meta?.toJson(),
  };
}

