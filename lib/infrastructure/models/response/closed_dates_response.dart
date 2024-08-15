import '../data/closed_dates.dart';
import 'response.dart';

class ClosedDatesResponse {
  List<ClosedDates>? data;
  Links? links;
  Meta? meta;

  ClosedDatesResponse({
    this.data,
    this.links,
    this.meta,
  });

  ClosedDatesResponse copyWith({
    List<ClosedDates>? data,
    Links? links,
    Meta? meta,
  }) =>
      ClosedDatesResponse(
        data: data ?? this.data,
        links: links ?? this.links,
        meta: meta ?? this.meta,
      );

  factory ClosedDatesResponse.fromJson(Map<String, dynamic> json) => ClosedDatesResponse(
    data: json["data"] == null ? [] : List<ClosedDates>.from(json["data"]!.map((x) => ClosedDates.fromJson(x))),
    links: json["links"] == null ? null : Links.fromJson(json["links"]),
    meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "links": links?.toJson(),
    "meta": meta?.toJson(),
  };
}


