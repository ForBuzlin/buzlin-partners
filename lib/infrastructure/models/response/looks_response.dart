import '../data/looks_data.dart';
import 'response.dart';

class LooksResponse {
  List<LooksData>? data;
  Links? links;
  Meta? meta;

  LooksResponse({
    this.data,
    this.links,
    this.meta,
  });

  LooksResponse copyWith({
    List<LooksData>? data,
    Links? links,
    Meta? meta,
  }) =>
      LooksResponse(
        data: data ?? this.data,
        links: links ?? this.links,
        meta: meta ?? this.meta,
      );

  factory LooksResponse.fromJson(Map<String, dynamic> json) => LooksResponse(
        data: json["data"] == null
            ? []
            : List<LooksData>.from(
                json["data"]!.map((x) => LooksData.fromJson(x))),
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
