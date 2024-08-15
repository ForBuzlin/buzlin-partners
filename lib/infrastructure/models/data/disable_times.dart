import 'translation.dart';
import 'user_data.dart';

class DisableTimes {
  int? id;
  int? masterId;
  String? repeats;
  String? customRepeatType;
  List<String>? customRepeatValue;
  DateTime? date;
  String? from;
  bool? canBooking;
  String? to;
  String? endType;
  String? endValue;
  DateTime? createdAt;
  DateTime? updatedAt;
  UserData? master;
  Translation? translation;
  List<Translation>? translations;
  List<String>? locales;

  DisableTimes({
    this.id,
    this.masterId,
    this.repeats,
    this.customRepeatType,
    this.customRepeatValue,
    this.date,
    this.from,
    this.to,
    this.endType,
    this.createdAt,
    this.updatedAt,
    this.master,
    this.translation,
    this.translations,
    this.locales,
    this.endValue,
    this.canBooking,
  });

  DisableTimes copyWith({
    int? id,
    int? masterId,
    String? repeats,
    String? customRepeatType,
    List<String>? customRepeatValue,
    DateTime? date,
    String? from,
    String? to,
    String? endValue,
    bool? canBooking,
    String? endType,
    DateTime? createdAt,
    DateTime? updatedAt,
    UserData? master,
    Translation? translation,
    List<Translation>? translations,
    List<String>? locales,
  }) =>
      DisableTimes(
        id: id ?? this.id,
        masterId: masterId ?? this.masterId,
        repeats: repeats ?? this.repeats,
        customRepeatType: customRepeatType ?? this.customRepeatType,
        customRepeatValue: customRepeatValue ?? this.customRepeatValue,
        date: date ?? this.date,
        from: from ?? this.from,
        to: to ?? this.to,
        endValue: endValue ?? this.endValue,
        canBooking: canBooking ?? this.canBooking,
        endType: endType ?? this.endType,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        master: master ?? this.master,
        translation: translation ?? this.translation,
        translations: translations ?? this.translations,
        locales: locales ?? this.locales,
      );

  factory DisableTimes.fromJson(Map<String, dynamic> json) => DisableTimes(
    id: json["id"],
    masterId: json["master_id"],
    repeats: json["repeats"],
    canBooking: json["can_booking"],
    customRepeatType: json["custom_repeat_type"],
    customRepeatValue: json["custom_repeat_value"] == null ? [] : List<String>.from(json["custom_repeat_value"]!.map((x) => x)),
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    from: json["from"],
    endValue: json["end_value"],
    to: json["to"],
    endType: json["end_type"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    master: json["master"] == null ? null : UserData.fromJson(json["master"]),
    translation: json["translation"] == null ? null : Translation.fromJson(json["translation"]),
    translations: json["translations"] == null ? [] : List<Translation>.from(json["translations"]!.map((x) => Translation.fromJson(x))),
    locales: json["locales"] == null ? [] : List<String>.from(json["locales"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "master_id": masterId,
    "repeats": repeats,
    "end_value": endValue,
    "can_booking": canBooking,
    "custom_repeat_type": customRepeatType,
    "custom_repeat_value": customRepeatValue == null ? [] : List<dynamic>.from(customRepeatValue!.map((x) => x)),
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "from": from,
    "to": to,
    "end_type": endType,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "master": master?.toJson(),
    "translation": translation?.toJson(),
    "translations": translations == null ? [] : List<dynamic>.from(translations!.map((x) => x.toJson())),
    "locales": locales == null ? [] : List<dynamic>.from(locales!.map((x) => x)),
  };
}
