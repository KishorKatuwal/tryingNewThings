import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:own_project/features/real_time_crypto/crypto_model.dart';

import 'crypto_controller.dart';

class RealTimeCryptoScreen extends ConsumerStatefulWidget {
  static const String routeName = "/real-time-crypto-screen";

  const RealTimeCryptoScreen({super.key});

  @override
  ConsumerState<RealTimeCryptoScreen> createState() =>
      _RealTimeCryptoScreenState();
}

class _RealTimeCryptoScreenState extends ConsumerState<RealTimeCryptoScreen> {
  List<CryptoModel> cryptoModel = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Real Time Crypto Screen"),
      ),
      body: ref.watch(bitDataProvider).when(
          data: (data) {
            cryptoModel = data;
            return ListView.builder(
                itemCount: cryptoModel.length,
                itemBuilder: (context, index) {
                  final data = cryptoModel[index];
                  return Card(
                    elevation: 5,
                    color: (double.parse(data.changePercent24Hr)) > 0
                        ? Colors.green
                        : Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                data.name,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                data.symbol,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            data.priceUsd,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          },
          error: (err, trace) => Text(err.toString()),
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
