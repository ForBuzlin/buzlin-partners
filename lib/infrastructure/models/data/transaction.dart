import 'payment_data.dart';

class Transaction {
  int? id;
  int? payableId;
  num? price;
  String? paymentTrxId;
  String? note;
  DateTime? performTime;
  String? status;
  String? statusDescription;
  DateTime? createdAt;
  DateTime? updatedAt;
  PaymentData? paymentSystem;

  Transaction({
    this.id,
    this.payableId,
    this.price,
    this.paymentTrxId,
    this.note,
    this.performTime,
    this.status,
    this.statusDescription,
    this.createdAt,
    this.updatedAt,
    this.paymentSystem,
  });

  Transaction copyWith({
    int? id,
    int? payableId,
    num? price,
    String? paymentTrxId,
    String? note,
    DateTime? performTime,
    String? status,
    String? statusDescription,
    DateTime? createdAt,
    DateTime? updatedAt,
    PaymentData? paymentSystem,
  }) =>
      Transaction(
        id: id ?? this.id,
        payableId: payableId ?? this.payableId,
        price: price ?? this.price,
        paymentTrxId: paymentTrxId ?? this.paymentTrxId,
        note: note ?? this.note,
        performTime: performTime ?? this.performTime,
        status: status ?? this.status,
        statusDescription: statusDescription ?? this.statusDescription,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        paymentSystem: paymentSystem ?? this.paymentSystem,
      );

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        id: json["id"],
        payableId: json["payable_id"],
        price: json["price"],
        paymentTrxId: json["payment_trx_id"],
        note: json["note"],
        performTime: json["perform_time"] == null
            ? null
            : DateTime.parse(json["perform_time"]),
        status: json["status"],
        statusDescription: json["status_description"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.tryParse(json["created_at"])?.toLocal(),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.tryParse(json["updated_at"])?.toLocal(),
        paymentSystem: json["payment_system"] == null
            ? null
            : PaymentData.fromJson(json["payment_system"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "payable_id": payableId,
        "price": price,
        "payment_trx_id": paymentTrxId,
        "note": note,
        "perform_time": performTime?.toIso8601String(),
        "status": status,
        "status_description": statusDescription,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "payment_system": paymentSystem?.toJson(),
      };
}
