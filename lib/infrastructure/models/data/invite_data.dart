import 'package:venderuzmart/infrastructure/models/data/shop_data.dart';

class InviteData {
  int? id;
  int? shopId;
  int? userId;
  String? role;
  String? status;
  ShopData? shop;
  DateTime? createdAt;
  DateTime? updatedAt;

  InviteData({
    this.id,
    this.shopId,
    this.userId,
    this.role,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.shop,
  });

  InviteData copyWith({
    int? id,
    int? shopId,
    int? userId,
    String? role,
    String? status,
    ShopData? shop,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      InviteData(
        id: id ?? this.id,
        shopId: shopId ?? this.shopId,
        userId: userId ?? this.userId,
        role: role ?? this.role,
        shop: shop ?? this.shop,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory InviteData.fromJson(Map<String, dynamic> json) => InviteData(
        id: json["id"],
        shopId: json["shop_id"],
        userId: json["user_id"],
        role: json["role"],
        shop: json["shop"] == null ? null : ShopData.fromJson(json["shop"]),
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.tryParse(json["created_at"])?.toLocal(),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.tryParse(json["updated_at"])?.toLocal(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "shop_id": shopId,
        "user_id": userId,
        "shop": shop?.toJson(),
        "role": role,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
