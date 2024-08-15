import '../data/booking_calculate_data.dart';

class BookingsCalculateResponse {
  DateTime? timestamp;
  bool? status;
  String? message;
  BookingCalculateData? data;

  BookingsCalculateResponse({
    this.timestamp,
    this.status,
    this.message,
    this.data,
  });

  BookingsCalculateResponse copyWith({
    DateTime? timestamp,
    bool? status,
    String? message,
    BookingCalculateData? data,
  }) =>
      BookingsCalculateResponse(
        timestamp: timestamp ?? this.timestamp,
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory BookingsCalculateResponse.fromJson(Map<String, dynamic> json) => BookingsCalculateResponse(
    timestamp: json["timestamp"] == null ? null : DateTime.parse(json["timestamp"]),
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : BookingCalculateData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "timestamp": timestamp?.toIso8601String(),
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}


