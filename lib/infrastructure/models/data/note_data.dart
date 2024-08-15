class NotesData {
  int? id;
  int? orderId;
  String? status;
  List<Notes>? notes;
  DateTime? createdAt;
  DateTime? updatedAt;

  NotesData({
    this.id,
    this.orderId,
    this.status,
    this.notes,
    this.createdAt,
    this.updatedAt,
  });

  NotesData copyWith({
    int? id,
    int? orderId,
    String? status,
    List<Notes>? notes,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      NotesData(
        id: id ?? this.id,
        orderId: orderId ?? this.orderId,
        status: status ?? this.status,
        notes: notes ?? this.notes,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory NotesData.fromJson(Map<String, dynamic> json) => NotesData(
    id: json["id"],
    orderId: json["order_id"],
    status: json["status"],
    notes: json["notes"] == null ? [] : List<Notes>.from(json["notes"]!.map((x) => Notes.fromJson(x))),
    createdAt: json["created_at"] == null ? null : DateTime.tryParse(json["created_at"])?.toLocal(),
    updatedAt: json["updated_at"] == null ? null : DateTime.tryParse(json["updated_at"])?.toLocal(),
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId,
    "status": status,
    "notes": notes == null ? [] : List<dynamic>.from(notes!.map((x) => x.toJson())),
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class Notes {
  Map<String, dynamic>? title;
  DateTime? createdAt;

  Notes({
    this.title,
    this.createdAt,
  });

  Notes copyWith({
    Map<String, dynamic>? title,
    DateTime? createdAt,
  }) =>
      Notes(
        title: title ?? this.title,
        createdAt: createdAt ?? this.createdAt,
      );

  factory Notes.fromJson(Map<String, dynamic> json) => Notes(
    title: json["title"],
    createdAt: json["created_at"] == null ? null : DateTime.tryParse(json["created_at"])?.toLocal(),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    if(createdAt != null)
    "created_at": createdAt?.toIso8601String(),
  };
}