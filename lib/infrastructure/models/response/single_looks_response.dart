import '../data/looks_data.dart';

class SingleLooksResponse {
  DateTime? timestamp;
  bool? status;
  String? message;
  LooksData? data;

  SingleLooksResponse({
    this.timestamp,
    this.status,
    this.message,
    this.data,
  });

  SingleLooksResponse copyWith({
    DateTime? timestamp,
    bool? status,
    String? message,
    LooksData? data,
  }) =>
      SingleLooksResponse(
        timestamp: timestamp ?? this.timestamp,
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory SingleLooksResponse.fromJson(Map<String, dynamic> json) =>
      SingleLooksResponse(
        timestamp: json["timestamp"] == null
            ? null
            : DateTime.parse(json["timestamp"]),
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : LooksData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp?.toIso8601String(),
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}
