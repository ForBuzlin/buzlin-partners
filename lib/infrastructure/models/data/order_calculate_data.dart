import 'stock.dart';

class OrderCalculate {
  bool? status;
  String? code;
  OrderCalculateDetail? data;

  OrderCalculate({this.status, this.code, this.data});

  OrderCalculate.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    data = json['data'] != null
        ? OrderCalculateDetail.fromJson(json['data']["data"])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['code'] = code;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class OrderCalculateDetail {
  List<Stocks>? stocks;
  num? totalTax;
  num? price;
  num? totalShopTax;
  num? totalPrice;
  num? totalDiscount;
  num? deliveryFee;
  num? serviceFee;
  num? rate;
  num? couponPrice;

  OrderCalculateDetail({
    this.stocks,
    this.totalTax,
    this.price,
    this.totalShopTax,
    this.totalPrice,
    this.totalDiscount,
    this.deliveryFee,
    this.rate,
    this.serviceFee,
    this.couponPrice,
  });

  OrderCalculateDetail.fromJson(Map<String, dynamic> json) {
    totalTax = json['total_tax'];
    price = json['price'];
    totalShopTax = json['total_shop_tax'];
    totalPrice = json['total_price'];
    serviceFee = json['service_fee'];
    totalDiscount = json['total_discount'];
    deliveryFee = json['delivery_fee'];
    rate = json['rate'];
    couponPrice = json['coupon_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (stocks != null) {
      data['stocks'] = stocks!.map((v) => v.toJson()).toList();
    }
    data['total_tax'] = totalTax;
    data['price'] = price;
    data['service_fee'] = serviceFee;
    data['total_shop_tax'] = totalShopTax;
    data['total_price'] = totalPrice;
    data['total_discount'] = totalDiscount;
    data['delivery_fee'] = deliveryFee;
    data['rate'] = rate;
    data['coupon_price'] = couponPrice;
    return data;
  }
}
