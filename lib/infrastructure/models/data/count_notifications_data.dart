class CountNotificationData {
  int? notification;
  int? transaction;

  CountNotificationData({
    this.notification,
    this.transaction,
  });

  CountNotificationData copyWith({
    int? notification,
    int? transaction,
  }) =>
      CountNotificationData(
        notification: notification ?? this.notification,
        transaction: transaction ?? this.transaction,
      );

  factory CountNotificationData.fromJson(Map<String, dynamic> json) =>
      CountNotificationData(
        notification: json["notification"],
        transaction: json["transaction"],
      );

  Map<String, dynamic> toJson() => {
        "notification": notification,
        "transaction": transaction,
      };
}
