import 'dart:convert';
import '../data/gift_card_data.dart';

SingleGiftCardResponse singleGiftCardResponseFromJson(String str) => SingleGiftCardResponse.fromJson(json.decode(str));

String singleGiftCardResponseToJson(SingleGiftCardResponse data) => json.encode(data.toJson());

class SingleGiftCardResponse {
  DateTime timestamp;
  bool status;
  String message;
  GiftCardData data;

  SingleGiftCardResponse({
    required this.timestamp,
    required this.status,
    required this.message,
    required this.data,
  });

  factory SingleGiftCardResponse.fromJson(Map<String, dynamic> json) => SingleGiftCardResponse(
    timestamp: DateTime.parse(json["timestamp"]),
    status: json["status"],
    message: json["message"],
    data: GiftCardData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "timestamp": timestamp.toIso8601String(),
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}
