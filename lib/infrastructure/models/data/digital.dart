class Digital {
  int? id;
  bool? active;
  int? productId;
  String? path;

  Digital({
    this.id,
    this.active,
    this.productId,
    this.path,
  });

  Digital copyWith({
    int? id,
    bool? active,
    int? productId,
    String? path,
  }) =>
      Digital(
        id: id ?? this.id,
        active: active ?? this.active,
        productId: productId ?? this.productId,
        path: path ?? this.path,
      );

  factory Digital.fromJson(Map<String, dynamic> json) => Digital(
        id: json["id"],
        active: json["active"],
        productId: int.tryParse(json["product_id"].toString()),
        path: json["path"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "active": active,
        "product_id": productId,
        "path": path,
      };
}
