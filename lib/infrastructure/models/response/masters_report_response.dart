import '../data/master_report_data.dart';
import 'response.dart';

class MastersReportResponse {
  List<MasterReportData>? data;
  Links? links;
  Meta? meta;

  MastersReportResponse({
    this.data,
    this.links,
    this.meta,
  });

  MastersReportResponse copyWith({
    List<MasterReportData>? data,
    Links? links,
    Meta? meta,
  }) =>
      MastersReportResponse(
        data: data ?? this.data,
        links: links ?? this.links,
        meta: meta ?? this.meta,
      );

  factory MastersReportResponse.fromJson(Map<String, dynamic> json) => MastersReportResponse(
    data: json["data"] == null ? [] : List<MasterReportData>.from(json["data"]!.map((x) => MasterReportData.fromJson(x))),
    links: json["links"] == null ? null : Links.fromJson(json["links"]),
    meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "links": links?.toJson(),
    "meta": meta?.toJson(),
  };
}