import 'currency_data.dart';

class Wallet {
  String? uuid;
  int? userId;
  int? id;
  int? currencyId;
  num? price;
  String? symbol;
  DateTime? createdAt;
  DateTime? updatedAt;
  CurrencyData? currency;

  Wallet({
    this.id,
    this.uuid,
    this.userId,
    this.price,
    this.symbol,
    this.createdAt,
    this.updatedAt,
  });

  Wallet copyWith({
    int? id,
    String? uuid,
    int? userId,
    double? price,
    String? symbol,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Wallet(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        userId: userId ?? this.userId,
        price: price ?? this.price,
        symbol: symbol ?? this.symbol,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
    id: json["id"],
    uuid: json["uuid"],
    userId: json["user_id"],
    price: json["price"]?.toDouble(),
    symbol: json["symbol"],
    createdAt: json["created_at"] == null
        ? null
        : DateTime.tryParse(json["created_at"])?.toLocal(),
    updatedAt: json["updated_at"] == null
        ? null
        : DateTime.tryParse(json["updated_at"])?.toLocal(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "uuid": uuid,
    "user_id": userId,
    "price": price,
    "symbol": symbol,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
