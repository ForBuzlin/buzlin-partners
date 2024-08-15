
import 'package:venderuzmart/infrastructure/models/data/my_address.dart';

import 'response.dart';

class UserAddressResponse {
  List<MyAddress>? data;
  Links? links;
  Meta? meta;

  UserAddressResponse({
    this.data,
    this.links,
    this.meta,
  });

  UserAddressResponse copyWith({
    List<MyAddress>? data,
    Links? links,
    Meta? meta,
  }) =>
      UserAddressResponse(
        data: data ?? this.data,
        links: links ?? this.links,
        meta: meta ?? this.meta,
      );

  factory UserAddressResponse.fromJson(Map<String, dynamic> json) => UserAddressResponse(
    data: json["data"] == null ? [] : List<MyAddress>.from(json["data"]!.map((x) => MyAddress.fromJson(x))),
    links: json["links"] == null ? null : Links.fromJson(json["links"]),
    meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "links": links?.toJson(),
    "meta": meta?.toJson(),
  };
}
