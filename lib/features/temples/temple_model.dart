import 'dart:convert';

List<TempleModel> templeModelFromJson(String str) => List<TempleModel>.from(json.decode(str).map((x) => TempleModel.fromJson(x)));

String templeModelToJson(List<TempleModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TempleModel {
  final int id;
  final String name;
  final String address;
  final String description;
  final String image;

  TempleModel({
    required this.id,
    required this.name,
    required this.address,
    required this.description,
    required this.image,
  });

  factory TempleModel.fromJson(Map<String, dynamic> json) => TempleModel(
    id: json["id"],
    name: json["name"],
    address: json["address"],
    description: json["description"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "address": address,
    "description": description,
    "image": image,
  };
}
