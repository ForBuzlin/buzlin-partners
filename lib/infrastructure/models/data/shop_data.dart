import 'package:venderuzmart/infrastructure/models/data/user_data.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'shop_location_data.dart';
import 'subscriptions_data.dart';
import 'location_data.dart';
import 'translation.dart';
import 'product_data.dart';
import 'working_day.dart';

class ShopData {
  int? id;
  String? uuid;
  dynamic discountsCount;
  int? userId;
  num? tax;
  int? percentage;
  String? phone;
  bool? open;
  bool? visibility;
  bool? verify;
  String? backgroundImg;
  String? logoImg;
  num? minAmount;
  int? deliveryType;
  String? status;
  String? statusNote;
  DeliveryTime? deliveryTime;
  String? inviteLink;
  LocationData? latLong;
  int? rCount;
  double? rAvg;
  int? rSum;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? productsCount;
  Translation? translation;
  List<Translation>? translations;
  List<String>? locales;
  UserData? seller;
  SubscriptionData? subscription;
  dynamic bonus;
  List<Discount>? discounts;
  List<dynamic>? shopPayments;
  List<dynamic>? socials;
  List<WorkingDay>? shopWorkingDays;
  List<dynamic>? shopClosedDate;
  List<ShopLocationData>? locations;

  ShopData({
    this.id,
    this.uuid,
    this.discountsCount,
    this.deliveryType,
    this.userId,
    this.tax,
    this.percentage,
    this.phone,
    this.open,
    this.visibility,
    this.verify,
    this.backgroundImg,
    this.logoImg,
    this.minAmount,
    this.status,
    this.statusNote,
    this.deliveryTime,
    this.inviteLink,
    this.latLong,
    this.rCount,
    this.rAvg,
    this.rSum,
    this.createdAt,
    this.updatedAt,
    this.productsCount,
    this.translation,
    this.translations,
    this.locales,
    this.seller,
    this.subscription,
    this.bonus,
    this.discounts,
    this.shopPayments,
    this.socials,
    this.shopWorkingDays,
    this.shopClosedDate,
    this.locations,
  });

  ShopData copyWith({
    int? id,
    String? uuid,
    dynamic discountsCount,
    int? userId,
    num? tax,
    int? percentage,
    int? deliveryType,
    String? phone,
    bool? open,
    bool? visibility,
    bool? verify,
    String? backgroundImg,
    String? logoImg,
    int? minAmount,
    String? status,
    String? statusNote,
    DeliveryTime? deliveryTime,
    String? inviteLink,
    LocationData? latLong,
    int? rCount,
    double? rAvg,
    int? rSum,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? productsCount,
    Translation? translation,
    List<Translation>? translations,
    List<String>? locales,
    UserData? seller,
    SubscriptionData? subscription,
    dynamic bonus,
    List<Discount>? discounts,
    List<dynamic>? shopPayments,
    List<dynamic>? socials,
    List<WorkingDay>? shopWorkingDays,
    List<dynamic>? shopClosedDate,
    List<ShopLocationData>? locations,
  }) =>
      ShopData(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        discountsCount: discountsCount ?? this.discountsCount,
        userId: userId ?? this.userId,
        tax: tax ?? this.tax,
        percentage: percentage ?? this.percentage,
        phone: phone ?? this.phone,
        open: open ?? this.open,
        visibility: visibility ?? this.visibility,
        verify: verify ?? this.verify,
        backgroundImg: backgroundImg ?? this.backgroundImg,
        logoImg: logoImg ?? this.logoImg,
        minAmount: minAmount ?? this.minAmount,
        status: status ?? this.status,
        statusNote: statusNote ?? this.statusNote,
        deliveryTime: deliveryTime ?? this.deliveryTime,
        inviteLink: inviteLink ?? this.inviteLink,
        latLong: latLong ?? this.latLong,
        rCount: rCount ?? this.rCount,
        rAvg: rAvg ?? this.rAvg,
        rSum: rSum ?? this.rSum,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        productsCount: productsCount ?? this.productsCount,
        translation: translation ?? this.translation,
        translations: translations ?? this.translations,
        locales: locales ?? this.locales,
        seller: seller ?? this.seller,
        subscription: subscription ?? this.subscription,
        bonus: bonus ?? this.bonus,
        discounts: discounts ?? this.discounts,
        shopPayments: shopPayments ?? this.shopPayments,
        socials: socials ?? this.socials,
        shopWorkingDays: shopWorkingDays ?? this.shopWorkingDays,
        shopClosedDate: shopClosedDate ?? this.shopClosedDate,
        locations: locations ?? this.locations,
        deliveryType: deliveryType ?? this.deliveryType,
      );

  factory ShopData.fromJson(Map<String, dynamic> json) => ShopData(
        id: json["id"],
        uuid: json["uuid"],
        discountsCount: json["discounts_count"],
        userId: json["user_id"],
        tax: json["tax"],
        percentage: json["percentage"],
        phone: json["phone"],
        open: json["open"],
    deliveryType: json["delivery_type"],
        visibility: json["visibility"],
        verify: json["verify"],
        backgroundImg: json["background_img"],
        logoImg: json["logo_img"],
        minAmount: json["min_amount"],
        status: json["status"],
        statusNote: json["status_note"],
        deliveryTime: json["delivery_time"] == null
            ? null
            : DeliveryTime.fromJson(json["delivery_time"]),
        inviteLink: json["invite_link"],
        latLong: json["lat_long"] == null
            ? null
            : LocationData.fromJson(json["lat_long"]),
        rCount: json["r_count"],
        rAvg: json["r_avg"]?.toDouble(),
        rSum: json["r_sum"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.tryParse(json["created_at"])?.toLocal(),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.tryParse(json["updated_at"])?.toLocal(),
        productsCount: json["products_count"],
        translation: json["translation"] == null
            ? null
            : Translation.fromJson(json["translation"]),
        translations: json["translations"] == null
            ? []
            : List<Translation>.from(
                json["translations"]!.map((x) => Translation.fromJson(x))),
        locales: json["locales"] == null
            ? []
            : List<String>.from(json["locales"]!.map((x) => x)),
        seller: json["seller"] == null ? null : UserData.fromJson(json["seller"]),
        subscription: json["subscription"] == null
            ? null
            : SubscriptionData?.fromJson(json["subscription"]),
        bonus: json["bonus"],
        discounts: json["discounts"] == null
            ? []
            : List<Discount>.from(
                json["discounts"]!.map((x) => Discount.fromJson(x))),
        shopPayments: json["shop_payments"] == null
            ? []
            : List<dynamic>.from(json["shop_payments"]!.map((x) => x)),
        socials: json["socials"] == null
            ? []
            : List<dynamic>.from(json["socials"]!.map((x) => x)),
        shopWorkingDays: json["shop_working_days"] == null
            ? []
            : List<WorkingDay>.from(json["shop_working_days"]!
                .map((x) => WorkingDay.fromJson(x))),
        shopClosedDate: json["shop_closed_date"] == null
            ? []
            : List<dynamic>.from(json["shop_closed_date"]!.map((x) => x)),
        locations: json["locations"] == null
            ? []
            : List<ShopLocationData>.from(
                json["locations"]!.map((x) => ShopLocationData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "discounts_count": discountsCount,
        "user_id": userId,
        "tax": tax,
        "delivery_type": deliveryType,
        "percentage": percentage,
        "phone": phone,
        "open": open,
        "visibility": visibility,
        "verify": verify,
        "background_img": backgroundImg,
        "logo_img": logoImg,
        "min_amount": minAmount,
        "status": status,
        "status_note": statusNote,
        "delivery_time": deliveryTime?.toJson(),
        "invite_link": inviteLink,
        "lat_long": latLong?.toJson(),
        "r_count": rCount,
        "r_avg": rAvg,
        "r_sum": rSum,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "products_count": productsCount,
        "translation": translation?.toJson(),
        "translations": translations == null
            ? []
            : List<dynamic>.from(translations!.map((x) => x.toJson())),
        "locales":
            locales == null ? [] : List<dynamic>.from(locales!.map((x) => x)),
        "seller": seller?.toJson(),
        "subscription": subscription?.toJson(),
        "bonus": bonus,
        "discounts": discounts == null
            ? []
            : List<dynamic>.from(discounts!.map((x) => x.toJson())),
        "shop_payments": shopPayments == null
            ? []
            : List<dynamic>.from(shopPayments!.map((x) => x)),
        "socials":
            socials == null ? [] : List<dynamic>.from(socials!.map((x) => x)),
        "shop_working_days": shopWorkingDays == null
            ? []
            : List<dynamic>.from(shopWorkingDays!.map((x) => x.toJson())),
        "shop_closed_date": shopClosedDate == null
            ? []
            : List<dynamic>.from(shopClosedDate!.map((x) => x)),
        "locations": locations == null
            ? []
            : List<dynamic>.from(locations!.map((x) => x.toJson())),
      };
}

class DeliveryTime {
  String? to;
  String? from;
  String? type;

  DeliveryTime({
    this.to,
    this.from,
    this.type,
  });

  DeliveryTime copyWith({
    String? to,
    String? from,
    String? type,
  }) =>
      DeliveryTime(
        to: to ?? this.to,
        from: from ?? this.from,
        type: type ?? this.type,
      );

  factory DeliveryTime.fromJson(Map<String, dynamic> json) => DeliveryTime(
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

class Discount {
  int? id;
  int? shopId;
  DateTime? end;
  bool? active;

  Discount({
    this.id,
    this.shopId,
    this.end,
    this.active,
  });

  Discount copyWith({
    int? id,
    int? shopId,
    DateTime? end,
    bool? active,
  }) =>
      Discount(
        id: id ?? this.id,
        shopId: shopId ?? this.shopId,
        end: end ?? this.end,
        active: active ?? this.active,
      );

  factory Discount.fromJson(Map<String, dynamic> json) => Discount(
        id: json["id"],
        shopId: json["shop_id"],
        end: json["end"] == null ? null : DateTime.parse(json["end"]),
        active: json["active"].toString().toBool(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "shop_id": shopId,
        "end":
            "${end!.year.toString().padLeft(4, '0')}-${end!.month.toString().padLeft(2, '0')}-${end!.day.toString().padLeft(2, '0')}",
        "active": active,
      };
}

class BonusStock {
  BonusStock({
    int? id,
    int? countableId,
    num? price,
    int? quantity,
    num? tax,
    num? totalPrice,
    ProductData? product,
  }) {
    _id = id;
    _countableId = countableId;
    _price = price;
    _quantity = quantity;
    _tax = tax;
    _totalPrice = totalPrice;
    _product = product;
  }

  BonusStock.fromJson(dynamic json) {
    _id = json['id'];
    _countableId = json['countable_id'];
    _price = json['price'];
    _quantity = json['quantity'];
    _tax = json['tax'];
    _totalPrice = json['total_price'];
    _product =
        json['product'] != null ? ProductData.fromJson(json['product']) : null;
  }

  int? _id;
  int? _countableId;
  num? _price;
  int? _quantity;
  num? _tax;
  num? _totalPrice;
  ProductData? _product;

  BonusStock copyWith({
    int? id,
    int? countableId,
    num? price,
    int? quantity,
    num? tax,
    num? totalPrice,
    ProductData? product,
  }) =>
      BonusStock(
        id: id ?? _id,
        countableId: countableId ?? _countableId,
        price: price ?? _price,
        quantity: quantity ?? _quantity,
        tax: tax ?? _tax,
        totalPrice: totalPrice ?? _totalPrice,
        product: product ?? _product,
      );

  int? get id => _id;

  int? get countableId => _countableId;

  num? get price => _price;

  int? get quantity => _quantity;

  num? get tax => _tax;

  num? get totalPrice => _totalPrice;

  ProductData? get product => _product;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['countable_id'] = _countableId;
    map['price'] = _price;
    map['quantity'] = _quantity;
    map['tax'] = _tax;
    map['total_price'] = _totalPrice;
    if (_product != null) {
      map['product'] = _product?.toJson();
    }
    return map;
  }
}
