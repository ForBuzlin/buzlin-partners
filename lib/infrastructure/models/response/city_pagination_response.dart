import '../data/city_data.dart';
import 'response.dart';

class CityResponseModel {
  List<CityData>? data;
  Links? links;
  Meta? meta;

  CityResponseModel({
    this.data,
    this.links,
    this.meta,
  });

  CityResponseModel copyWith({
    List<CityData>? data,
    Links? links,
    Meta? meta,
  }) =>
      CityResponseModel(
        data: data ?? this.data,
        links: links ?? this.links,
        meta: meta ?? this.meta,
      );

  factory CityResponseModel.fromJson(Map<String, dynamic> json) =>
      CityResponseModel(
        data: json["data"] == null
            ? []
            : List<CityData>.from(
                json["data"]!.map((x) => CityData.fromJson(x))),
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
