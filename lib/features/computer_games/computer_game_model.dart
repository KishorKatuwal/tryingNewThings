import 'dart:convert';

List<ComputerGamesModel> computerGamesModelFromJson(String str) =>
    List<ComputerGamesModel>.from(
        json.decode(str).map((x) => ComputerGamesModel.fromJson(x)));

String computerGamesModelToJson(List<ComputerGamesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ComputerGamesModel {
  final String internalName;
  final String title;
  final String metacriticLink;
  final String dealId;
  final String storeId;
  final String gameId;
  final String salePrice;
  final String normalPrice;
  final String isOnSale;
  final String savings;
  final String metacriticScore;
  final String steamRatingText;
  final String steamRatingPercent;
  final String steamRatingCount;
  final String steamAppId;
  final int releaseDate;
  final int lastChange;
  final String dealRating;
  final String thumb;

  ComputerGamesModel({
    required this.internalName,
    required this.title,
    required this.metacriticLink,
    required this.dealId,
    required this.storeId,
    required this.gameId,
    required this.salePrice,
    required this.normalPrice,
    required this.isOnSale,
    required this.savings,
    required this.metacriticScore,
    required this.steamRatingText,
    required this.steamRatingPercent,
    required this.steamRatingCount,
    required this.steamAppId,
    required this.releaseDate,
    required this.lastChange,
    required this.dealRating,
    required this.thumb,
  });

  factory ComputerGamesModel.fromJson(Map<String, dynamic> json) =>
      ComputerGamesModel(
        internalName: json["internalName"],
        title: json["title"],
        metacriticLink: json["metacriticLink"] ?? "N/A",
        dealId: json["dealID"],
        storeId: json["storeID"],
        gameId: json["gameID"],
        salePrice: json["salePrice"],
        normalPrice: json["normalPrice"],
        isOnSale: json["isOnSale"],
        savings: json["savings"],
        metacriticScore: json["metacriticScore"],
        steamRatingText: json["steamRatingText"] ?? "N/A",
        steamRatingPercent: json["steamRatingPercent"],
        steamRatingCount: json["steamRatingCount"],
        steamAppId: json["steamAppID"] ?? "N/A",
        releaseDate: json["releaseDate"],
        lastChange: json["lastChange"],
        dealRating: json["dealRating"],
        thumb: json["thumb"],
      );

  Map<String, dynamic> toJson() => {
        "internalName": internalName,
        "title": title,
        "metacriticLink": metacriticLink,
        "dealID": dealId,
        "storeID": storeId,
        "gameID": gameId,
        "salePrice": salePrice,
        "normalPrice": normalPrice,
        "isOnSale": isOnSale,
        "savings": savings,
        "metacriticScore": metacriticScore,
        "steamRatingText": steamRatingText,
        "steamRatingPercent": steamRatingPercent,
        "steamRatingCount": steamRatingCount,
        "steamAppID": steamAppId,
        "releaseDate": releaseDate,
        "lastChange": lastChange,
        "dealRating": dealRating,
        "thumb": thumb,
      };
}
