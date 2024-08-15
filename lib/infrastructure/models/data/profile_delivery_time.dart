class ProfileDeliveryTime {
  String? to;
  String? from;
  String? type;

  ProfileDeliveryTime({
    this.to,
    this.from,
    this.type,
  });

  ProfileDeliveryTime copyWith({
    String? to,
    String? from,
    String? type,
  }) =>
      ProfileDeliveryTime(
        to: to ?? this.to,
        from: from ?? this.from,
        type: type ?? this.type,
      );

  factory ProfileDeliveryTime.fromJson(Map<String, dynamic> json) =>
      ProfileDeliveryTime(
        to: json["to"],
        from: json["from"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "to": to,
        "from": from,
        "type": type,
      };
}
