import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:own_project/models/bit_coin_model.dart';

final bitcoinRepositoryProvider = Provider(
  (ref) => BitCoinRepository(),
);

class BitCoinRepository {
  BitCoinRepository();

  String bitCoinUrl = "https://data.binance.com/api/v3/ticker/24hr";

  Future<List<BitCoinModel>> getBitCoinData() async {
    List<BitCoinModel> bitCoinData = [];
    try {
      http.Response res = await http.get(Uri.parse(bitCoinUrl), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      });
      if (res.statusCode == 200) {
        bitCoinData = bitCoinModelFromJson(res.body);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    return bitCoinData;
  }
}
