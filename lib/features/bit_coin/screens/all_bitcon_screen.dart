import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:own_project/features/bit_coin/screens/each_bit_coin-screen.dart';

import '../controller/bitcoin_controller.dart';

class AllBitCoinScreen extends ConsumerWidget {
  static const String routeName = '/all-bitCoin-Screen';

  const AllBitCoinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: ref.watch(bitDatProvider).when(
        data: (bitData) =>
            ListView.builder(
              itemCount: bitData.length,
              itemBuilder: (context, index) {
                final data = bitData[index];
                double price = double.parse(data.priceChangePercent);
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Card(
                    color: price.isNegative ? Colors.red : Colors.green,
                    child: ListTile(
                      onTap: () =>
                          Navigator.pushNamed(
                              context, EachBitCoinScreen.routeName,
                              arguments: data),
                      title: Text(
                        data.symbol,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
        error: (err, trace) => Text(err.toString()),
        loading: () =>
        const Center(
          child: CircularProgressIndicator(),
        ),),
    );
  }
}

