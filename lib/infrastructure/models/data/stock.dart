import 'galleries.dart';
import 'extras.dart';
import 'product_data.dart';
import 'whole_sale_data.dart';

List<Stocks> stocksFromJson(List str) =>
    List<Stocks>.from(str.map((x) => Stocks.fromJson(x)));

List stocksToJson(List<Stocks> data) => List.from(data.map((x) => x.toJson()));

class Stocks {
  int? id;
  int? orderDetailId;
  int? stockId;
  int? replaceStockId;
  num? originPrice;
  num? totalPrice;
  num? discount;
  num? price;
  int? quantity;
  int? replaceQuantity;
  String? replaceNote;
  bool? bonus;
  DateTime? createdAt;
  DateTime? updatedAt;
  Stocks? stock;
  Stocks? replaceStock;
  List<Extras>? extras;
  List<Galleries>? galleries;
  bool? isChecked;
  String? sku;
  int? cartCount;
  ProductData? product;
  List<WholeSalePrice>? wholeSalePrices;

  Stocks({
    this.id,
    this.orderDetailId,
    this.stockId,
    this.replaceStockId,
    this.originPrice,
    this.totalPrice,
    this.quantity,
    this.replaceQuantity,
    this.replaceNote,
    this.bonus,
    this.price,
    this.createdAt,
    this.updatedAt,
    this.stock,
    this.replaceStock,
    this.galleries,
    this.extras,
    this.isChecked,
    this.sku,
    this.cartCount,
    this.product,
    this.discount,
    this.wholeSalePrices,
  });

  Stocks copyWith({
    int? id,
    int? orderDetailId,
    int? stockId,
    int? replaceStockId,
    num? originPrice,
    num? totalPrice,
    num? discount,
    num? price,
    int? quantity,
    int? replaceQuantity,
    String? replaceNote,
    bool? bonus,
    DateTime? createdAt,
    DateTime? updatedAt,
    Stocks? stock,
    Stocks? replaceStock,
    List<Galleries>? galleries,
    List<Extras>? extras,
    bool? isChecked,
    bool isInitial = false,
    String? sku,
    int? cartCount,
    ProductData? product,
    List<WholeSalePrice>? wholeSalePrices,
  }) =>
      Stocks(
        id: id ?? this.id,
        orderDetailId: orderDetailId ?? this.orderDetailId,
        stockId: stockId ?? this.stockId,
        replaceStockId: replaceStockId ?? this.replaceStockId,
        originPrice: originPrice ?? this.originPrice,
        totalPrice: totalPrice ?? this.totalPrice,
        quantity: isInitial ? 0 : quantity ?? this.quantity,
        replaceQuantity: replaceQuantity ?? this.replaceQuantity,
        replaceNote: replaceNote ?? this.replaceNote,
        bonus: bonus ?? this.bonus,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        stock: stock ?? this.stock,
        replaceStock: replaceStock ?? this.replaceStock,
        galleries: galleries ?? this.galleries,
        extras: extras ?? this.extras,
        price: isInitial ? 0 : price ?? this.price,
        isChecked: isChecked ?? this.isChecked,
        sku: isInitial ? '' : sku ?? this.sku,
        cartCount: isInitial ? 0 : cartCount ?? this.cartCount,
        product: product ?? this.product,
        wholeSalePrices: wholeSalePrices ?? this.wholeSalePrices,
        discount: isInitial ? 0 : discount ?? this.discount,
      );

  factory Stocks.fromJson(Map<String, dynamic> json) => Stocks(
        id: json["id"],
        orderDetailId: json["order_detail_id"],
        stockId: json["stock_id"],
        replaceStockId: json["replace_stock_id"],
        originPrice: json["origin_price"],
        totalPrice: json["total_price"],
        quantity: json["quantity"],
        replaceQuantity: json["replace_quantity"],
        replaceNote: json["replace_note"],
        bonus: json["bonus"],
        sku: json["sku"],
        price: json["price"],
        discount: num.tryParse("${json['discount']}") != null
            ? json['discount']
            : null,
        isChecked: false,
        createdAt: json["created_at"] == null
            ? null
            : DateTime.tryParse(json["created_at"])?.toLocal(),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.tryParse(json["updated_at"])?.toLocal(),
        product: json["product"] == null
            ? null
            : ProductData.fromJson(json["product"]),
        extras: json["extras"] == null
            ? json["stock_extras"] == null
                ? []
                : List<Extras>.from(
                    json["stock_extras"]!.map((x) => Extras.fromJson(x)))
            : List<Extras>.from(json["extras"]!.map((x) => Extras.fromJson(x))),
        stock: json["stock"] == null ? null : Stocks.fromJson(json["stock"]),
        replaceStock: json["replace_stock"] == null
            ? null
            : Stocks.fromJson(json["replace_stock"]),
        galleries: json["galleries"] == null
            ? []
            : List<Galleries>.from(
                json["galleries"]!.map((x) => Galleries.fromJson(x))),
        wholeSalePrices: json["whole_sale_prices"] == null
            ? []
            : List<WholeSalePrice>.from(json["whole_sale_prices"]!
                .map((x) => WholeSalePrice.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_detail_id": orderDetailId,
        "stock_id": stockId,
        "replace_stock_id": replaceStockId,
        "origin_price": originPrice,
        "total_price": totalPrice,
        "quantity": quantity,
        "replace_quantity": replaceQuantity,
        "replace_note": replaceNote,
        "bonus": bonus,
        "discount": discount,
        "price": price,
        "cart_count": cartCount,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "stock": stock?.toJson(),
        "product": product?.toJson(),
        "replace_stock": replaceStock?.toJson(),
        "galleries": galleries == null
            ? []
            : List<dynamic>.from(galleries!.map((x) => x.toJson())),
        "extras": extras == null
            ? []
            : List<dynamic>.from(extras!.map((x) => x.toJson())),
        "whole_sale_prices": wholeSalePrices == null
            ? []
            : List<dynamic>.from(wholeSalePrices!.map((x) => x.toJson())),
      };
}
