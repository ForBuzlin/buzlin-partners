

import 'coupon_data.dart';
import 'currency_data.dart';
import 'my_address.dart';
import 'payment_data.dart';
import 'pickup_address.dart';
import 'user_data.dart';

class BagData {
  BagData({
    int? index,
    UserData? selectedUser,
    MyAddress? deliveryAddress,
    PickupAddress? pickupAddress,
    CurrencyData? selectedCurrency,
    PaymentData? selectedPayment,
    CouponData? coupon,
    String? phone,
    List<BagProductData>? bagProducts,
  }) {
    _index = index;
    _selectedUser = selectedUser;
    _deliveryAddress = deliveryAddress;
    _selectedCurrency = selectedCurrency;
    _selectedPayment = selectedPayment;
    _bagProducts = bagProducts;
    _coupon = coupon;
    _phone = phone;
    _pickupAddress = pickupAddress;
  }

  BagData.fromJson(dynamic json) {
    _index = json['index'];
    _phone = json['phone'];
    _selectedUser = json['selected_user'] != null
        ? UserData.fromJson(json['selected_user'])
        : null;
    _deliveryAddress = json['delivery_address'] != null
        ? MyAddress.fromJson(json['delivery_address'])
        : null;
    _selectedCurrency = json['selected_currency'] != null
        ? CurrencyData.fromJson(json['selected_currency'])
        : null;
    _coupon =
        json['coupon'] != null ? CouponData.fromJson(json['coupon']) : null;
    _selectedPayment = json['selected_payment'] != null
        ? PaymentData.fromJson(json['selected_payment'])
        : null;
    _pickupAddress = json['pickup_address'] != null
        ? PickupAddress.fromJson(json['pickup_address'])
        : null;
    if (json['bag_products'] != null) {
      _bagProducts = [];
      json['bag_products'].forEach((v) {
        _bagProducts?.add(BagProductData.fromJson(v));
      });
    }
  }

  int? _index;
  String? _phone;
  CouponData? _coupon;
  UserData? _selectedUser;
  MyAddress? _deliveryAddress;
  CurrencyData? _selectedCurrency;
  PaymentData? _selectedPayment;
  List<BagProductData>? _bagProducts;
  PickupAddress? _pickupAddress;

  BagData copyWith({
    int? index,
    String? phone,
    UserData? selectedUser,
    MyAddress? deliveryAddress,
    CurrencyData? selectedCurrency,
    PaymentData? selectedPayment,
    CouponData? coupon,
    List<BagProductData>? bagProducts,
    PickupAddress? pickupAddress,
  }) {
    return BagData(
      index: index ?? _index,
      phone: phone ?? _phone,
      coupon: coupon ?? _coupon,
      selectedUser: selectedUser,
      deliveryAddress: deliveryAddress ?? _deliveryAddress,
      selectedCurrency: selectedCurrency ?? _selectedCurrency,
      selectedPayment: selectedPayment ?? _selectedPayment,
      bagProducts: bagProducts ?? _bagProducts,
      pickupAddress: pickupAddress ?? _pickupAddress,
    );
  }

  int? get index => _index;

  String? get phone => _phone;

  CouponData? get coupon => _coupon;

  UserData? get selectedUser => _selectedUser;

  PickupAddress? get pickupAddress => _pickupAddress;

  MyAddress? get deliveryAddress => _deliveryAddress;

  CurrencyData? get selectedCurrency => _selectedCurrency;

  PaymentData? get selectedPayment => _selectedPayment;

  List<BagProductData>? get bagProducts => _bagProducts;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['index'] = _index;
    map['phone'] = _phone;
    if (_selectedUser != null) {
      map['selected_user'] = _selectedUser?.toJson();
    }
    if (_coupon != null) {
      map['coupon'] = _coupon?.toJson();
    }
    if (_deliveryAddress != null) {
      map['delivery_address'] = _deliveryAddress?.toJson();
    }
    if (_selectedCurrency != null) {
      map['selected_currency'] = _selectedCurrency?.toJson();
    }
    if (_selectedPayment != null) {
      map['selected_payment'] = _selectedPayment?.toJson();
    }
    if (_pickupAddress != null) {
      map['pickup_address'] = _pickupAddress?.toJson();
    }
    if (_bagProducts != null) {
      map['bag_products'] = _bagProducts?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class BagProductData {
  final int? stockId;
  final int? parentId;
  final int? quantity;
  final List<BagProductData>? carts;

  BagProductData({
    this.stockId,
    this.parentId,
    this.quantity,
    this.carts,
  });

  factory BagProductData.fromJson(Map data) {
    List<BagProductData> newList = [];
    data["products"]?.forEach((e) {
      newList.add(BagProductData.fromJson(e));
    });
    return BagProductData(
        stockId: data["stock_id"],
        parentId: data["parent_id"],
        quantity: data["quantity"],
        carts: newList);
  }

  BagProductData copyWith({int? quantity}) {
    return BagProductData(
        stockId: stockId,
        parentId: parentId,
        quantity: quantity ?? this.quantity,
        carts: carts);
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (stockId != null) map["stock_id"] = stockId;
    if (parentId != null) map["parent_id"] = parentId;
    if (quantity != null) map["quantity"] = quantity;
    return map;
  }

  Map<String, dynamic> toJsonInsert() {
    final map = <String, dynamic>{};
    if (stockId != null) map["stock_id"] = stockId;
    if (quantity != null) map["quantity"] = quantity;
    if (carts != null) map["products"] = toJsonCart();
    return map;
  }

  List<Map<String, dynamic>> toJsonCart() {
    List<Map<String, dynamic>> list = [];
    carts?.forEach((element) {
      final map = <String, dynamic>{};
      map["stock_id"] = element.stockId;
      map["quantity"] = element.quantity;
      if (element.parentId != null) map["parent_id"] = element.parentId;
      list.add(map);
    });

    return list;
  }
}
