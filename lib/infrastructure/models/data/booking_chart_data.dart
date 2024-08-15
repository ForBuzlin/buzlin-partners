List<BookingChartData> bookingChartDataFromJson(List<dynamic> str) =>
    List<BookingChartData>.from(str.map((x) => BookingChartData.fromJson(x)));

List<dynamic> bookingChartDataToJson(List<BookingChartData> data) =>
    List<dynamic>.from(data.map((x) => x.toJson()));

class BookingChartData {
  DateTime? time;
  int? totalPrice;
  double? averageTotalPrice;
  int? canceledTotalPrice;
  double? canceledAvgTotalPrice;

  BookingChartData({
    this.time,
    this.totalPrice,
    this.averageTotalPrice,
    this.canceledTotalPrice,
    this.canceledAvgTotalPrice,
  });

  BookingChartData copyWith({
    DateTime? time,
    int? totalPrice,
    double? averageTotalPrice,
    int? canceledTotalPrice,
    double? canceledAvgTotalPrice,
  }) =>
      BookingChartData(
        time: time ?? this.time,
        totalPrice: totalPrice ?? this.totalPrice,
        averageTotalPrice: averageTotalPrice ?? this.averageTotalPrice,
        canceledTotalPrice: canceledTotalPrice ?? this.canceledTotalPrice,
        canceledAvgTotalPrice:
            canceledAvgTotalPrice ?? this.canceledAvgTotalPrice,
      );

  factory BookingChartData.fromJson(Map<String, dynamic> json) =>
      BookingChartData(
        time: json["time"] == null ? null : DateTime.parse(json["time"]),
        totalPrice: json["total_price"],
        averageTotalPrice: json["average_total_price"]?.toDouble(),
        canceledTotalPrice: json["canceled_total_price"],
        canceledAvgTotalPrice: json["canceled_avg_total_price"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "time":
            "${time!.year.toString().padLeft(4, '0')}-${time!.month.toString().padLeft(2, '0')}-${time!.day.toString().padLeft(2, '0')}",
        "total_price": totalPrice,
        "average_total_price": averageTotalPrice,
        "canceled_total_price": canceledTotalPrice,
        "canceled_avg_total_price": canceledAvgTotalPrice,
      };
}
