import '../data/ads_data.dart';
import 'response.dart';

class AdsResponse {
  List<AdsData>? data;
  Links? links;
  Meta? meta;

  AdsResponse({
    this.data,
    this.links,
    this.meta,
  });

  AdsResponse copyWith({
    List<AdsData>? data,
    Links? links,
    Meta? meta,
  }) =>
      AdsResponse(
        data: data ?? this.data,
        links: links ?? this.links,
        meta: meta ?? this.meta,
      );

  factory AdsResponse.fromJson(Map<String, dynamic> json) => AdsResponse(
        data: json["data"] == null
            ? []
            : List<AdsData>.from(json["data"]!.map((x) => AdsData.fromJson(x))),
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
