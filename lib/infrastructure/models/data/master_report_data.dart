
class MasterReportData {
  int? id;
  String? firstname;
  String? lastname;
  int? rAvg;
  int? count;
  int? processCount;
  int? processPrice;
  int? endedCount;
  int? endedPrice;
  int? canceledCount;
  int? canceledPrice;

  MasterReportData({
    this.id,
    this.firstname,
    this.lastname,
    this.rAvg,
    this.count,
    this.processCount,
    this.processPrice,
    this.endedCount,
    this.endedPrice,
    this.canceledCount,
    this.canceledPrice,
  });

  MasterReportData copyWith({
    int? id,
    String? firstname,
    String? lastname,
    int? rAvg,
    int? count,
    int? processCount,
    int? processPrice,
    int? endedCount,
    int? endedPrice,
    int? canceledCount,
    int? canceledPrice,
  }) =>
      MasterReportData(
        id: id ?? this.id,
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
        rAvg: rAvg ?? this.rAvg,
        count: count ?? this.count,
        processCount: processCount ?? this.processCount,
        processPrice: processPrice ?? this.processPrice,
        endedCount: endedCount ?? this.endedCount,
        endedPrice: endedPrice ?? this.endedPrice,
        canceledCount: canceledCount ?? this.canceledCount,
        canceledPrice: canceledPrice ?? this.canceledPrice,
      );

  factory MasterReportData.fromJson(Map<String, dynamic> json) => MasterReportData(
    id: json["id"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    rAvg: json["r_avg"],
    count: json["count"],
    processCount: json["process_count"],
    processPrice: json["process_price"],
    endedCount: json["ended_count"],
    endedPrice: json["ended_price"],
    canceledCount: json["canceled_count"],
    canceledPrice: json["canceled_price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstname": firstname,
    "lastname": lastname,
    "r_avg": rAvg,
    "count": count,
    "process_count": processCount,
    "process_price": processPrice,
    "ended_count": endedCount,
    "ended_price": endedPrice,
    "canceled_count": canceledCount,
    "canceled_price": canceledPrice,
  };
}


