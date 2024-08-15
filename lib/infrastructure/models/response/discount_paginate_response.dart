// To parse this JSON data, do
//
//     final discountPaginateResponse = discountPaginateResponseFromJson(jsonString);

import 'dart:convert';

import '../data/discount_data.dart';

DiscountPaginateResponse discountPaginateResponseFromJson(String str) =>
    DiscountPaginateResponse.fromJson(json.decode(str));

String discountPaginateResponseToJson(DiscountPaginateResponse data) =>
    json.encode(data.toJson());

class DiscountPaginateResponse {
  List<DiscountData>? data;

  DiscountPaginateResponse({
    this.data,
  });

  DiscountPaginateResponse copyWith({
    List<DiscountData>? data,
  }) =>
      DiscountPaginateResponse(
        data: data ?? this.data,
      );

  factory DiscountPaginateResponse.fromJson(Map<String, dynamic> json) =>
      DiscountPaginateResponse(
        data: json["data"] == null
            ? []
            : List<DiscountData>.from(
                json["data"]!.map((x) => DiscountData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}
