import 'package:venderuzmart/infrastructure/models/data/form_options_data.dart';

import 'response.dart';

class FormOptionsResponse {
  List<FormOptionsData>? data;
  Links? links;
  Meta? meta;

  FormOptionsResponse({
    this.data,
    this.links,
    this.meta,
  });

  FormOptionsResponse copyWith({
    List<FormOptionsData>? data,
    Links? links,
    Meta? meta,
  }) =>
      FormOptionsResponse(
        data: data ?? this.data,
        links: links ?? this.links,
        meta: meta ?? this.meta,
      );

  factory FormOptionsResponse.fromJson(Map<String, dynamic> json) =>
      FormOptionsResponse(
        data: json["data"] == null
            ? []
            : List<FormOptionsData>.from(
                json["data"]!.map((x) => FormOptionsData.fromJson(x))),
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
