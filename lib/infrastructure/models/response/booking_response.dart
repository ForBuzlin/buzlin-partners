import '../data/booking_data.dart';
import 'response.dart';

class BookingResponse {
  List<BookingData>? data;
  Links? links;
  Meta? meta;

  BookingResponse({
    this.data,
    this.links,
    this.meta,
  });

  BookingResponse copyWith({
    List<BookingData>? data,
    Links? links,
    Meta? meta,
  }) =>
      BookingResponse(
        data: data ?? this.data,
        links: links ?? this.links,
        meta: meta ?? this.meta,
      );

  factory BookingResponse.fromJson(Map<String, dynamic> json) =>
      BookingResponse(
        data: json["data"] == null
            ? []
            : List<BookingData>.from(
                json["data"]!.map((x) => BookingData.fromJson(x))),
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
