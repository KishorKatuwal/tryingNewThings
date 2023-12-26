import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:own_project/features/real_time_crypto/crypto_model.dart';
import 'package:http/http.dart' as http;

final cryptoRepositoryProvider = Provider((ref) => CryptoRepository());

class CryptoRepository {
  String uri = "https://api.coincap.io/v2/assets";

  StreamController<List<CryptoModel>> cryptoDataController =
      StreamController<List<CryptoModel>>();

  Stream<List<CryptoModel>> getCryptoData() {
    try {
      http.get(Uri.parse(uri), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      }).then((res) {
        if (res.statusCode == 200) {
          List<CryptoModel> cryptoData = cryptoModelFromJson(res.body);
          cryptoDataController.add(cryptoData);
          // Add data to the stream
        }
      }).catchError((e) {
        cryptoDataController
            .addError(Exception(e.toString())); // Add error to the stream
      });
    } catch (e) {
      cryptoDataController
          .addError(Exception(e.toString())); // Add error to the stream
    }
    return cryptoDataController.stream;
  }
}
