import '../data/country_data.dart';

class CountryPaginationResponse {
  List<CountryData>? data;

  CountryPaginationResponse({
    this.data,
  });

  CountryPaginationResponse copyWith({
    List<CountryData>? data,
  }) =>
      CountryPaginationResponse(
        data: data ?? this.data,
      );

  factory CountryPaginationResponse.fromJson(Map<String, dynamic> json) =>
      CountryPaginationResponse(
        data: json["data"] == null
            ? []
            : List<CountryData>.from(
                json["data"]!.map((x) => CountryData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}
