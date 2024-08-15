import 'package:venderuzmart/infrastructure/services/services.dart';

import 'category_data.dart';
import 'faq_data.dart';
import 'galleries.dart';
import 'service_extra_data.dart';
import 'translation.dart';
import 'user_data.dart';

class ServiceData {
  int? id;
  int? shopId;
  num? price;
  int? pause;
  String? slug;
  String? type;
  String? note;
  String? address;
  int? interval;
  String? status;
  String? gender;
  num? totalPrice;
  num? minPrice;
  int? categoryId;
  DateTime? createdAt;
  DateTime? updatedAt;
  CategoryData? category;
  Translation? translation;
  List<Galleries>? galleries;
  List<Translation>? translations;
  List<ServiceExtrasData>? extras;
  List<ServiceExtrasData>? selectExtras;
  List<FaqData>? faqs;
  int? serviceId;
  int? masterId;
  num? discount;
  num? commissionFee;
  bool? active;
  ServiceData? service;
  UserData? master;

  ServiceData({
    this.id,
    this.slug,
    this.categoryId,
    this.shopId,
    this.status,
    this.price,
    this.category,
    this.interval,
    this.pause,
    this.type,
    this.minPrice,
    this.gender,
    this.createdAt,
    this.updatedAt,
    this.translation,
    this.translations,
    this.galleries,
    this.serviceId,
    this.masterId,
    this.totalPrice,
    this.discount,
    this.commissionFee,
    this.active,
    this.service,
    this.master,
    this.note,
    this.address,
    this.extras,
    this.faqs,
    this.selectExtras,
  });

  ServiceData copyWith({
    int? id,
    String? slug,
    String? note,
    String? address,
    int? categoryId,
    int? shopId,
    String? status,
    num? price,
    num? minPrice,
    num? totalPrice,
    int? interval,
    int? pause,
    String? type,
    String? gender,
    CategoryData? category,
    DateTime? createdAt,
    DateTime? updatedAt,
    Translation? translation,
    List<Translation>? translations,
    List<Galleries>? galleries,
    List<ServiceExtrasData>? extras,
    List<ServiceExtrasData>? selectExtras,
    List<FaqData>? faqs,
    int? serviceId,
    int? masterId,
    num? discount,
    num? commissionFee,
    bool? active,
    ServiceData? service,
    UserData? master,
  }) =>
      ServiceData(
        id: id ?? this.id,
        faqs: faqs ?? this.faqs,
        slug: slug ?? this.slug,
        note: note ?? this.note,
        address: address ?? this.address,
        categoryId: categoryId ?? this.categoryId,
        shopId: shopId ?? this.shopId,
        minPrice: minPrice ?? this.minPrice,
        status: status ?? this.status,
        totalPrice: totalPrice ?? this.totalPrice,
        category: category ?? this.category,
        price: price ?? this.price,
        interval: interval ?? this.interval,
        pause: pause ?? this.pause,
        gender: gender ?? this.gender,
        type: type?.isEmpty ?? false ? null : type ?? this.type,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        translation: translation ?? this.translation,
        translations: translations ?? this.translations,
        galleries: galleries ?? this.galleries,
        serviceId: serviceId ?? this.serviceId,
        masterId: masterId ?? this.masterId,
        discount: discount ?? this.discount,
        commissionFee: commissionFee ?? this.commissionFee,
        active: active ?? this.active,
        service: service ?? this.service,
        master: master ?? this.master,
        extras: extras ?? this.extras,
        selectExtras: selectExtras ?? this.selectExtras,
      );

  factory ServiceData.fromJson(Map<String, dynamic> json) => ServiceData(
        id: json["id"],
        slug: json["slug"],
        note: json["note"],
        totalPrice: json["total_price"],
        categoryId: json["category_id"],
        shopId: json["shop_id"],
        minPrice: json["min_price"],
        address: json["address"],
        gender: json["gender"] == null
            ? null
            : DropDownValues.genderList[json["gender"] - 1],
        status: json["status"],
        price: json["price"],
        interval: json["interval"],
        pause: json["pause"],
        type: json["type"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        category: json["category"] == null
            ? null
            : CategoryData.fromJson(json["category"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        translation: json["translation"] == null
            ? null
            : Translation.fromJson(json["translation"]),
        translations: json["translations"] == null
            ? []
            : List<Translation>.from(
                json["translations"]!.map((x) => Translation.fromJson(x))),
        extras: json["service_extras"] == null
            ? []
            : List<ServiceExtrasData>.from(json["service_extras"]!
                .map((x) => ServiceExtrasData.fromJson(x))),
        galleries: json["galleries"] == null
            ? []
            : List<Galleries>.from(
                json["galleries"]!.map((x) => Galleries.fromJson(x))),
        faqs: json["service_faqs"] == null
            ? []
            : List<FaqData>.from(
                json["service_faqs"]!.map((x) => FaqData.fromJson(x))),
        serviceId: json["service_id"],
        masterId: json["master_id"],
        commissionFee: json["commission_fee"],
        discount: json["discount"],
        active: json["active"],
        service: json["service"] == null
            ? null
            : ServiceData.fromJson(json["service"]),
        master:
            json["master"] == null ? null : UserData.fromJson(json["master"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "note": note,
        "min_price": minPrice,
        "address": address,
        "total_price": totalPrice,
        "category_id": categoryId,
        "shop_id": shopId,
        "status": status,
        "price": price,
        if (gender != null)
          "gender": DropDownValues.genderList.indexOf(gender!),
        "interval": interval,
        "pause": pause,
        "type": type,
        "category": category,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "translation": translation?.toJson(),
        "service_faqs": faqs == null
            ? []
            : List<dynamic>.from(faqs!.map((x) => x.toJson())),
        "translations": translations == null
            ? []
            : List<dynamic>.from(translations!.map((x) => x.toJson())),
        "galleries": galleries == null
            ? []
            : List<dynamic>.from(galleries!.map((x) => x.toJson())),
        "service_extras": extras == null
            ? []
            : List<dynamic>.from(extras!.map((x) => x.toJson())),
        "service_id": serviceId,
        "master_id": masterId,
        "discount": discount,
        "commission_fee": commissionFee,
        "active": active,
        "service": service?.toJson(),
        "master": master?.toJson(),
      };
}
