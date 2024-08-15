class SocialData {
  int? id;
  int? shopId;
  String? type;
  String? content;
  DateTime? createdAt;
  DateTime? updatedAt;

  SocialData({
    this.id,
    this.shopId,
    this.type,
    this.content,
    this.createdAt,
    this.updatedAt,
  });

  factory SocialData.fromJson(Map<String, dynamic> json) => SocialData(
        id: json["id"],
        shopId: json["shop_id"],
        type: json["type"],
        content: json["content"],
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
        "type": type,
        "content": content,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
