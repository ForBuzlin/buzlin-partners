import 'package:venderuzmart/infrastructure/models/data/booking_data.dart';

import 'blog_data.dart';
import 'client.dart';
import 'order_data.dart';

class NotificationData {
  int? id;
  int? modelId;
  String? type;
  String? title;
  String? body;
  Data? data;
  int? userId;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? readAt;
  Client? client;
  OrderData? orderData;
  BookingData? bookingData;
  BlogData? blogData;

  NotificationData({
    this.id,
    this.modelId,
    this.type,
    this.title,
    this.body,
    this.data,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.readAt,
    this.client,
    this.bookingData,
    this.orderData,
    this.blogData,
  });

  NotificationData copyWith(
          {int? id,
          String? type,
          String? title,
          String? body,
          Data? data,
          int? userId,
          int? modelId,
          DateTime? createdAt,
          DateTime? updatedAt,
          DateTime? readAt,
          Client? client,
          BookingData? bookingData,
          OrderData? orderData,
          BlogData? blogData}) =>
      NotificationData(
          id: id ?? this.id,
          modelId: modelId ?? this.modelId,
          type: type ?? this.type,
          title: title ?? this.title,
          body: body ?? this.body,
          data: data ?? this.data,
          userId: userId ?? this.userId,
          createdAt: createdAt ?? this.createdAt,
          updatedAt: updatedAt ?? this.updatedAt,
          readAt: readAt ?? this.readAt,
          client: client ?? this.client,
          bookingData: bookingData ?? this.bookingData,
          orderData: orderData ?? this.orderData,
          blogData: blogData ?? this.blogData);

  factory NotificationData.fromJson(Map<String, dynamic> json) =>
      NotificationData(
        id: json["id"],
        modelId: json["model_id"],
        type: json["model_type"],
        title: json["title"],
        body: json["body"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        bookingData: json["model"] != "booking" ? null : BookingData.fromJson(json["model"]),
        userId: json["user_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.tryParse(json["created_at"])?.toLocal(),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.tryParse(json["updated_at"])?.toLocal(),
        readAt: json["read_at"] == null
            ? null
            : DateTime.tryParse(json["read_at"])?.toLocal(),
        client: json["client"] == null ? null : Client.fromJson(json["client"]),
        orderData:
            json["order"] == null ? null : OrderData.fromJson(json["order"]),
        blogData: json["blog"] == null ? null : BlogData.fromJson(json["blog"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "model_id": modelId,
        "type": type,
        "title": title,
        "body": body,
        "data": data?.toJson(),
        "user_id": userId,
        "model": bookingData?.toJson(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "read_at": readAt?.toIso8601String(),
        "client": client?.toJson(),
        "order": orderData?.toJson(),
      };
}

class Data {
  int? id;
  String? type;
  String? status;

  Data({
    this.id,
    this.type,
    this.status,
  });

  Data copyWith({
    int? id,
    String? type,
    String? status,
  }) =>
      Data(
        id: id ?? this.id,
        type: type ?? this.type,
        status: status ?? this.status,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        type: json["type"].toString(),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "status": status,
      };
}
