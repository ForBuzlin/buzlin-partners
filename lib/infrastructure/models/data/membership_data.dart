import 'package:flutter/material.dart';
import 'package:venderuzmart/infrastructure/services/extensions.dart';

import 'galleries.dart';
import 'service_data.dart';
import 'shop_data.dart';
import 'translation.dart';

class MembershipData {
  int? id;
  int? shopId;
  Color? color;
  int? price;
  String? time;
  int? sessions;
  int? sessionsCount;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<ServiceData>? services;
  Translation? translation;
  List<Translation>? translations;
  List<Galleries>? galleries;
  ShopData? shop;

  MembershipData({
    this.id,
    this.shopId,
    this.color,
    this.price,
    this.time,
    this.sessions,
    this.sessionsCount,
    this.createdAt,
    this.updatedAt,
    this.services,
    this.translation,
    this.translations,
    this.galleries,
    this.shop,
  });

  MembershipData copyWith({
    int? id,
    int? shopId,
    Color? color,
    int? price,
    String? time,
    int? sessions,
    int? sessionsCount,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<ServiceData>? services,
    Translation? translation,
    List<Translation>? translations,
    List<Galleries>? galleries,
    ShopData? shop,
  }) =>
      MembershipData(
        id: id ?? this.id,
        shopId: shopId ?? this.shopId,
        color: color ?? this.color,
        price: price ?? this.price,
        time: time ?? this.time,
        sessions: sessions ?? this.sessions,
        sessionsCount: sessionsCount ?? this.sessionsCount,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        services: services ?? this.services,
        translation: translation ?? this.translation,
        translations: translations ?? this.translations,
        galleries: galleries ?? this.galleries,
        shop: shop ?? this.shop,
      );

  factory MembershipData.fromJson(Map<String, dynamic> json) => MembershipData(
        id: json["id"],
        shopId: json["shop_id"],
        color: json["color"]?.toString().toColor(),
        price: json["price"],
        time: json["time"],
        sessions: json["sessions"],
        sessionsCount: json["sessions_count"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        services: json["services"] == null
            ? []
            : List<ServiceData>.from(json["services"]!
                .map((x) => ServiceData.fromJson(x["service"]))),
        translation: json["translation"] == null
            ? null
            : Translation.fromJson(json["translation"]),
        translations: json["translations"] == null
            ? []
            : List<Translation>.from(
                json["translations"]!.map((x) => Translation.fromJson(x))),
        galleries: json["galleries"] == null
            ? []
            : List<Galleries>.from(
                json["galleries"]!.map((x) => Galleries.fromJson(x))),
        shop: json["shop"] == null ? null : ShopData.fromJson(json["shop"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "shop_id": shopId,
        "color": color?.toHex(),
        "price": price,
        "time": time,
        "sessions": sessions,
        "sessions_count": sessionsCount,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "services": services == null
            ? []
            : List<dynamic>.from(services!.map((x) => x.toJson())),
        "translation": translation?.toJson(),
        "translations": translations == null
            ? []
            : List<dynamic>.from(translations!.map((x) => x.toJson())),
        "galleries": galleries == null
            ? []
            : List<dynamic>.from(galleries!.map((x) => x)),
        "shop": shop?.toJson(),
      };
}
