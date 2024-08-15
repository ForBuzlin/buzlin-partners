import 'package:venderuzmart/infrastructure/services/services.dart';

class ServiceExtraRequest {
  int? id;
  int? serviceId;
  bool? active;
  num? price;
  String? img;
  String? title;

  ServiceExtraRequest({
    this.id,
    this.serviceId,
    this.active,
    this.price,
    this.img,
    this.title,
  });

  ServiceExtraRequest copyWith({
    int? id,
    int? serviceId,
    bool? active,
    double? price,
    String? img,
    String? title,
  }) =>
      ServiceExtraRequest(
        serviceId: serviceId ?? this.serviceId,
        active: active ?? this.active,
        price: price ?? this.price,
        img: img ?? this.img,
        id: id ?? this.id,
        title: title ?? this.title,
      );

  Map<String, dynamic> toJson() => {
        "service_id": serviceId,
        "active": active ?? true ? 1 : 0,
        "price": price,
        if (img != null) "img": img,
        'title': {LocalStorage.getLanguage()?.locale ?? 'en': title},
      };
}
