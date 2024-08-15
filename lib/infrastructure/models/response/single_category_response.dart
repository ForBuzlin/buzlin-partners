// To parse this JSON data, do
//
//     final singleCategoryResponse = singleCategoryResponseFromJson(jsonString);

import 'dart:convert';

import '../data/category_data.dart';
import '../data/translation.dart';

SingleCategoryResponse singleCategoryResponseFromJson(String str) =>
    SingleCategoryResponse.fromJson(json.decode(str));

String singleCategoryResponseToJson(SingleCategoryResponse data) =>
    json.encode(data.toJson());

class SingleCategoryResponse {
  DateTime? timestamp;
  bool? status;
  String? message;
  CategoryData? data;

  SingleCategoryResponse({
    this.timestamp,
    this.status,
    this.message,
    this.data,
  });

  SingleCategoryResponse copyWith({
    DateTime? timestamp,
    bool? status,
    String? message,
    CategoryData? data,
  }) =>
      SingleCategoryResponse(
        timestamp: timestamp ?? this.timestamp,
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory SingleCategoryResponse.fromJson(Map<String, dynamic> json) =>
      SingleCategoryResponse(
        timestamp: json["timestamp"] == null
            ? null
            : DateTime.parse(json["timestamp"]),
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : CategoryData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp?.toIso8601String(),
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class Parent {
  int? id;
  String? uuid;
  String? keywords;
  int? parentId;
  String? type;
  String? img;
  bool? active;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  Translation? translation;

  Parent({
    this.id,
    this.uuid,
    this.keywords,
    this.parentId,
    this.type,
    this.img,
    this.active,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.translation,
  });

  Parent copyWith({
    int? id,
    String? uuid,
    String? keywords,
    int? parentId,
    String? type,
    String? img,
    bool? active,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    Translation? translation,
  }) =>
      Parent(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        keywords: keywords ?? this.keywords,
        parentId: parentId ?? this.parentId,
        type: type ?? this.type,
        img: img ?? this.img,
        active: active ?? this.active,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        translation: translation ?? this.translation,
      );

  factory Parent.fromJson(Map<String, dynamic> json) => Parent(
        id: json["id"],
        uuid: json["uuid"],
        keywords: json["keywords"],
        parentId: json["parent_id"],
        type: json["type"],
        img: json["img"],
        active: json["active"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        translation: json["translation"] == null
            ? null
            : Translation.fromJson(json["translation"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "keywords": keywords,
        "parent_id": parentId,
        "type": type,
        "img": img,
        "active": active,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "translation": translation?.toJson(),
      };
}
