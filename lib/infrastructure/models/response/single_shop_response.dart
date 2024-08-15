import '../data/shop_data.dart';

class SingleShopResponse {
  DateTime? timestamp;
  bool? status;
  String? message;
  ShopData? data;

  SingleShopResponse({
    this.timestamp,
    this.status,
    this.message,
    this.data,
  });

  SingleShopResponse copyWith({
    DateTime? timestamp,
    bool? status,
    String? message,
    ShopData? data,
  }) =>
      SingleShopResponse(
        timestamp: timestamp ?? this.timestamp,
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory SingleShopResponse.fromJson(Map<String, dynamic> json) =>
      SingleShopResponse(
        timestamp: json["timestamp"] == null
            ? null
            : DateTime.parse(json["timestamp"]),
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : ShopData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp?.toIso8601String(),
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}
