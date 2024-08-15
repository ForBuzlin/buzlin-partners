import 'package:venderuzmart/infrastructure/models/models.dart';

class SingleDisableTimeResponse {
  DateTime? timestamp;
  bool? status;
  String? message;
  DisableTimes? data;

  SingleDisableTimeResponse({
    this.timestamp,
    this.status,
    this.message,
    this.data,
  });

  SingleDisableTimeResponse copyWith({
    DateTime? timestamp,
    bool? status,
    String? message,
    DisableTimes? data,
  }) =>
      SingleDisableTimeResponse(
        timestamp: timestamp ?? this.timestamp,
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory SingleDisableTimeResponse.fromJson(Map<String, dynamic> json) => SingleDisableTimeResponse(
    timestamp: json["timestamp"] == null ? null : DateTime.parse(json["timestamp"]),
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : DisableTimes.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "timestamp": timestamp?.toIso8601String(),
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}



