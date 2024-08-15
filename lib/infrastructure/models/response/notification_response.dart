import '../data/notification_data.dart';

class NotificationResponse {
  List<NotificationData>? data;

  NotificationResponse({
    this.data,
  });

  NotificationResponse copyWith({
    List<NotificationData>? data,
  }) =>
      NotificationResponse(
        data: data ?? this.data,
      );

  factory NotificationResponse.fromJson(Map<String, dynamic> json) =>
      NotificationResponse(
        data: json["data"] == null
            ? []
            : List<NotificationData>.from(
                json["data"]!.map((x) => NotificationData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}
