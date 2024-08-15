import 'client.dart';
import 'user_data.dart';

class ReadOneNotificationData {
  int? id;
  String? type;
  String? title;
  String? body;
  DataData? data;
  int? userId;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? readAt;
  UserData? user;
  Client? client;

  ReadOneNotificationData({
    this.id,
    this.type,
    this.title,
    this.body,
    this.data,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.readAt,
    this.user,
    this.client,
  });

  ReadOneNotificationData copyWith({
    int? id,
    String? type,
    String? title,
    String? body,
    DataData? data,
    int? userId,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? readAt,
    UserData? user,
    Client? client,
  }) =>
      ReadOneNotificationData(
        id: id ?? this.id,
        type: type ?? this.type,
        title: title ?? this.title,
        body: body ?? this.body,
        data: data ?? this.data,
        userId: userId ?? this.userId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        readAt: readAt ?? this.readAt,
        user: user ?? this.user,
        client: client ?? this.client,
      );

  factory ReadOneNotificationData.fromJson(Map<String, dynamic> json) =>
      ReadOneNotificationData(
        id: json["id"],
        type: json["type"],
        title: json["title"],
        body: json["body"],
        data: json["data"] == null ? null : DataData.fromJson(json["data"]),
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
        user: json["user"] == null ? null : UserData.fromJson(json["user"]),
        client: json["client"] == null ? null : Client.fromJson(json["client"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "title": title,
        "body": body,
        "data": data?.toJson(),
        "user_id": userId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "read_at": readAt?.toIso8601String(),
        "user": user?.toJson(),
        "client": client?.toJson(),
      };
}

class DataData {
  int? id;
  String? type;
  String? status;

  DataData({
    this.id,
    this.type,
    this.status,
  });

  DataData copyWith({
    int? id,
    String? type,
    String? status,
  }) =>
      DataData(
        id: id ?? this.id,
        type: type ?? this.type,
        status: status ?? this.status,
      );

  factory DataData.fromJson(Map<String, dynamic> json) => DataData(
        id: json["id"],
        type: json["type"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "status": status,
      };
}
