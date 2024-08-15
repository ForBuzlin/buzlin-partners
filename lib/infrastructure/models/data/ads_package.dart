import 'galleries.dart';
import 'translation.dart';

class AdsPackage {
  int? id;
  bool? active;
  String? type;
  String? timeType;
  int? time;
  int? price;
  DateTime? createdAt;
  DateTime? updatedAt;
  Translation? translation;
  List<Galleries>? galleries;

  AdsPackage({
    this.id,
    this.active,
    this.type,
    this.timeType,
    this.time,
    this.price,
    this.createdAt,
    this.updatedAt,
    this.translation,
    this.galleries,
  });

  AdsPackage copyWith({
    int? id,
    bool? active,
    String? type,
    String? timeType,
    int? time,
    int? price,
    DateTime? createdAt,
    DateTime? updatedAt,
    Translation? translation,
    List<Galleries>? galleries,
  }) =>
      AdsPackage(
        id: id ?? this.id,
        active: active ?? this.active,
        type: type ?? this.type,
        timeType: timeType ?? this.timeType,
        time: time ?? this.time,
        price: price ?? this.price,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        translation: translation ?? this.translation,
        galleries: galleries ?? this.galleries,
      );

  factory AdsPackage.fromJson(Map<String, dynamic> json) => AdsPackage(
        id: json["id"],
        active: json["active"],
        type: json["type"],
        timeType: json["time_type"],
        time: json["time"],
        price: json["price"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.tryParse(json["created_at"])?.toLocal(),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.tryParse(json["updated_at"])?.toLocal(),
        translation: json["translation"] == null
            ? null
            : Translation.fromJson(json["translation"]),
        galleries: json["galleries"] == null
            ? []
            : List<Galleries>.from(
                json["galleries"]!.map((x) => Galleries.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "active": active,
        "type": type,
        "time_type": timeType,
        "time": time,
        "price": price,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "translation": translation?.toJson(),
        "galleries": galleries == null
            ? []
            : List<dynamic>.from(galleries!.map((x) => x.toJson())),
      };
}
