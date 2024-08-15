import 'invite_data.dart';
import 'service_data.dart';
import 'shop_data.dart';
import 'currency_data.dart';
import 'wallet_data.dart';
import 'working_day.dart';

class UserData {
  int? id;
  String? uuid;
  String? firstname;
  String? lastname;
  bool? emptyP;
  String? email;
  String? phone;
  String? img;
  DateTime? birthday;
  String? gender;
  String? note;
  String? address;
  bool? active;
  String? myReferral;
  String? role;
  String? refreshToken;
  DateTime? emailVerifiedAt;
  DateTime? phoneVerifiedAt;
  DateTime? registeredAt;
  int? rCount;
  double? rAvg;
  int? rSum;
  int? oCount;
  num? oSum;
  String? lang;
  String? referral;
  String? confirmPassword;
  String? password;
  DateTime? createdAt;
  DateTime? updatedAt;
  num? referralFromTopupPrice;
  num? referralFromWithdrawPrice;
  num? referralToWithdrawPrice;
  num? referralToTopupPrice;
  num? referralFromTopupCount;
  num? referralFromWithdrawCount;
  num? referralToWithdrawCount;
  num? referralToTopupCount;
  ShopData? shop;
  Wallet? wallet;
  List<InviteData>? invitations;
  InviteData? invite;
  ServiceData? serviceMaster;
  CurrencyData? currency;
  List<WorkingDay>? workingDays;

  UserData({
    this.id,
    this.uuid,
    this.firstname,
    this.lastname,
    this.emptyP,
    this.email,
    this.phone,
    this.birthday,
    this.referral,
    this.refreshToken,
    this.gender,
    this.active,
    this.myReferral,
    this.role,
    this.img,
    this.emailVerifiedAt,
    this.phoneVerifiedAt,
    this.registeredAt,
    this.rCount,
    this.rAvg,
    this.rSum,
    this.oCount,
    this.oSum,
    this.lang,
    this.confirmPassword,
    this.password,
    this.createdAt,
    this.updatedAt,
    this.referralFromTopupPrice,
    this.referralFromWithdrawPrice,
    this.referralToWithdrawPrice,
    this.referralToTopupPrice,
    this.referralFromTopupCount,
    this.referralFromWithdrawCount,
    this.referralToWithdrawCount,
    this.referralToTopupCount,
    this.shop,
    this.wallet,
    this.invitations,
    this.currency,
    this.invite,
    this.note,
    this.address,
    this.serviceMaster,
    this.workingDays,
  });

  UserData copyWith({
    int? id,
    String? uuid,
    String? firstname,
    String? lastname,
    bool? emptyP,
    String? email,
    String? referral,
    String? confirmPassword,
    String? password,
    String? phone,
    String? note,
    String? address,
    DateTime? birthday,
    String? gender,
    String? refreshToken,
    bool? active,
    String? myReferral,
    String? role,
    String? img,
    DateTime? emailVerifiedAt,
    DateTime? phoneVerifiedAt,
    DateTime? registeredAt,
    int? rCount,
    double? rAvg,
    int? rSum,
    int? oCount,
    double? oSum,
    String? lang,
    DateTime? createdAt,
    DateTime? updatedAt,
    num? referralFromTopupPrice,
    num? referralFromWithdrawPrice,
    num? referralToWithdrawPrice,
    num? referralToTopupPrice,
    num? referralFromTopupCount,
    num? referralFromWithdrawCount,
    num? referralToWithdrawCount,
    num? referralToTopupCount,
    ShopData? shop,
    Wallet? wallet,
    List<InviteData>? invitations,
    InviteData? invite,
    CurrencyData? currency,
    ServiceData? serviceMaster,
    List<WorkingDay>? workingDays,
  }) =>
      UserData(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
        emptyP: emptyP ?? this.emptyP,
        email: email ?? this.email,
        address: address ?? this.address,
        note: note ?? this.note,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        password: password ?? this.password,
        phone: phone ?? this.phone,
        referral: referral ?? this.referral,
        refreshToken: refreshToken ?? this.refreshToken,
        birthday: birthday ?? this.birthday,
        gender: gender ?? this.gender,
        active: active ?? this.active,
        myReferral: myReferral ?? this.myReferral,
        role: role ?? this.role,
        emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
        phoneVerifiedAt: phoneVerifiedAt ?? this.phoneVerifiedAt,
        registeredAt: registeredAt ?? this.registeredAt,
        img: img ?? this.img,
        rCount: rCount ?? this.rCount,
        rAvg: rAvg ?? this.rAvg,
        rSum: rSum ?? this.rSum,
        oCount: oCount ?? this.oCount,
        oSum: oSum ?? this.oSum,
        lang: lang ?? this.lang,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        referralFromTopupPrice:
            referralFromTopupPrice ?? this.referralFromTopupPrice,
        referralFromWithdrawPrice:
            referralFromWithdrawPrice ?? this.referralFromWithdrawPrice,
        referralToWithdrawPrice:
            referralToWithdrawPrice ?? this.referralToWithdrawPrice,
        referralToTopupPrice: referralToTopupPrice ?? this.referralToTopupPrice,
        referralFromTopupCount:
            referralFromTopupCount ?? this.referralFromTopupCount,
        referralFromWithdrawCount:
            referralFromWithdrawCount ?? this.referralFromWithdrawCount,
        referralToWithdrawCount:
            referralToWithdrawCount ?? this.referralToWithdrawCount,
        referralToTopupCount: referralToTopupCount ?? this.referralToTopupCount,
        shop: shop ?? this.shop,
        wallet: wallet ?? this.wallet,
        invitations: invitations ?? this.invitations,
        currency: currency ?? this.currency,
        invite: invite ?? this.invite,
        serviceMaster: serviceMaster ?? this.serviceMaster,
        workingDays: workingDays ?? this.workingDays,
      );

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["id"],
        uuid: json["uuid"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        emptyP: json["empty_p"],
        img: json["img"],
        referral: json["referral"],
        password: json["password"],
        confirmPassword: json["con_password"],
        email: json["email"],
        phone: json["phone"],
        invite:
            json["invite"] == null ? null : InviteData.fromJson(json["invite"]),
        serviceMaster: json["service_master"] == null
            ? null
            : ServiceData.fromJson(json["service_master"]),
        refreshToken: json["refresh_token"],
        birthday:
            json["birthday"] == null ? null : DateTime.parse(json["birthday"]),
        gender: json["gender"],
        active: json["active"],
        myReferral: json["my_referral"],
        role: json["role"],
        emailVerifiedAt: json["email_verified_at"] == null
            ? null
            : DateTime.parse(json["email_verified_at"]),
        phoneVerifiedAt: json["phone_verified_at"] == null
            ? null
            : DateTime.parse(json["phone_verified_at"]),
        registeredAt: json["registered_at"] == null
            ? null
            : DateTime.parse(json["registered_at"]),
        rCount: json["r_count"],
        rAvg: json["r_avg"]?.toDouble(),
        rSum: json["r_sum"],
        oCount: json["o_count"],
        oSum: json["o_sum"]?.toDouble(),
        lang: json["lang"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.tryParse(json["created_at"])?.toLocal(),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.tryParse(json["updated_at"])?.toLocal(),
        referralFromTopupPrice: json["referral_from_topup_price"],
        referralFromWithdrawPrice: json["referral_from_withdraw_price"],
        referralToWithdrawPrice: json["referral_to_withdraw_price"],
        referralToTopupPrice: json["referral_to_topup_price"],
        referralFromTopupCount: json["referral_from_topup_count"],
        referralFromWithdrawCount: json["referral_from_withdraw_count"],
        referralToWithdrawCount: json["referral_to_withdraw_count"],
        referralToTopupCount: json["referral_to_topup_count"],
        shop: json["shop"] == null ? null : ShopData.fromJson(json["shop"]),
        wallet: json["wallet"] == null ? null : Wallet.fromJson(json["wallet"]),
        invitations: json["invitations"] == null
            ? []
            : List<InviteData>.from(
                json["invitations"]!.map((x) => InviteData.fromJson(x))),
        workingDays: json["user_working_days"] == null
            ? []
            : List<WorkingDay>.from(
                json["user_working_days"]!.map((x) => WorkingDay.fromJson(x))),
        currency: json["currency"] == null
            ? null
            : CurrencyData.fromJson(json["currency"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "firstname": firstname,
        "lastname": lastname,
        "empty_p": emptyP,
        "email": email,
        "phone": phone,
        "referral": referral,
        "birthday": birthday?.toIso8601String(),
        "gender": gender,
        "img": img,
        "refreshToken": refreshToken,
        "active": active,
        "con_password": confirmPassword,
        "password": password,
        "my_referral": myReferral,
        "role": role,
        "email_verified_at": emailVerifiedAt?.toIso8601String(),
        "phone_verified_at": phoneVerifiedAt?.toIso8601String(),
        "registered_at": registeredAt?.toIso8601String(),
        "r_count": rCount,
        "r_avg": rAvg,
        "r_sum": rSum,
        "o_count": oCount,
        "invite": invite?.toJson(),
        "o_sum": oSum,
        "lang": lang,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "referral_from_topup_price": referralFromTopupPrice,
        "referral_from_withdraw_price": referralFromWithdrawPrice,
        "referral_to_withdraw_price": referralToWithdrawPrice,
        "referral_to_topup_price": referralToTopupPrice,
        "referral_from_topup_count": referralFromTopupCount,
        "referral_from_withdraw_count": referralFromWithdrawCount,
        "referral_to_withdraw_count": referralToWithdrawCount,
        "referral_to_topup_count": referralToTopupCount,
        "shop": shop?.toJson(),
        "wallet": wallet?.toJson(),
        "invitations": invitations == null
            ? []
            : List<dynamic>.from(invitations!.map((x) => x.toJson())),
        "user_working_days": workingDays == null
            ? []
            : List<dynamic>.from(workingDays!.map((x) => x.toJson())),
        "currency": currency?.toJson(),
      };
}
