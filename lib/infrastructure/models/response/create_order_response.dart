class CreateOrderResponse {
  CreateOrderResponse({CreatedOrder? data}) {
    _data = data;
  }

  CreateOrderResponse.fromJson(dynamic json) {
    _data = json['data'] != null ? CreatedOrder.fromJson(json['data']) : null;
  }

  CreatedOrder? _data;

  CreateOrderResponse copyWith({CreatedOrder? data}) =>
      CreateOrderResponse(data: data ?? _data);

  CreatedOrder? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

class CreatedOrder {
  CreatedOrder({
    int? id,
    int? userId,
    num? price,
    num? currencyPrice,
    num? rate,
  }) {
    _id = id;
    _userId = userId;
    _price = price;
    _currencyPrice = currencyPrice;
    _rate = rate;
  }

  CreatedOrder.fromJson(dynamic json) {
    if (json.isEmpty) {
      return;
    }
    _id = json[0]['id'];
    _userId = json[0]['user_id'];
    _price = json[0]['price'];
    _currencyPrice = json[0]['currency_price'];
    _rate = json[0]['rate'];
  }

  int? _id;
  int? _userId;
  num? _price;
  num? _currencyPrice;
  num? _rate;

  CreatedOrder copyWith({
    int? id,
    int? userId,
    num? price,
    num? currencyPrice,
    num? rate,
  }) =>
      CreatedOrder(
        id: id ?? _id,
        userId: userId ?? _userId,
        price: price ?? _price,
        currencyPrice: currencyPrice ?? _currencyPrice,
        rate: rate ?? _rate,
      );

  int? get id => _id;

  int? get userId => _userId;

  num? get price => _price;

  num? get currencyPrice => _currencyPrice;

  num? get rate => _rate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['price'] = _price;
    map['currency_price'] = _currencyPrice;
    map['rate'] = _rate;
    return map;
  }
}
