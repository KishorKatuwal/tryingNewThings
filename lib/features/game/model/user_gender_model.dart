// To parse this JSON data, do
//
//     final userGenderModel = userGenderModelFromJson(jsonString);

import 'dart:convert';

UserGenderModel userGenderModelFromJson(String str) =>
    UserGenderModel.fromJson(json.decode(str));

String userGenderModelToJson(UserGenderModel data) =>
    json.encode(data.toJson());

class UserGenderModel {
  final int count;
  final String name;
  final String gender;
  final double probability;

  UserGenderModel({
    required this.count,
    required this.name,
    required this.gender,
    required this.probability,
  });

  factory UserGenderModel.fromJson(Map<String, dynamic> json) =>
      UserGenderModel(
        count: json["count"],
        name: json["name"],
        gender: json["gender"],
        probability: json["probability"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "name": name,
        "gender": gender,
        "probability": probability,
      };
}
