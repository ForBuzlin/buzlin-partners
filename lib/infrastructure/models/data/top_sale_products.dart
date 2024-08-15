import 'product_data.dart';

import 'extras.dart';

class TopSaleProducts {
  int? id;
  int? productId;
  num? price;
  int? quantity;
  num? tax;
  num? totalPrice;
  int? count;
  List<Extras>? extras;
  ProductData? product;

  TopSaleProducts({
    this.id,
    this.productId,
    this.price,
    this.quantity,
    this.tax,
    this.totalPrice,
    this.count,
    this.extras,
    this.product,
  });

  TopSaleProducts copyWith({
    int? id,
    int? productId,
    num? price,
    int? quantity,
    num? tax,
    num? totalPrice,
    int? count,
    List<Extras>? extras,
    ProductData? product,
  }) =>
      TopSaleProducts(
        id: id ?? this.id,
        productId: productId ?? this.productId,
        price: price ?? this.price,
        quantity: quantity ?? this.quantity,
        tax: tax ?? this.tax,
        totalPrice: totalPrice ?? this.totalPrice,
        count: count ?? this.count,
        extras: extras ?? this.extras,
        product: product ?? this.product,
      );

  factory TopSaleProducts.fromJson(Map<String, dynamic> json) =>
      TopSaleProducts(
        id: json["id"],
        productId: json["product_id"],
        price: json["price"],
        quantity: json["quantity"],
        tax: json["tax"]?.toDouble(),
        totalPrice: json["total_price"]?.toDouble(),
        count: json["count"],
        extras: json["extras"] == null
            ? []
            : List<Extras>.from(json["extras"]!.map((x) => Extras.fromJson(x))),
        product: json["product"] == null
            ? null
            : ProductData.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "price": price,
        "quantity": quantity,
        "tax": tax,
        "total_price": totalPrice,
        "count": count,
        "extras": extras == null
            ? []
            : List<dynamic>.from(extras!.map((x) => x.toJson())),
        "product": product?.toJson(),
      };
}
