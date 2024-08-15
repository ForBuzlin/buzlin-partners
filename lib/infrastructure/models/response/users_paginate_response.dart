import 'package:venderuzmart/infrastructure/models/data/user_data.dart';

import 'response.dart';

class UsersPaginateResponse {
  List<UserData>? data;
  Links? links;
  Meta? meta;

  UsersPaginateResponse({
    this.data,
    this.links,
    this.meta,
  });

  UsersPaginateResponse copyWith({
    List<UserData>? data,
    Links? links,
    Meta? meta,
  }) =>
      UsersPaginateResponse(
        data: data ?? this.data,
        links: links ?? this.links,
        meta: meta ?? this.meta,
      );

  factory UsersPaginateResponse.fromJson(Map<String, dynamic> json) =>
      UsersPaginateResponse(
        data: json["data"] == null
            ? []
            : List<UserData>.from(
            json["data"]!.map((x) => UserData.fromJson(x))),
        links: json["links"] == null ? null : Links.fromJson(json["links"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() =>
      {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "links": links?.toJson(),
        "meta": meta?.toJson(),
      };
}