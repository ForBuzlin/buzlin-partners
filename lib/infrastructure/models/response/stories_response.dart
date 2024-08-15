import '../data/stories_data.dart';
import 'response.dart';

class StoriesResponse {
  List<StoriesData>? data;
  Links? links;
  Meta? meta;

  StoriesResponse({
    this.data,
    this.links,
    this.meta,
  });

  StoriesResponse copyWith({
    List<StoriesData>? data,
    Links? links,
    Meta? meta,
  }) =>
      StoriesResponse(
        data: data ?? this.data,
        links: links ?? this.links,
        meta: meta ?? this.meta,
      );

  factory StoriesResponse.fromJson(Map<String, dynamic> json) =>
      StoriesResponse(
        data: json["data"] == null
            ? []
            : List<StoriesData>.from(
                json["data"]!.map((x) => StoriesData.fromJson(x))),
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
