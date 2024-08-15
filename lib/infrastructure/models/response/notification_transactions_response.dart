import '../data/notification_transactions_data.dart';
import 'response.dart';

class TransactionListResponse {
  List<NotificationTransactionData>? data;
  Links? links;
  Meta? meta;

  TransactionListResponse({
    this.data,
    this.links,
    this.meta,
  });

  TransactionListResponse copyWith({
    List<NotificationTransactionData>? data,
    Links? links,
    Meta? meta,
  }) =>
      TransactionListResponse(
        data: data ?? this.data,
        links: links ?? this.links,
        meta: meta ?? this.meta,
      );

  factory TransactionListResponse.fromJson(Map<String, dynamic> json) =>
      TransactionListResponse(
        data: json["data"] == null
            ? []
            : List<NotificationTransactionData>.from(json["data"]!
                .map((x) => NotificationTransactionData.fromJson(x))),
        links: json["links"] == null ? null : Links.fromJson(json["links"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "links": links?.toJson(),
        "meta": meta?.toJson(),
      };
}
