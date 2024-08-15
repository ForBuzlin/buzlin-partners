import '../data/price_data.dart';

class ProductCalculateResponse {
  DateTime? timestamp;
  bool? status;
  String? message;
  PriceData? data;

  ProductCalculateResponse({
    this.timestamp,
    this.status,
    this.message,
    this.data,
  });

  ProductCalculateResponse copyWith({
    DateTime? timestamp,
    bool? status,
    String? message,
    PriceData? data,
  }) =>
      ProductCalculateResponse(
        timestamp: timestamp ?? this.timestamp,
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory ProductCalculateResponse.fromJson(Map<String, dynamic> json) =>
      ProductCalculateResponse(
        timestamp: json["timestamp"] == null
            ? null
            : DateTime.parse(json["timestamp"]),
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : PriceData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp?.toIso8601String(),
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}
