import 'dart:convert';

import '../data/statistics_data.dart';

StatisticsResponse statisticsResponseFromJson(String str) =>
    StatisticsResponse.fromJson(json.decode(str));

String statisticsResponseToJson(StatisticsResponse data) =>
    json.encode(data.toJson());

class StatisticsResponse {
  DateTime? timestamp;
  bool? status;
  String? message;
  StatisticsData? data;

  StatisticsResponse({
    this.timestamp,
    this.status,
    this.message,
    this.data,
  });

  StatisticsResponse copyWith({
    DateTime? timestamp,
    bool? status,
    String? message,
    StatisticsData? data,
  }) =>
      StatisticsResponse(
        timestamp: timestamp ?? this.timestamp,
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory StatisticsResponse.fromJson(Map<String, dynamic> json) =>
      StatisticsResponse(
        timestamp: json["timestamp"] == null
            ? null
            : DateTime.parse(json["timestamp"]),
        status: json["status"],
        message: json["message"],
        data:
            json["data"] == null ? null : StatisticsData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp?.toIso8601String(),
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}
