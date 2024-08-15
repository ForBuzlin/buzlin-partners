import '../data/disable_times.dart';
import 'response.dart';

class DisableTimesResponse {
  List<DisableTimes>? data;
  Links? links;
  Meta? meta;

  DisableTimesResponse({
    this.data,
    this.links,
    this.meta,
  });

  DisableTimesResponse copyWith({
    List<DisableTimes>? data,
    Links? links,
    Meta? meta,
  }) =>
      DisableTimesResponse(
        data: data ?? this.data,
        links: links ?? this.links,
        meta: meta ?? this.meta,
      );

  factory DisableTimesResponse.fromJson(Map<String, dynamic> json) => DisableTimesResponse(
    data: json["data"] == null ? [] : List<DisableTimes>.from(json["data"]!.map((x) => DisableTimes.fromJson(x))),
    links: json["links"] == null ? null : Links.fromJson(json["links"]),
    meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "links": links?.toJson(),
    "meta": meta?.toJson(),
  };
}


