class UserGiftCardData {
  int id;
  int giftCartId;
  int userId;
  int price;
  DateTime expiredAt;
  GiftCart? giftCart;
  User? user;
  Transaction? transaction;

  UserGiftCardData({
    required this.id,
    required this.giftCartId,
    required this.userId,
    required this.price,
    required this.expiredAt,
    required this.giftCart,
    required this.user,
    required this.transaction,
  });

  factory UserGiftCardData.fromJson(Map<String, dynamic> json) => UserGiftCardData(
    id: json["id"],
    giftCartId: json["gift_cart_id"],
    userId: json["user_id"],
    price: json["price"],
    expiredAt: DateTime.parse(json["expired_at"]),
    giftCart: GiftCart.fromJson(json["giftCart"]),
    user: User.fromJson(json["user"]),
    transaction: json["transaction"] == null ? null : Transaction.fromJson(json["transaction"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "gift_cart_id": giftCartId,
    "user_id": userId,
    "price": price,
    "expired_at": expiredAt.toIso8601String(),
    if(giftCart != null)
    "giftCart": giftCart?.toJson(),
    if(user != null)
      "user": user?.toJson(),
    "transaction": transaction?.toJson(),
  };
}

class GiftCart {
  int id;
  int shopId;
  int active;
  int price;
  String time;
  Translation? translation;

  GiftCart({
    required this.id,
    required this.shopId,
    required this.active,
    required this.price,
    required this.time,
    required this.translation,
  });

  factory GiftCart.fromJson(Map<String, dynamic> json) => GiftCart(
    id: json["id"],
    shopId: json["shop_id"],
    active: json["active"],
    price: json["price"],
    time: json["time"],
    translation: Translation.fromJson(json["translation"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "shop_id": shopId,
    "active": active,
    "price": price,
    "time": time,
    if(translation != null)
    "translation": translation?.toJson(),
  };
}

class Translation {
  int id;
  String locale;
  String title;

  Translation({
    required this.id,
    required this.locale,
    required this.title,
  });

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
    id: json["id"],
    locale: json["locale"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "locale": locale,
    "title": title,
  };
}

class Transaction {
  int id;
  String payableType;
  int payableId;
  int price;
  String? paymentTrxId;
  String note;
  DateTime performTime;
  String status;
  String statusDescription;
  DateTime createdAt;
  DateTime updatedAt;
  PaymentSystem paymentSystem;

  Transaction({
    required this.id,
    required this.payableType,
    required this.payableId,
    required this.price,
    required this.paymentTrxId,
    required this.note,
    required this.performTime,
    required this.status,
    required this.statusDescription,
    required this.createdAt,
    required this.updatedAt,
    required this.paymentSystem,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
    id: json["id"],
    payableType: json["payable_type"],
    payableId: json["payable_id"],
    price: json["price"],
    paymentTrxId: json["payment_trx_id"],
    note: json["note"],
    performTime: DateTime.parse(json["perform_time"]),
    status: json["status"],
    statusDescription: json["status_description"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    paymentSystem: PaymentSystem.fromJson(json["payment_system"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "payable_type": payableType,
    "payable_id": payableId,
    "price": price,
    "payment_trx_id": paymentTrxId,
    "note": note,
    "perform_time": performTime.toIso8601String(),
    "status": status,
    "status_description": statusDescription,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "payment_system": paymentSystem.toJson(),
  };
}

class PaymentSystem {
  int id;
  String tag;
  int input;
  bool active;
  DateTime createdAt;
  DateTime updatedAt;

  PaymentSystem({
    required this.id,
    required this.tag,
    required this.input,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PaymentSystem.fromJson(Map<String, dynamic> json) => PaymentSystem(
    id: json["id"],
    tag: json["tag"],
    input: json["input"],
    active: json["active"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "tag": tag,
    "input": input,
    "active": active,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class User {
  int id;
  String uuid;
  String firstname;
  String lastname;
  bool emptyP;
  bool active;
  String? img;

  User({
    required this.id,
    required this.uuid,
    required this.firstname,
    required this.lastname,
    required this.emptyP,
    required this.active,
    this.img,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    uuid: json["uuid"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    emptyP: json["empty_p"],
    active: json["active"],
    img: json["img"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "uuid": uuid,
    "firstname": firstname,
    "lastname": lastname,
    "empty_p": emptyP,
    "active": active,
    "img": img,
  };
}