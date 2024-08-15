import '../data/form_options_data.dart';

class SingleFormOptionsResponse {
  DateTime? timestamp;
  bool? status;
  String? message;
  FormOptionsData? data;

  SingleFormOptionsResponse({
    this.timestamp,
    this.status,
    this.message,
    this.data,
  });

  SingleFormOptionsResponse copyWith({
    DateTime? timestamp,
    bool? status,
    String? message,
    FormOptionsData? data,
  }) =>
      SingleFormOptionsResponse(
        timestamp: timestamp ?? this.timestamp,
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory SingleFormOptionsResponse.fromJson(Map<String, dynamic> json) => SingleFormOptionsResponse(
    timestamp: json["timestamp"] == null ? null : DateTime.parse(json["timestamp"]),
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : FormOptionsData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "timestamp": timestamp?.toIso8601String(),
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}


