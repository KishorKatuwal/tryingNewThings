import 'dart:convert';

List<CryptoModel> cryptoModelFromJson(String str) => List<CryptoModel>.from(
    json.decode(str)["data"].map((x) => CryptoModel.fromJson(x)));

class CryptoModel {
  final String id;
  final String rank;
  final String symbol;
  final String name;
  final String supply;
  final String maxSupply;
  final String marketCapUsd;
  final String volumeUsd24Hr;
  final String priceUsd;
  final String changePercent24Hr;
  final String vwap24Hr;
  final String explorer;

  CryptoModel({
    required this.id,
    required this.rank,
    required this.symbol,
    required this.name,
    required this.supply,
    required this.maxSupply,
    required this.marketCapUsd,
    required this.volumeUsd24Hr,
    required this.priceUsd,
    required this.changePercent24Hr,
    required this.vwap24Hr,
    required this.explorer,
  });

  factory CryptoModel.fromJson(Map<String, dynamic> json) => CryptoModel(
        id: json["id"],
        rank: json["rank"],
        symbol: json["symbol"],
        name: json["name"],
        supply: json["supply"],
        maxSupply: json["maxSupply"] ?? "NA",
        marketCapUsd: json["marketCapUsd"],
        volumeUsd24Hr: json["volumeUsd24Hr"],
        priceUsd: json["priceUsd"],
        changePercent24Hr: json["changePercent24Hr"],
        vwap24Hr: json["vwap24Hr"] ?? "NA",
        explorer: json["explorer"] ?? "NA",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "rank": rank,
        "symbol": symbol,
        "name": name,
        "supply": supply,
        "maxSupply": maxSupply,
        "marketCapUsd": marketCapUsd,
        "volumeUsd24Hr": volumeUsd24Hr,
        "priceUsd": priceUsd,
        "changePercent24Hr": changePercent24Hr,
        "vwap24Hr": vwap24Hr,
        "explorer": explorer,
      };
}
