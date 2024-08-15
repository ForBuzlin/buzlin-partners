import 'transaction.dart';
import 'membership_data.dart';
import 'user_data.dart';

class UserMembershipData {
  int? id;
  int? memberShipId;
  int? userId;
  String? color;
  int? price;
  DateTime? expiredAt;
  UserData? user;
  int? sessions;
  int? sessionsCount;
  int? remainder;
  DateTime? createdAt;
  DateTime? updatedAt;
  MembershipData? memberShip;
  Transaction? transaction;

  UserMembershipData({
    this.id,
    this.memberShipId,
    this.userId,
    this.color,
    this.user,
    this.price,
    this.expiredAt,
    this.sessions,
    this.sessionsCount,
    this.remainder,
    this.createdAt,
    this.updatedAt,
    this.memberShip,
    this.transaction,
  });

  UserMembershipData copyWith({
    int? id,
    int? memberShipId,
    int? userId,
    String? color,
    int? price,
    DateTime? expiredAt,
    UserData? user,
    int? sessions,
    int? sessionsCount,
    int? remainder,
    DateTime? createdAt,
    DateTime? updatedAt,
    MembershipData? memberShip,
    Transaction? transaction,
  }) =>
      UserMembershipData(
        id: id ?? this.id,
        memberShipId: memberShipId ?? this.memberShipId,
        userId: userId ?? this.userId,
        color: color ?? this.color,
        user: user ?? this.user,
        price: price ?? this.price,
        expiredAt: expiredAt ?? this.expiredAt,
        sessions: sessions ?? this.sessions,
        sessionsCount: sessionsCount ?? this.sessionsCount,
        remainder: remainder ?? this.remainder,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        memberShip: memberShip ?? this.memberShip,
        transaction: transaction ?? this.transaction,
      );

  factory UserMembershipData.fromJson(Map<String, dynamic> json) =>
      UserMembershipData(
        id: json["id"],
        memberShipId: json["member_ship_id"],
        userId: json["user_id"],
        color: json["color"],
        price: json["price"],
        expiredAt: json["expired_at"] == null
            ? null
            : DateTime.parse(json["expired_at"]),
        sessions: json["sessions"],
        sessionsCount: json["sessions_count"],
        remainder: json["remainder"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        memberShip: json["member_ship"] == null
            ? null
            : MembershipData.fromJson(json["member_ship"]),
        user: json["user"] == null
            ? null
            : UserData.fromJson(json["user"]),
        transaction: json["transaction"] == null
            ? null
            : Transaction.fromJson(json["transaction"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "member_ship_id": memberShipId,
        "user_id": userId,
        "color": color,
        "price": price,
        "user": user?.toJson(),
        "expired_at": expiredAt?.toIso8601String(),
        "sessions": sessions,
        "sessions_count": sessionsCount,
        "remainder": remainder,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "member_ship": memberShip?.toJson(),
        "transaction": transaction?.toJson(),
      };
}
