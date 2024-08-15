class WorkingDay {
  int? id;
  String? day;
  String? from;
  String? to;
  int? deliveryPointId;
  bool? disabled;
  DateTime? createdAt;
  DateTime? updatedAt;

  WorkingDay({
    this.id,
    this.day,
    this.from,
    this.to,
    this.deliveryPointId,
    this.disabled,
    this.createdAt,
    this.updatedAt,
  });

  WorkingDay copyWith({
    int? id,
    String? day,
    String? from,
    String? to,
    int? deliveryPointId,
    bool? disabled,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      WorkingDay(
        id: id ?? this.id,
        day: day ?? this.day,
        from: from ?? this.from,
        to: to ?? this.to,
        deliveryPointId: deliveryPointId ?? this.deliveryPointId,
        disabled: disabled ?? this.disabled,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory WorkingDay.fromJson(Map<String, dynamic> json) => WorkingDay(
    id: json["id"],
    day: json["day"],
    from: json["from"],
    to: json["to"],
    deliveryPointId: json["delivery_point_id"],
    disabled: json["disabled"],
    createdAt: json["created_at"] == null
        ? null
        : DateTime.tryParse(json["created_at"])?.toLocal(),
    updatedAt: json["updated_at"] == null
        ? null
        : DateTime.tryParse(json["updated_at"])?.toLocal(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "day": day,
    "from": from,
    "to": to,
    "delivery_point_id": deliveryPointId,
    "disabled": disabled,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
