import '../data/social_data.dart';

class SocialsResponse {
  List<SocialData>? data;

  SocialsResponse({
    this.data,
  });

  factory SocialsResponse.fromJson(Map<String, dynamic> json) =>
      SocialsResponse(
        data: json["data"] == null
            ? []
            : List<SocialData>.from(
                json["data"]!.map((x) => SocialData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}
