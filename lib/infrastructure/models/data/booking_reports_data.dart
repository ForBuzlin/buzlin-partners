class BookingReportsData {
  ReportData? bookingReportsDataNew;
  ReportData? booked;
  ReportData? progress;
  ReportData? canceled;
  ReportData? ended;
  GroupBooking? group;
  num? totalPrice;
  num? totalCount;

  BookingReportsData({
    this.bookingReportsDataNew,
    this.booked,
    this.progress,
    this.canceled,
    this.ended,
    this.group,
    this.totalPrice,
    this.totalCount,
  });

  BookingReportsData copyWith({
    ReportData? bookingReportsDataNew,
    ReportData? booked,
    ReportData? progress,
    ReportData? canceled,
    ReportData? ended,
    GroupBooking? group,
    num? totalPrice,
    num? totalCount,
  }) =>
      BookingReportsData(
        bookingReportsDataNew: bookingReportsDataNew ?? this.bookingReportsDataNew,
        booked: booked ?? this.booked,
        progress: progress ?? this.progress,
        canceled: canceled ?? this.canceled,
        ended: ended ?? this.ended,
        group: group ?? this.group,
        totalPrice: totalPrice ?? this.totalPrice,
        totalCount: totalCount ?? this.totalCount,
      );

  factory BookingReportsData.fromJson(Map<String, dynamic> json) => BookingReportsData(
    bookingReportsDataNew: json["new"] == null ? null : ReportData.fromJson(json["new"]),
    booked: json["booked"] == null ? null : ReportData.fromJson(json["booked"]),
    progress: json["progress"] == null ? null : ReportData.fromJson(json["progress"]),
    canceled: json["canceled"] == null ? null : ReportData.fromJson(json["canceled"]),
    ended: json["ended"] == null ? null : ReportData.fromJson(json["ended"]),
    group: json["group"] == null ? null : GroupBooking.fromJson(json["group"]),
    totalCount: json["total_count"],
    totalPrice: json["total_price"],
  );

  Map<String, dynamic> toJson() => {
    "new": bookingReportsDataNew?.toJson(),
    "booked": booked?.toJson(),
    "progress": progress?.toJson(),
    "canceled": canceled?.toJson(),
    "ended": ended?.toJson(),
    "group": group?.toJson(),
    "total_count": totalCount,
    "total_price": totalPrice,
  };
}

class ReportData {
  num? count;
  double? percent;
  num? totalPrice;

  ReportData({
    this.count,
    this.percent,
    this.totalPrice,
  });

  ReportData copyWith({
    int? count,
    double? percent,
    int? totalPrice,
  }) =>
      ReportData(
        count: count ?? this.count,
        percent: percent ?? this.percent,
        totalPrice: totalPrice ?? this.totalPrice,
      );

  factory ReportData.fromJson(Map<String, dynamic> json) => ReportData(
    count: json["count"],
    percent: json["percent"]?.toDouble(),
    totalPrice: json["total_price"],
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "percent": percent,
    "total_price": totalPrice,
  };
}

class GroupBooking {
  ReportData? active;
  ReportData? ended;

  GroupBooking({
    this.active,
    this.ended,
  });

  GroupBooking copyWith({
    ReportData? active,
    ReportData? ended,
  }) =>
      GroupBooking(
        active: active ?? this.active,
        ended: ended ?? this.ended,
      );

  factory GroupBooking.fromJson(Map<String, dynamic> json) => GroupBooking(
    active: json["active"] == null ? null : ReportData.fromJson(json["active"]),
    ended: json["ended"] == null ? null : ReportData.fromJson(json["ended"]),
  );

  Map<String, dynamic> toJson() => {
    "active": active?.toJson(),
    "ended": ended?.toJson(),
  };
}





