import 'coupon_data.dart';

import 'stock.dart';

class PriceData {
  List<Stocks>? stocks;
  num? totalTax;
  num? price;
  num? totalPrice;
  num? serviceFee;
  num? totalDiscount;
  num? deliveryFee;
  num? rate;
  List<CouponData>? coupon;
  num? couponPrice;

  PriceData({
    this.stocks,
    this.totalTax,
    this.price,
    this.totalPrice,
    this.serviceFee,
    this.totalDiscount,
    this.deliveryFee,
    this.rate,
    this.coupon,
    this.couponPrice,
  });

  PriceData copyWith({
    List<Stocks>? stocks,
    num? totalTax,
    num? price,
    num? totalPrice,
    num? serviceFee,
    num? totalDiscount,
    num? deliveryFee,
    num? rate,
    List<CouponData>? coupon,
    num? couponPrice,
  }) =>
      PriceData(
        stocks: stocks ?? this.stocks,
        totalTax: totalTax ?? this.totalTax,
        price: price ?? this.price,
        totalPrice: totalPrice ?? this.totalPrice,
        serviceFee: serviceFee ?? this.serviceFee,
        totalDiscount: totalDiscount ?? this.totalDiscount,
        deliveryFee: deliveryFee ?? this.deliveryFee,
        rate: rate ?? this.rate,
        coupon: coupon ?? this.coupon,
        couponPrice: couponPrice ?? this.couponPrice,
      );

  factory PriceData.fromJson(Map<String, dynamic> json) => PriceData(
        stocks: json["shops"][0]["stocks"] == null
            ? []
            : List<Stocks>.from(
                json["shops"][0]["stocks"]!.map((x) => Stocks.fromJson(x))),
        totalTax: json["total_tax"]?.toDouble(),
        price: json["price"],
        totalPrice: json["total_price"]?.toDouble(),
        serviceFee: json["service_fee"],
        totalDiscount: json["total_discount"],
        deliveryFee: json["delivery_fee"].isNotEmpty
            ? json["delivery_fee"][0]['price']
            : null,
        rate: num.tryParse(json["rate"].toString()),
        coupon: json["coupon"].isNotEmpty
            ? [CouponData.fromJson(json["coupon"][0]['coupon'])]
            : null,
        couponPrice:
            json["coupon"].isNotEmpty ? json["coupon"][0]['price'] : null,
      );

  Map<String, dynamic> toJson() => {
        "stocks": stocks == null
            ? []
            : List<dynamic>.from(stocks!.map((x) => x.toJson())),
        "total_tax": totalTax,
        "price": price,
        "total_price": totalPrice,
        "service_fee": serviceFee,
        "total_discount": totalDiscount,
        "delivery_fee": deliveryFee,
        "rate": rate,
        "coupon": coupon == null
            ? []
            : List<dynamic>.from(coupon!.map((x) => x.toJson())),
        "coupon_price": couponPrice,
      };
}
