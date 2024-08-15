import '../data/service_data.dart';

class ServiceResponse {
  DateTime? timestamp;
  bool? status;
  String? message;
  ServiceData? data;

  ServiceResponse({
    this.timestamp,
    this.status,
    this.message,
    this.data,
  });

  ServiceResponse copyWith({
    DateTime? timestamp,
    bool? status,
    String? message,
    ServiceData? data,
  }) =>
      ServiceResponse(
        timestamp: timestamp ?? this.timestamp,
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory ServiceResponse.fromJson(Map<String, dynamic> json) => ServiceResponse(
    timestamp: json["timestamp"] == null ? null : DateTime.parse(json["timestamp"]),
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : ServiceData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "timestamp": timestamp?.toIso8601String(),
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}


