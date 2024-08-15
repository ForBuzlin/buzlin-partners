// To parse this JSON data, do
//
//     final userGiftCardResponse = userGiftCardResponseFromJson(jsonString);

import 'dart:convert';

import '../data/user_gift_card_data.dart';

UserGiftCardResponse userGiftCardResponseFromJson(String str) => UserGiftCardResponse.fromJson(json.decode(str));

String userGiftCardResponseToJson(UserGiftCardResponse data) => json.encode(data.toJson());

class UserGiftCardResponse {
  List<UserGiftCardData>? data;
  Links links;
  // Meta meta;

  UserGiftCardResponse({
    required this.data,
    required this.links,
    // required this.meta,
  });

  factory UserGiftCardResponse.fromJson(Map<String, dynamic> json) => UserGiftCardResponse(
    data: List<UserGiftCardData>.from(json["data"].map((x) => UserGiftCardData.fromJson(x))),
    links: Links.fromJson(json["links"]),
    // meta: Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    if(data != null)
      "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "links": links.toJson(),
    // "meta": meta.toJson(),
  };
}


class Links {
  String first;
  String last;
  dynamic prev;
  dynamic next;

  Links({
    required this.first,
    required this.last,
    required this.prev,
    required this.next,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    first: json["first"],
    last: json["last"],
    prev: json["prev"],
    next: json["next"],
  );

  Map<String, dynamic> toJson() => {
    "first": first,
    "last": last,
    "prev": prev,
    "next": next,
  };
}

class Meta {
  int currentPage;
  int from;
  int lastPage;
  List<Link> links;
  String path;
  String perPage;
  int to;
  int total;

  Meta({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.links,
    required this.path,
    required this.perPage,
    required this.to,
    required this.total,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    currentPage: json["current_page"],
    from: json["from"],
    lastPage: json["last_page"],
    links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
    path: json["path"],
    perPage: json["per_page"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "from": from,
    "last_page": lastPage,
    "links": List<dynamic>.from(links.map((x) => x.toJson())),
    "path": path,
    "per_page": perPage,
    "to": to,
    "total": total,
  };
}

class Link {
  String? url;
  String label;
  bool active;

  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
    url: json["url"],
    label: json["label"],
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "label": label,
    "active": active,
  };
}
