class ChartData {
  double? totalPrice;
  int? count;
  DateTime? time;

  ChartData({
    this.totalPrice,
    this.count,
    this.time,
  });

  ChartData copyWith({
    double? totalPrice,
    int? count,
    DateTime? time,
  }) =>
      ChartData(
        totalPrice: totalPrice ?? this.totalPrice,
        count: count ?? this.count,
        time: time ?? this.time,
      );

  factory ChartData.fromJson(Map<String, dynamic> json) => ChartData(
        totalPrice: json["total_price"]?.toDouble(),
        count: json["count"],
        time: DateTime.tryParse(json["time"]),
      );

  Map<String, dynamic> toJson() => {
        "total_price": totalPrice,
        "count": count,
        "time": time,
      };
}
