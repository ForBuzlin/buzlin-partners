List<ActivityData> activityDataFromJson(List str) =>
    List<ActivityData>.from(str.map((x) => ActivityData.fromJson(x)));

List<dynamic> activityDataToJson(List<ActivityData> data) =>
    List<dynamic>.from(data.map((x) => x.toJson()));

class ActivityData {
  int? id;
  int? bookingId;
  int? userId;
  String? note;
  String? type;
  DateTime? createdAt;
  DateTime? updatedAt;

  ActivityData({
    this.id,
    this.bookingId,
    this.userId,
    this.note,
    this.type,
    this.createdAt,
    this.updatedAt,
  });

  ActivityData copyWith({
    int? id,
    int? bookingId,
    int? userId,
    String? note,
    String? type,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      ActivityData(
        id: id ?? this.id,
        bookingId: bookingId ?? this.bookingId,
        userId: userId ?? this.userId,
        note: note ?? this.note,
        type: type ?? this.type,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory ActivityData.fromJson(Map<String, dynamic> json) => ActivityData(
        id: json["id"],
        bookingId: json["booking_id"],
        userId: json["user_id"],
        note: json["note"],
        type: json["type"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]).toLocal(),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]).toLocal(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "booking_id": bookingId,
        "user_id": userId,
        "note": note,
        "type": type,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
