import '../models.dart';



class CommentsData {
  int? id;
  int? reviewableId;
  String? reviewableType;
  int? assignableId;
  String? assignableType;
  int? rating;
  String? comment;
  String? img;
  bool? ordered;
  bool? addedReview;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Galleries>? galleries;
  UserData? user;
  ProductData? product;
  ShopData? shop;

  CommentsData({
    this.id,
    this.reviewableId,
    this.reviewableType,
    this.assignableId,
    this.assignableType,
    this.rating,
    this.comment,
    this.img,
    this.ordered,
    this.addedReview,
    this.createdAt,
    this.updatedAt,
    this.galleries,
    this.user,
    this.product,
    this.shop,
  });

  CommentsData copyWith({
    int? id,
    int? reviewableId,
    String? reviewableType,
    int? assignableId,
    String? assignableType,
    int? rating,
    String? comment,
    String? img,
    bool? ordered,
    bool? addedReview,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<Galleries>? galleries,
    UserData? user,
    ProductData? product,
    ShopData? shop,
  }) =>
      CommentsData(
        id: id ?? this.id,
        reviewableId: reviewableId ?? this.reviewableId,
        reviewableType: reviewableType ?? this.reviewableType,
        assignableId: assignableId ?? this.assignableId,
        assignableType: assignableType ?? this.assignableType,
        rating: rating ?? this.rating,
        comment: comment ?? this.comment,
        img: img ?? this.img,
        ordered: ordered ?? this.ordered,
        addedReview: addedReview ?? this.addedReview,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        galleries: galleries ?? this.galleries,
        user: user ?? this.user,
        product: product ?? this.product,
        shop: shop ?? this.shop,
      );

  factory CommentsData.fromJson(Map<String, dynamic> json) => CommentsData(
    id: json["id"],
    reviewableId: json["reviewable_id"],
    reviewableType: json["reviewable_type"],
    assignableId: json["assignable_id"],
    assignableType: json["assignable_type"],
    rating: json["rating"],
    comment: json["comment"],
    img: json["img"],
    ordered: json["ordered"],
    addedReview: json["added_review"],
    createdAt: json["created_at"] == null ? null : DateTime.tryParse(json["created_at"])?.toLocal(),
    updatedAt: json["updated_at"] == null ? null : DateTime.tryParse(json["updated_at"])?.toLocal(),
    galleries: json["galleries"] == null ? [] : List<Galleries>.from(json["galleries"]!.map((x) => Galleries.fromJson(x))),
    user: json["user"] == null ? null : UserData.fromJson(json["user"]),
    product: json["product"] == null ? null : ProductData.fromJson(json["product"]),
    shop: json["shop"] == null ? null : ShopData.fromJson(json["shop"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "reviewable_id": reviewableId,
    "reviewable_type": reviewableType,
    "assignable_id": assignableId,
    "assignable_type": assignableType,
    "rating": rating,
    "comment": comment,
    "img": img,
    "ordered": ordered,
    "added_review": addedReview,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "galleries": galleries == null ? [] : List<dynamic>.from(galleries!.map((x) => x.toJson())),
    "user": user?.toJson(),
    "product": product?.toJson(),
    "shop": shop?.toJson(),
  };
}


