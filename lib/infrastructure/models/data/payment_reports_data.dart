List<PaymentReportData> paymentReportsFromJson(List str) => List<PaymentReportData>.from(str.map((x) => PaymentReportData.fromJson(x)));

List paymentReportsToJson(List<PaymentReportData> data) => List<dynamic>.from(data.map((x) => x.toJson()));

class PaymentReportData {
  int? paymentSysId;
  num? totalPrice;
  num? progressPrice;
  num? paidPrice;
  num? canceledPrice;
  num? rejectedPrice;
  num? refundPrice;
  String? paymentName;

  PaymentReportData({
    this.paymentSysId,
    this.totalPrice,
    this.progressPrice,
    this.paidPrice,
    this.canceledPrice,
    this.rejectedPrice,
    this.refundPrice,
    this.paymentName,
  });

  PaymentReportData copyWith({
    int? paymentSysId,
    num? totalPrice,
    num? progressPrice,
    num? paidPrice,
    num? canceledPrice,
    num? rejectedPrice,
    num? refundPrice,
    String? paymentName,
  }) =>
      PaymentReportData(
        paymentSysId: paymentSysId ?? this.paymentSysId,
        totalPrice: totalPrice ?? this.totalPrice,
        progressPrice: progressPrice ?? this.progressPrice,
        paidPrice: paidPrice ?? this.paidPrice,
        canceledPrice: canceledPrice ?? this.canceledPrice,
        rejectedPrice: rejectedPrice ?? this.rejectedPrice,
        refundPrice: refundPrice ?? this.refundPrice,
        paymentName: paymentName ?? this.paymentName,
      );

  factory PaymentReportData.fromJson(Map<String, dynamic> json) => PaymentReportData(
    paymentSysId: json["payment_sys_id"],
    totalPrice: json["total_price"],
    progressPrice: json["progress_price"],
    paidPrice: json["paid_price"],
    canceledPrice: json["canceled_price"],
    rejectedPrice: json["rejected_price"],
    refundPrice: json["refund_price"],
    paymentName: json["payment_name"],
  );

  Map<String, dynamic> toJson() => {
    "payment_sys_id": paymentSysId,
    "total_rice": totalPrice,
    "progress_price": progressPrice,
    "paid_price": paidPrice,
    "canceled_price": canceledPrice,
    "rejected_price": rejectedPrice,
    "refund_price": refundPrice,
    "payment_name": paymentName,
  };
}
