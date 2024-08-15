import '../data/ads_package.dart';
import 'response.dart';

class AdsPackageResponse {
  List<AdsPackage>? data;
  Links? links;
  Meta? meta;

  AdsPackageResponse({
    this.data,
    this.links,
    this.meta,
  });

  AdsPackageResponse copyWith({
    List<AdsPackage>? data,
    Links? links,
    Meta? meta,
  }) =>
      AdsPackageResponse(
        data: data ?? this.data,
        links: links ?? this.links,
        meta: meta ?? this.meta,
      );

  factory AdsPackageResponse.fromJson(Map<String, dynamic> json) =>
      AdsPackageResponse(
        data: json["data"] == null
            ? []
            : List<AdsPackage>.from(
                json["data"]!.map((x) => AdsPackage.fromJson(x))),
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
