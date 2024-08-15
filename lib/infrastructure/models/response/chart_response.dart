import 'dart:convert';

import '../data/chart_data.dart';

ChartResponse chartResponseFromJson(String str) =>
    ChartResponse.fromJson(json.decode(str));

String chartResponseToJson(ChartResponse data) => json.encode(data.toJson());

class ChartResponse {
  DateTime? timestamp;
  bool? status;
  String? message;
  List<ChartData>? data;

  ChartResponse({
    this.timestamp,
    this.status,
    this.message,
    this.data,
  });

  ChartResponse copyWith({
    DateTime? timestamp,
    bool? status,
    String? message,
    List<ChartData>? data,
  }) =>
      ChartResponse(
        timestamp: timestamp ?? this.timestamp,
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory ChartResponse.fromJson(Map<String, dynamic> json) => ChartResponse(
        timestamp: json["timestamp"] == null
            ? null
            : DateTime.parse(json["timestamp"]),
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<ChartData>.from(
                json["data"]!.map((x) => ChartData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp?.toIso8601String(),
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}
