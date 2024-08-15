import 'package:venderuzmart/infrastructure/models/data/booking_data.dart';

class SingleBookingResponse {
  DateTime? timestamp;
  bool? status;
  String? message;
  BookingData? data;

  SingleBookingResponse({
    this.timestamp,
    this.status,
    this.message,
    this.data,
  });

  SingleBookingResponse copyWith({
    DateTime? timestamp,
    bool? status,
    String? message,
    BookingData? data,
  }) =>
      SingleBookingResponse(
        timestamp: timestamp ?? this.timestamp,
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory SingleBookingResponse.fromJson(Map<String, dynamic> json) => SingleBookingResponse(
    timestamp: json["timestamp"] == null ? null : DateTime.parse(json["timestamp"]),
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : BookingData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "timestamp": timestamp?.toIso8601String(),
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

