
import '../data/membership_data.dart';
import 'response.dart';

class MembershipResponse {
  List<MembershipData>? data;
  Links? links;
  Meta? meta;

  MembershipResponse({
    this.data,
    this.links,
    this.meta,
  });

  MembershipResponse copyWith({
    List<MembershipData>? data,
    Links? links,
    Meta? meta,
  }) =>
      MembershipResponse(
        data: data ?? this.data,
        links: links ?? this.links,
        meta: meta ?? this.meta,
      );

  factory MembershipResponse.fromJson(Map<String, dynamic> json) => MembershipResponse(
    data: json["data"] == null ? [] : List<MembershipData>.from(json["data"]!.map((x) => MembershipData.fromJson(x))),
    links: json["links"] == null ? null : Links.fromJson(json["links"]),
    meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "links": links?.toJson(),
    "meta": meta?.toJson(),
  };
}

