import '../data/forms_data.dart';
import 'response.dart';

class FormPaginateResponse {
  List<FormsData>? data;
  Links? links;
  Meta? meta;

  FormPaginateResponse({
    this.data,
    this.links,
    this.meta,
  });

  FormPaginateResponse copyWith({
    List<FormsData>? data,
    Links? links,
    Meta? meta,
  }) =>
      FormPaginateResponse(
        data: data ?? this.data,
        links: links ?? this.links,
        meta: meta ?? this.meta,
      );

  factory FormPaginateResponse.fromJson(Map<String, dynamic> json) => FormPaginateResponse(
    data: json["data"] == null ? [] : List<FormsData>.from(json["data"]!.map((x) => FormsData.fromJson(x))),
    links: json["links"] == null ? null : Links.fromJson(json["links"]),
    meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "links": links?.toJson(),
    "meta": meta?.toJson(),
  };
}




