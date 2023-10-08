import 'dart:convert';

CountryModel countryModelFromJson(String str) => CountryModel.fromJson(json.decode(str));

String countryModelToJson(CountryModel data) => json.encode(data.toJson());

class CountryModel {
  final int count;
  final String name;
  final List<Country> country;

  CountryModel({
    required this.count,
    required this.name,
    required this.country,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
    count: json["count"],
    name: json["name"],
    country: List<Country>.from(json["country"].map((x) => Country.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "name": name,
    "country": List<dynamic>.from(country.map((x) => x.toJson())),
  };
}

class Country {
  final String countryId;
  final double probability;

  Country({
    required this.countryId,
    required this.probability,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    countryId: json["country_id"],
    probability: json["probability"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "country_id": countryId,
    "probability": probability,
  };
}
