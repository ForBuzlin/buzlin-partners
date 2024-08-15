class CouponData {
  int? id;
  String? name;
  String? type;
  String? dataFor;
  int? qty;
  num? price;
  DateTime? expiredAt;
  String? img;
  DateTime? createdAt;
  DateTime? updatedAt;

  CouponData({
    this.id,
    this.name,
    this.type,
    this.dataFor,
    this.qty,
    this.price,
    this.expiredAt,
    this.img,
    this.createdAt,
    this.updatedAt,
  });

  CouponData copyWith({
    int? id,
    String? name,
    String? type,
    String? dataFor,
    int? qty,
    num? price,
    DateTime? expiredAt,
    String? img,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      CouponData(
        id: id ?? this.id,
        name: name ?? this.name,
        type: type ?? this.type,
        dataFor: dataFor ?? this.dataFor,
        qty: qty ?? this.qty,
        price: price ?? this.price,
        expiredAt: expiredAt ?? this.expiredAt,
        img: img ?? this.img,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory CouponData.fromJson(Map<String, dynamic> json) => CouponData(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        dataFor: json["for"],
        qty: json["qty"],
        price: json["price"],
        expiredAt: json["expired_at"] == null
            ? null
            : DateTime.parse(json["expired_at"]),
        img: json["img"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.tryParse(json["created_at"])?.toLocal(),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.tryParse(json["updated_at"])?.toLocal(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "for": dataFor,
        "qty": qty,
        "price": price,
        "expired_at": expiredAt?.toIso8601String(),
        "img": img,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
