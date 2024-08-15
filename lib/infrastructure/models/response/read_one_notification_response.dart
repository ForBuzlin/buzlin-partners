import '../data/read_one_notification_data.dart';

class ReadOneNotificationResponse {
  ReadOneNotificationData? data;

  ReadOneNotificationResponse({
    this.data,
  });

  ReadOneNotificationResponse copyWith({
    ReadOneNotificationData? data,
  }) =>
      ReadOneNotificationResponse(
        data: data ?? this.data,
      );

  factory ReadOneNotificationResponse.fromJson(Map<String, dynamic> json) =>
      ReadOneNotificationResponse(
        data: json["data"] == null
            ? null
            : ReadOneNotificationData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}
