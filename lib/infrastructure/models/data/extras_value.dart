class ExtrasValue {
  int? id;
  int? extraGroupId;
  String? value;
  bool? active;

  ExtrasValue({
    this.id,
    this.extraGroupId,
    this.value,
    this.active,
  });

  ExtrasValue copyWith({
    int? id,
    int? extraGroupId,
    String? value,
    bool? active,
  }) =>
      ExtrasValue(
        id: id ?? this.id,
        extraGroupId: extraGroupId ?? this.extraGroupId,
        value: value ?? this.value,
        active: active ?? this.active,
      );

  factory ExtrasValue.fromJson(Map<String, dynamic> json) => ExtrasValue(
        id: json["id"],
        extraGroupId: json["extra_group_id"],
        value: json["value"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "extra_group_id": extraGroupId,
        "value": value,
        "active": active,
      };
}
