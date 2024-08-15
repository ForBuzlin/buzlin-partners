import 'location_data.dart';
import 'user_data.dart';

class NotificationTransactionData {
  int? id;
  int? payableId;
  double? price;
  dynamic paymentTrxId;
  String? note;
  DateTime? performTime;
  String? status;
  String? statusDescription;
  DateTime? createdAt;
  DateTime? updatedAt;
  UserData? user;
  PaymentSystem? paymentSystem;
  Payable? payable;

  NotificationTransactionData({
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
    this.user,
    this.paymentSystem,
    this.payable,
  });

  NotificationTransactionData copyWith({
    int? id,
    int? payableId,
    double? price,
    dynamic paymentTrxId,
    String? note,
    DateTime? performTime,
    String? status,
    String? statusDescription,
    DateTime? createdAt,
    DateTime? updatedAt,
    UserData? user,
    PaymentSystem? paymentSystem,
    Payable? payable,
  }) =>
      NotificationTransactionData(
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
        user: user ?? this.user,
        paymentSystem: paymentSystem ?? this.paymentSystem,
        payable: payable ?? this.payable,
      );

  factory NotificationTransactionData.fromJson(Map<String, dynamic> json) =>
      NotificationTransactionData(
        id: json["id"],
        payableId: json["payable_id"],
        price: json["price"]?.toDouble(),
        paymentTrxId: json["payment_trx_id"],
        note: json["note"],
        performTime: json["perform_time"] == null
            ? null
            : DateTime.tryParse(json["perform_time"])?.toLocal(),
        status: json["status"],
        statusDescription: json["status_description"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.tryParse(json["created_at"])?.toLocal(),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.tryParse(json["updated_at"])?.toLocal(),
        user: json["user"] == null ? null : UserData.fromJson(json["user"]),
        paymentSystem: json["payment_system"] == null
            ? null
            : PaymentSystem.fromJson(json["payment_system"]),
        payable:
            json["payable"] == null ? null : Payable.fromJson(json["payable"]),
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
        "user": user?.toJson(),
        "payment_system": paymentSystem?.toJson(),
        "payable": payable?.toJson(),
      };
}

class Payable {
  int? id;
  int? userId;
  double? totalPrice;
  double? originPrice;
  int? rate;
  double? tax;
  double? commissionFee;
  String? status;
  LocationData? location;
  Address? address;
  String? deliveryType;
  DateTime? deliveryDate;
  String? deliveryTime;
  bool? current;
  DateTime? createdAt;
  DateTime? updatedAt;
  double? deliveryFee;

  Payable({
    this.id,
    this.userId,
    this.totalPrice,
    this.originPrice,
    this.rate,
    this.tax,
    this.commissionFee,
    this.status,
    this.location,
    this.address,
    this.deliveryType,
    this.deliveryDate,
    this.deliveryTime,
    this.current,
    this.createdAt,
    this.updatedAt,
    this.deliveryFee,
  });

  Payable copyWith({
    int? id,
    int? userId,
    double? totalPrice,
    double? originPrice,
    int? rate,
    double? tax,
    double? commissionFee,
    String? status,
    LocationData? location,
    Address? address,
    String? deliveryType,
    DateTime? deliveryDate,
    String? deliveryTime,
    bool? current,
    DateTime? createdAt,
    DateTime? updatedAt,
    double? deliveryFee,
  }) =>
      Payable(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        totalPrice: totalPrice ?? this.totalPrice,
        originPrice: originPrice ?? this.originPrice,
        rate: rate ?? this.rate,
        tax: tax ?? this.tax,
        commissionFee: commissionFee ?? this.commissionFee,
        status: status ?? this.status,
        location: location ?? this.location,
        address: address ?? this.address,
        deliveryType: deliveryType ?? this.deliveryType,
        deliveryDate: deliveryDate ?? this.deliveryDate,
        deliveryTime: deliveryTime ?? this.deliveryTime,
        current: current ?? this.current,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deliveryFee: deliveryFee ?? this.deliveryFee,
      );

  factory Payable.fromJson(Map<String, dynamic> json) => Payable(
        id: json["id"],
        userId: json["user_id"],
        totalPrice: json["total_price"]?.toDouble(),
        originPrice: json["origin_price"]?.toDouble(),
        rate: json["rate"],
        tax: json["tax"]?.toDouble(),
        commissionFee: json["commission_fee"]?.toDouble(),
        status: json["status"],
        location: json["location"] == null
            ? null
            : LocationData.fromJson(json["location"]),
        address:
            json["address"] == null ? null : Address.fromJson(json["address"]),
        deliveryType: json["delivery_type"],
        deliveryDate: json["delivery_date"] == null
            ? null
            : DateTime.tryParse(json["delivery_date"])?.toLocal(),
        deliveryTime: json["delivery_time"],
        current: json["current"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.tryParse(json["created_at"])?.toLocal(),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.tryParse(json["updated_at"])?.toLocal(),
        deliveryFee: json["delivery_fee"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "total_price": totalPrice,
        "origin_price": originPrice,
        "rate": rate,
        "tax": tax,
        "commission_fee": commissionFee,
        "status": status,
        "location": location?.toJson(),
        "address": address?.toJson(),
        "delivery_type": deliveryType,
        "delivery_date":
            "${deliveryDate!.year.toString().padLeft(4, '0')}-${deliveryDate!.month.toString().padLeft(2, '0')}-${deliveryDate!.day.toString().padLeft(2, '0')}",
        "delivery_time": deliveryTime,
        "current": current,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "delivery_fee": deliveryFee,
      };
}

class Address {
  String? floor;
  String? house;
  String? office;
  String? address;

  Address({
    this.floor,
    this.house,
    this.office,
    this.address,
  });

  Address copyWith({
    String? floor,
    String? house,
    String? office,
    String? address,
  }) =>
      Address(
        floor: floor ?? this.floor,
        house: house ?? this.house,
        office: office ?? this.office,
        address: address ?? this.address,
      );

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        floor: json["floor"],
        house: json["house"],
        office: json["office"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "floor": floor,
        "house": house,
        "office": office,
        "address": address,
      };
}

class PaymentSystem {
  int? id;
  String? tag;
  bool? active;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? input;

  PaymentSystem({
    this.id,
    this.tag,
    this.active,
    this.createdAt,
    this.updatedAt,
    this.input,
  });

  PaymentSystem copyWith({
    int? id,
    String? tag,
    bool? active,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? input,
  }) =>
      PaymentSystem(
        id: id ?? this.id,
        tag: tag ?? this.tag,
        active: active ?? this.active,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        input: input ?? this.input,
      );

  factory PaymentSystem.fromJson(Map<String, dynamic> json) => PaymentSystem(
        id: json["id"],
        tag: json["tag"],
        active: json["active"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.tryParse(json["created_at"])?.toLocal(),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.tryParse(json["updated_at"])?.toLocal(),
        input: json["input"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tag": tag,
        "active": active,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "input": input,
      };
}
