import 'package:venderuzmart/infrastructure/models/models.dart';

class FilterResponse {
  List<Brand>? brands;
  List<Brand>? categories;
  List<Groups>? group;
  Price? price;
  int? count;

  FilterResponse({
    this.brands,
    this.categories,
    this.group,
    this.price,
    this.count,
  });

  FilterResponse copyWith({
    List<Brand>? brands,
    List<Brand>? categories,
    List<Groups>? group,
    Price? price,
    int? count,
  }) =>
      FilterResponse(
        brands: brands ?? this.brands,
        categories: categories ?? this.categories,
        group: group ?? this.group,
        price: price ?? this.price,
        count: count ?? this.count,
      );

  factory FilterResponse.fromJson(Map<String, dynamic> json) => FilterResponse(
        brands: json["brands"] == null
            ? []
            : List<Brand>.from(json["brands"]!.map((x) => Brand.fromJson(x))),
        categories: json["categories"] == null
            ? []
            : List<Brand>.from(
                json["categories"]!.map((x) => Brand.fromJson(x))),
        group: json["group"] == null
            ? []
            : List<Groups>.from(json["group"]!.map((x) => Groups.fromJson(x))),
        price: json["price"] == null ? null : Price.fromJson(json["price"]),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "brands": brands == null
            ? []
            : List<dynamic>.from(brands!.map((x) => x.toJson())),
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x.toJson())),
        "group": group == null
            ? []
            : List<dynamic>.from(group!.map((x) => x.toJson())),
        "price": price?.toJson(),
        "count": count,
      };
}

class Groups {
  int? id;
  String? type;
  String? title;
  List<Extra>? extras;

  Groups({
    this.id,
    this.type,
    this.title,
    this.extras,
  });

  Groups copyWith({
    int? id,
    String? type,
    String? title,
    List<Extra>? extras,
  }) =>
      Groups(
        id: id ?? this.id,
        type: type ?? this.type,
        title: title ?? this.title,
        extras: extras ?? this.extras,
      );

  factory Groups.fromJson(Map<String, dynamic> json) => Groups(
        id: json["id"],
        type: json["type"],
        title: json["title"],
        extras: json["extras"] == null
            ? []
            : List<Extra>.from(json["extras"]!.map((x) => Extra.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "title": title,
        "extras": extras == null
            ? []
            : List<dynamic>.from(extras!.map((x) => x.toJson())),
      };
}

class Extra {
  int? id;
  String? value;

  Extra({
    this.id,
    this.value,
  });

  Extra copyWith({
    int? id,
    String? value,
  }) =>
      Extra(
        id: id ?? this.id,
        value: value ?? this.value,
      );

  factory Extra.fromJson(Map<String, dynamic> json) => Extra(
        id: json["id"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
      };
}

class Price {
  num? min;
  num? max;

  Price({
    this.min,
    this.max,
  });

  Price copyWith({
    num? min,
    num? max,
  }) =>
      Price(
        min: min ?? this.min,
        max: max ?? this.max,
      );

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        min: json["min"],
        max: json["max"],
      );

  Map<String, dynamic> toJson() => {
        "min": min,
        "max": max,
      };
}
