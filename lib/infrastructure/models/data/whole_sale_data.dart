class WholeSalePrice {
  int? id;
  int? minQuantity;
  int? maxQuantity;
  int? price;

  WholeSalePrice({
    this.id,
    this.minQuantity,
    this.maxQuantity,
    this.price,
  });

  WholeSalePrice copyWith({
    int? id,
    int? minQuantity,
    int? maxQuantity,
    int? price,
  }) =>
      WholeSalePrice(
        id: id ?? this.id,
        minQuantity: minQuantity ?? this.minQuantity,
        maxQuantity: maxQuantity ?? this.maxQuantity,
        price: price ?? this.price,
      );

  factory WholeSalePrice.fromJson(Map<String, dynamic> json) => WholeSalePrice(
        id: json["id"],
        minQuantity: json["min_quantity"],
        maxQuantity: json["max_quantity"],
        price: json["price"],
      );

  Map<String, dynamic> toJson({bool withOutId = false}) => {
        "min_quantity": minQuantity,
        "max_quantity": maxQuantity,
        "price": price,
        if (!withOutId) "id": id,
      };
}
