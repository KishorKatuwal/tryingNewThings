import 'dart:convert';

List<BitCoinModel> bitCoinModelFromJson(String str) => List<BitCoinModel>.from(json.decode(str).map((x) => BitCoinModel.fromJson(x)));

String bitCoinModelToJson(List<BitCoinModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BitCoinModel {
  final String symbol;
  final String priceChange;
  final String priceChangePercent;
  final String weightedAvgPrice;
  final String prevClosePrice;
  final String lastPrice;
  final String lastQty;
  final String bidPrice;
  final String bidQty;
  final String askPrice;
  final String askQty;
  final String openPrice;
  final String highPrice;
  final String lowPrice;
  final String volume;
  final String quoteVolume;
  final int openTime;
  final int closeTime;
  final int firstId;
  final int lastId;
  final int count;

  BitCoinModel({
    required this.symbol,
    required this.priceChange,
    required this.priceChangePercent,
    required this.weightedAvgPrice,
    required this.prevClosePrice,
    required this.lastPrice,
    required this.lastQty,
    required this.bidPrice,
    required this.bidQty,
    required this.askPrice,
    required this.askQty,
    required this.openPrice,
    required this.highPrice,
    required this.lowPrice,
    required this.volume,
    required this.quoteVolume,
    required this.openTime,
    required this.closeTime,
    required this.firstId,
    required this.lastId,
    required this.count,
  });

  factory BitCoinModel.fromJson(Map<String, dynamic> json) => BitCoinModel(
    symbol: json["symbol"],
    priceChange: json["priceChange"],
    priceChangePercent: json["priceChangePercent"],
    weightedAvgPrice: json["weightedAvgPrice"],
    prevClosePrice: json["prevClosePrice"],
    lastPrice: json["lastPrice"],
    lastQty: json["lastQty"],
    bidPrice: json["bidPrice"],
    bidQty: json["bidQty"],
    askPrice: json["askPrice"],
    askQty: json["askQty"],
    openPrice: json["openPrice"],
    highPrice: json["highPrice"],
    lowPrice: json["lowPrice"],
    volume: json["volume"],
    quoteVolume: json["quoteVolume"],
    openTime: json["openTime"],
    closeTime: json["closeTime"],
    firstId: json["firstId"],
    lastId: json["lastId"],
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "symbol": symbol,
    "priceChange": priceChange,
    "priceChangePercent": priceChangePercent,
    "weightedAvgPrice": weightedAvgPrice,
    "prevClosePrice": prevClosePrice,
    "lastPrice": lastPrice,
    "lastQty": lastQty,
    "bidPrice": bidPrice,
    "bidQty": bidQty,
    "askPrice": askPrice,
    "askQty": askQty,
    "openPrice": openPrice,
    "highPrice": highPrice,
    "lowPrice": lowPrice,
    "volume": volume,
    "quoteVolume": quoteVolume,
    "openTime": openTime,
    "closeTime": closeTime,
    "firstId": firstId,
    "lastId": lastId,
    "count": count,
  };
}
