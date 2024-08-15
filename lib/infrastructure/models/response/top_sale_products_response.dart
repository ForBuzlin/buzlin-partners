import '../data/top_sale_products.dart';

class TopSaleProductsResponse {
  DateTime? timestamp;
  bool? status;
  String? message;
  List<TopSaleProducts>? data;

  TopSaleProductsResponse({
    this.timestamp,
    this.status,
    this.message,
    this.data,
  });

  TopSaleProductsResponse copyWith({
    DateTime? timestamp,
    bool? status,
    String? message,
    List<TopSaleProducts>? data,
  }) =>
      TopSaleProductsResponse(
        timestamp: timestamp ?? this.timestamp,
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory TopSaleProductsResponse.fromJson(Map<String, dynamic> json) =>
      TopSaleProductsResponse(
        timestamp: json["timestamp"] == null
            ? null
            : DateTime.parse(json["timestamp"]),
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<TopSaleProducts>.from(
                json["data"]!.map((x) => TopSaleProducts.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp?.toIso8601String(),
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}
