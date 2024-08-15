import '../data/membership_data.dart';

class SingleMembershipResponse {
  DateTime? timestamp;
  bool? status;
  String? message;
  MembershipData? data;

  SingleMembershipResponse({
    this.timestamp,
    this.status,
    this.message,
    this.data,
  });

  SingleMembershipResponse copyWith({
    DateTime? timestamp,
    bool? status,
    String? message,
    MembershipData? data,
  }) =>
      SingleMembershipResponse(
        timestamp: timestamp ?? this.timestamp,
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory SingleMembershipResponse.fromJson(Map<String, dynamic> json) => SingleMembershipResponse(
    timestamp: json["timestamp"] == null ? null : DateTime.parse(json["timestamp"]),
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : MembershipData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "timestamp": timestamp?.toIso8601String(),
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}



