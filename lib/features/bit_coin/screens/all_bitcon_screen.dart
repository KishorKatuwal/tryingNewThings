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
          data: (bitData) => ListView.builder(
                itemCount: bitData.length,
                itemBuilder: (context, index) {
                  final data = bitData[index];
                  double price = double.parse(data.priceChangePercent);
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Card(
                      color: price.isNegative ? Colors.red : Colors.green,
                      child: ListTile(
                        onTap: () => Navigator.pushNamed(
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
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}

// class AllBitCoinScreen extends ConsumerWidget {
//   static const String routeName = '/all-bitCoin-Screen';
//
//   const AllBitCoinScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final bitcoinController = ref.watch(bitCoinControllerProvider);
//
//     List<BitCoinModel> bitModel=[];
//
//     return Scaffold(
//       appBar: AppBar(),
//       body: FutureBuilder<List<BitCoinModel>>(
//         future: bitcoinController.getBitCoinData(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text('Error: ${snapshot.error}'),
//             );
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return const Center(
//               child: Text('No data available'),
//             );
//           } else {
//             // Build your UI using snapshot.data, which contains the Bitcoin data
//             bitModel = snapshot.data!;
//             return ListView.builder(
//               itemCount: snapshot.data!.length,
//               itemBuilder: (context, index) {
//                 final data = bitModel[index];
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(data.symbol),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }
