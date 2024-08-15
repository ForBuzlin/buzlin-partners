import '../models.dart';

class ShopCommentsPaginateResponse {
  List<ShopCommentsData>? data;

  ShopCommentsPaginateResponse({
    this.data,
  });

  ShopCommentsPaginateResponse copyWith({
    List<ShopCommentsData>? data,
  }) =>
      ShopCommentsPaginateResponse(
        data: data ?? this.data,
      );

  factory ShopCommentsPaginateResponse.fromJson(Map<String, dynamic> json) =>
      ShopCommentsPaginateResponse(
        data: json["data"] == null
            ? []
            : List<ShopCommentsData>.from(
                json["data"]!.map((x) => ShopCommentsData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}
