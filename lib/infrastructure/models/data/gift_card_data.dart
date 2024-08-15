class GiftCardData {
  int? id;
  int? shopId;
  int? active;
  int? price;
  String? time;
  Shop? shop;
  GiftCardDataTranslation? translation;
  List<GiftCardDataTranslation>? translations;


  GiftCardData({
     this.id,
     this.shopId,
     this.active,
     this.price,
     this.time,
     this.shop,
     this.translation,
     this.translations
  });

  factory GiftCardData.fromJson(Map<String, dynamic> json) => GiftCardData(
    id: json["id"],
    shopId: json["shop_id"],
    active: json["active"],
    price: json["price"],
    time: json["time"],
    shop: Shop.fromJson(json["shop"]),
    translation: GiftCardDataTranslation.fromJson(json["translation"]),
    translations: json["translations"] != null ? List<GiftCardDataTranslation>.from(json["translations"].map((x) => GiftCardDataTranslation.fromJson(x))) : null,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "shop_id": shopId,
    if(active != null)
    "active": active,
    if(price != null)
    "price": price,
    if(time != null)
    "time": time,
    if(shop != null)
      "shop": shop?.toJson(),
    if(translation != null)
      "translation": translation?.toJson(),
    if(translations != null)
      "translations": List<dynamic>.from(translations!.map((x) => x.toJson())),
  };
  GiftCardData copyWith({
    int? id,
    int? shopId,
    int? active,
    int? price,
    String? time,
    Shop? shop,
    GiftCardDataTranslation? translation,
    List<GiftCardDataTranslation>? translations,
  }) {
    return GiftCardData(
      id: id ?? this.id,
      shopId: shopId ?? this.shopId,
      active: active ?? this.active,
      price: price ?? this.price,
      time: time ?? this.time,
      shop: shop ?? this.shop,
      translation: translation ?? this.translation,
      translations: translations ?? this.translations,
    );
  }
}

class Shop {
  int id;
  String slug;
  String uuid;
  int userId;
  bool open;
  bool visibility;
  bool verify;
  String logoImg;
  LatLong latLong;
  int distance;
  int productsCount;
  ShopTranslation translation;

  Shop({
    required this.id,
    required this.slug,
    required this.uuid,
    required this.userId,
    required this.open,
    required this.visibility,
    required this.verify,
    required this.logoImg,
    required this.latLong,
    required this.distance,
    required this.productsCount,
    required this.translation,
  });

  factory Shop.fromJson(Map<String, dynamic> json) => Shop(
    id: json["id"],
    slug: json["slug"],
    uuid: json["uuid"],
    userId: json["user_id"],
    open: json["open"],
    visibility: json["visibility"],
    verify: json["verify"],
    logoImg: json["logo_img"],
    latLong: LatLong.fromJson(json["lat_long"]),
    distance: json["distance"],
    productsCount: json["products_count"],
    translation: ShopTranslation.fromJson(json["translation"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "slug": slug,
    "uuid": uuid,
    "user_id": userId,
    "open": open,
    "visibility": visibility,
    "verify": verify,
    "logo_img": logoImg,
    "lat_long": latLong.toJson(),
    "distance": distance,
    "products_count": productsCount,
    "translation": translation.toJson(),
  };
}

class LatLong {
  dynamic latitude;
  dynamic longitude;

  LatLong({
    required this.latitude,
    required this.longitude,
  });

  factory LatLong.fromJson(Map<String, dynamic> json) => LatLong(
    latitude: json["latitude"],
    longitude: json["longitude"],
  );

  Map<String, dynamic> toJson() => {
    "latitude": latitude,
    "longitude": longitude,
  };
}

class ShopTranslation {
  int id;
  String locale;
  String title;
  String description;
  String address;

  ShopTranslation({
    required this.id,
    required this.locale,
    required this.title,
    required this.description,
    required this.address,
  });

  factory ShopTranslation.fromJson(Map<String, dynamic> json) => ShopTranslation(
    id: json["id"],
    locale: json["locale"],
    title: json["title"],
    description: json["description"],
    address: json["address"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "locale": locale,
    "title": title,
    "description": description,
    "address": address,
  };
}

class GiftCardDataTranslation {
  int id;
  String locale;
  String title;
  String? description;

  GiftCardDataTranslation({
    required this.id,
    required this.locale,
    required this.title,
    this.description,
  });

  factory GiftCardDataTranslation.fromJson(Map<String, dynamic> json) => GiftCardDataTranslation(
    id: json["id"],
    locale: json["locale"],
    title: json["title"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "locale": locale,
    "title": title,
    "description": description,
  };
}