class ClosedDates {
  int? id;
  DateTime? date;
  int? masterId;
  DateTime? createdAt;
  DateTime? updatedAt;

  ClosedDates({
    this.id,
    this.date,
    this.masterId,
    this.createdAt,
    this.updatedAt,
  });

  ClosedDates copyWith({
    int? id,
    DateTime? date,
    int? masterId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      ClosedDates(
        id: id ?? this.id,
        date: date ?? this.date,
        masterId: masterId ?? this.masterId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory ClosedDates.fromJson(Map<String, dynamic> json) => ClosedDates(
    id: json["id"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    masterId: json["master_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "master_id": masterId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}