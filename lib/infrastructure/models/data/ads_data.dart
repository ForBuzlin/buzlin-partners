import 'ads_package.dart';
import 'shop_data.dart';
import 'transaction.dart';

class AdsData {
  int? id;
  bool? active;
  int? adsPackageId;
  int? shopId;
  String? status;
  Transaction? transaction;
  ShopData? shop;
  AdsPackage? adsPackage;

  AdsData({
    this.id,
    this.active,
    this.adsPackageId,
    this.shopId,
    this.status,
    this.transaction,
    this.shop,
    this.adsPackage,
  });

  AdsData copyWith({
    int? id,
    bool? active,
    int? adsPackageId,
    int? shopId,
    String? status,
    Transaction? transaction,
    ShopData? shop,
    AdsPackage? adsPackage,
  }) =>
      AdsData(
        id: id ?? this.id,
        active: active ?? this.active,
        adsPackageId: adsPackageId ?? this.adsPackageId,
        shopId: shopId ?? this.shopId,
        status: status ?? this.status,
        transaction: transaction ?? this.transaction,
        shop: shop ?? this.shop,
        adsPackage: adsPackage ?? this.adsPackage,
      );

  factory AdsData.fromJson(Map<String, dynamic> json) => AdsData(
        id: json["id"],
        active: json["active"],
        adsPackageId: json["ads_package_id"],
        shopId: json["shop_id"],
        status: json["status"],
        transaction: json["transaction"] == null
            ? null
            : Transaction.fromJson(json["transaction"]),
        shop: json["shop"] == null ? null : ShopData.fromJson(json["shop"]),
        adsPackage: json["ads_package"] == null
            ? null
            : AdsPackage.fromJson(json["ads_package"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "active": active,
        "ads_package_id": adsPackageId,
        "shop_id": shopId,
        "status": status,
        "transaction": transaction?.toJson(),
        "shop": shop?.toJson(),
        "ads_package": adsPackage?.toJson(),
      };
}
