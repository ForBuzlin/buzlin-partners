import '../data/user_membership_data.dart';
import 'response.dart';

class UserMembershipsResponse {
  List<UserMembershipData>? data;
  Links? links;
  Meta? meta;

  UserMembershipsResponse({
    this.data,
    this.links,
    this.meta,
  });

  UserMembershipsResponse copyWith({
    List<UserMembershipData>? data,
    Links? links,
    Meta? meta,
  }) =>
      UserMembershipsResponse(
        data: data ?? this.data,
        links: links ?? this.links,
        meta: meta ?? this.meta,
      );

  factory UserMembershipsResponse.fromJson(Map<String, dynamic> json) =>
      UserMembershipsResponse(
        data: json["data"] == null
            ? []
            : List<UserMembershipData>.from(
                json["data"]!.map((x) => UserMembershipData.fromJson(x))),
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
