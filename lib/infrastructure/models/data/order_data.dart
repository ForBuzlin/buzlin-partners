import 'package:venderuzmart/infrastructure/models/data/note_data.dart';

import 'coupon_data.dart';
import 'delivery_points_data.dart';
import 'galleries.dart';
import 'my_address.dart';
import 'stock.dart';
import 'transaction.dart';
import 'user_data.dart';
import 'currency_data.dart';

class OrderData {
  int? id;
  int? userId;
  int? deliverymanId;
  int? addressId;
  int? deliveryPriceId;
  int? currencyId;
  num? serviceFee;
  String? status;
  num? totalPrice;
  num? deliveryFee;
  num? totalTax;
  num? originPrice;
  num? totalDiscount;
  int? rate;
  int? type;
  DateTime? deliveryDate;
  String? deliveryType;
  DateTime? createdAt;
  DateTime? updatedAt;
  CouponData? coupon;
  UserData? deliveryman;
  CurrencyData? currency;
  UserData? user;
  List<Stocks>? details;
  Transaction? transaction;
  List<PointHistory>? pointHistories;
  List<dynamic>? orderRefunds;
  List<Galleries>? galleries;
  MyAddress? myAddress;
  DeliveryPointsData? deliveryPoint;
  DeliveryPointsData? deliveryPrice;
  String? note;
  List<NotesData>? notes;

  OrderData({
    this.id,
    this.userId,
    this.deliverymanId,
    this.addressId,
    this.deliveryPriceId,
    this.currencyId,
    this.serviceFee,
    this.status,
    this.totalPrice,
    this.deliveryFee,
    this.totalTax,
    this.type,
    this.originPrice,
    this.rate,
    this.totalDiscount,
    this.deliveryDate,
    this.deliveryType,
    this.createdAt,
    this.updatedAt,
    this.coupon,
    this.deliveryman,
    this.currency,
    this.user,
    this.details,
    this.transaction,
    this.pointHistories,
    this.orderRefunds,
    this.galleries,
    this.myAddress,
    this.deliveryPoint,
    this.note,
    this.deliveryPrice,
    this.notes,
  });

  OrderData copyWith({
    int? id,
    int? userId,
    int? deliverymanId,
    int? addressId,
    int? deliveryPriceId,
    int? currencyId,
    num? serviceFee,
    String? status,
    double? totalPrice,
    String? note,
    num? deliveryFee,
    int? type,
    num? totalTax,
    num? originPrice,
    num? totalDiscount,
    int? rate,
    DateTime? deliveryDate,
    String? deliveryType,
    DateTime? createdAt,
    DateTime? updatedAt,
    CouponData? coupon,
    UserData? deliveryman,
    CurrencyData? currency,
    UserData? user,
    List<Stocks>? details,
    Transaction? transaction,
    List<PointHistory>? pointHistories,
    List<dynamic>? orderRefunds,
    List<Galleries>? galleries,
    MyAddress? myAddress,
    DeliveryPointsData? deliveryPoint,
    DeliveryPointsData? deliveryPrice,
    List<NotesData>? notes,
  }) =>
      OrderData(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        deliverymanId: deliverymanId ?? this.deliverymanId,
        addressId: addressId ?? this.addressId,
        note: note ?? this.note,
        deliveryPriceId: deliveryPriceId ?? this.deliveryPriceId,
        currencyId: currencyId ?? this.currencyId,
        serviceFee: serviceFee ?? this.serviceFee,
        type: type ?? this.type,
        totalDiscount: totalDiscount ?? this.totalDiscount,
        status: status ?? this.status,
        totalPrice: totalPrice ?? this.totalPrice,
        deliveryFee: deliveryFee ?? this.deliveryFee,
        totalTax: totalTax ?? this.totalTax,
        originPrice: originPrice ?? this.originPrice,
        rate: rate ?? this.rate,
        deliveryDate: deliveryDate ?? this.deliveryDate,
        deliveryType: deliveryType ?? this.deliveryType,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        coupon: coupon ?? this.coupon,
        deliveryman: deliveryman ?? this.deliveryman,
        currency: currency ?? this.currency,
        user: user ?? this.user,
        details: details ?? this.details,
        transaction: transaction ?? this.transaction,
        pointHistories: pointHistories ?? this.pointHistories,
        orderRefunds: orderRefunds ?? this.orderRefunds,
        galleries: galleries ?? this.galleries,
        myAddress: myAddress ?? this.myAddress,
        deliveryPoint: deliveryPoint ?? this.deliveryPoint,
        deliveryPrice: deliveryPrice ?? this.deliveryPrice,
        notes: notes ?? this.notes,
      );

  factory OrderData.fromJson(Map<String, dynamic> json) => OrderData(
        id: json["id"],
        userId: json["user_id"],
        deliverymanId: json["deliveryman_id"],
        addressId: json["address_id"],
        deliveryPriceId: json["delivery_price_id"],
        currencyId: json["currency_id"],
        serviceFee: json["service_fee"],
        type: json["type"],
        status: json["status"],
        note: json["note"],
        totalDiscount: json["total_discount"],
        totalPrice: json["total_price"]?.toDouble(),
        deliveryFee: json["delivery_fee"],
        totalTax: json["total_tax"]?.toDouble(),
        originPrice: json["origin_price"],
        rate: json["rate"],
        deliveryDate: DateTime.tryParse(json["delivery_date"])?.toLocal(),
        deliveryType: json["delivery_type"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.tryParse(json["created_at"])?.toLocal(),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.tryParse(json["updated_at"])?.toLocal(),
        coupon:
            json["coupon"] == null ? null : CouponData.fromJson(json["coupon"]),
        deliveryman: json["deliveryman"] == null
            ? null
            : UserData.fromJson(json["deliveryman"]),
        currency: json["currency"] == null
            ? null
            : CurrencyData.fromJson(json["currency"]),
        user: json["user"] == null ? null : UserData.fromJson(json["user"]),
        details: json["details"] == null
            ? []
            : List<Stocks>.from(
                json["details"]!.map((x) => Stocks.fromJson(x))),
        notes: json["notes"] == null
            ? []
            : List<NotesData>.from(
                json["notes"]!.map((x) => NotesData.fromJson(x))),
        transaction: json["transaction"] == null
            ? null
            : Transaction.fromJson(json["transaction"]),
        pointHistories: json["point_histories"] == null
            ? []
            : List<PointHistory>.from(
                json["point_histories"]!.map((x) => PointHistory.fromJson(x))),
        orderRefunds: json["order_refunds"] == null
            ? []
            : List<dynamic>.from(json["order_refunds"]!.map((x) => x)),
        galleries: json["galleries"] == null
            ? []
            : List<Galleries>.from(json["galleries"]!.map((x) => x)),
        myAddress: json['my_address'] != null
            ? MyAddress.fromJson(json['my_address'])
            : json['address'] != null
                ? MyAddress.fromJson(json['address'])
                : null,
        deliveryPoint: json["delivery_point"] == null
            ? null
            : DeliveryPointsData.fromJson(json["delivery_point"]),
        deliveryPrice: json["delivery_price"] == null
            ? null
            : DeliveryPointsData.fromJson(json["delivery_price"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "deliveryman_id": deliverymanId,
        "address_id": addressId,
        "delivery_price_id": deliveryPriceId,
        "currency_id": currencyId,
        "service_fee": serviceFee,
        "status": status,
        "type": type,
        "total_price": totalPrice,
        "delivery_fee": deliveryFee,
        "total_tax": totalTax,
        "origin_price": originPrice,
        "rate": rate,
        "note": note,
        "total_discount": totalDiscount,
        "delivery_date": deliveryDate?.toIso8601String(),
        "delivery_type": deliveryType,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "coupon": coupon,
        "deliveryman": deliveryman?.toJson(),
        "currency": currency?.toJson(),
        "user": user?.toJson(),
        "details": details == null
            ? []
            : List<dynamic>.from(details!.map((x) => x.toJson())),
        "notes": notes == null
            ? []
            : List<dynamic>.from(notes!.map((x) => x.toJson())),
        "transaction": transaction?.toJson(),
        "point_histories": pointHistories == null
            ? []
            : List<dynamic>.from(pointHistories!.map((x) => x.toJson())),
        "order_refunds": orderRefunds == null
            ? []
            : List<dynamic>.from(orderRefunds!.map((x) => x)),
        "galleries": galleries == null
            ? []
            : List<dynamic>.from(galleries!.map((x) => x)),
        "my_address": myAddress?.toJson(),
        "delivery_point": deliveryPoint?.toJson(),
        "delivery_price": deliveryPrice?.toJson(),
      };
}

class PointHistory {
  int? id;
  dynamic type;
  double? price;
  dynamic value;
  bool? active;
  DateTime? createdAt;
  DateTime? updatedAt;

  PointHistory({
    this.id,
    this.type,
    this.price,
    this.value,
    this.active,
    this.createdAt,
    this.updatedAt,
  });

  PointHistory copyWith({
    int? id,
    dynamic type,
    double? price,
    dynamic value,
    bool? active,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      PointHistory(
        id: id ?? this.id,
        type: type ?? this.type,
        price: price ?? this.price,
        value: value ?? this.value,
        active: active ?? this.active,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory PointHistory.fromJson(Map<String, dynamic> json) => PointHistory(
        id: json["id"],
        type: json["type"],
        price: json["price"]?.toDouble(),
        value: json["value"],
        active: json["active"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.tryParse(json["created_at"])?.toLocal(),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.tryParse(json["updated_at"])?.toLocal(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "price": price,
        "value": value,
        "active": active,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
