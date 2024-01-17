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
    final cryptoDataAsyncValue = ref.watch(bitDataProvider);
    final cryptoDataStream = cryptoDataAsyncValue;


    return Scaffold(
      appBar: AppBar(
        title: const Text("Real Time Crypto Screen"),
      ),
      body: Container(),
      // body: StreamBuilder<List<CryptoModel>>(
      //   stream: cryptoDataStream.value, // Your StreamProvider
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return CircularProgressIndicator(); // Show a loading indicator
      //     } else if (snapshot.hasError) {
      //       return Text('Error: ${snapshot.error}'); // Show an error message
      //     } else if (snapshot.hasData) {
      //       final cryptoData = snapshot.data!; // Get the latest data
      //       // Display the cryptoData in your UI (e.g., ListView, GridView, etc.)
      //       return ListView.builder(
      //         itemCount: cryptoData.length,
      //         itemBuilder: (context, index) {
      //           final crypto = cryptoData[index];
      //           return ListTile(
      //             title: Text(crypto.name),
      //             subtitle: Text('Price: '),
      //           );
      //         },
      //       );
      //     } else {
      //       return Text('No data available.'); // Handle no data case
      //     }
      //   },
      // ),

      // body: ref.watch(bitDataProvider).when(
      //       data: (data) {
      //         cryptoModel = data;
      //         return ListView.builder(
      //             itemCount: cryptoModel.length,
      //             itemBuilder: (context, index) {
      //               final data = cryptoModel[index];
      //               return Card(
      //                 elevation: 5,
      //                 color: (double.parse(data.changePercent24Hr)) > 0
      //                     ? Colors.green
      //                     : Colors.red,
      //                 child: Padding(
      //                   padding: const EdgeInsets.all(8.0),
      //                   child: Column(
      //                     children: [
      //                       Row(
      //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                         children: [
      //                           Text(
      //                             data.name,
      //                             style: const TextStyle(
      //                                 fontSize: 20,
      //                                 fontWeight: FontWeight.bold),
      //                           ),
      //                           Text(
      //                             data.symbol,
      //                             style: const TextStyle(
      //                                 fontSize: 20,
      //                                 fontWeight: FontWeight.bold),
      //                           ),
      //                         ],
      //                       ),
      //                       const SizedBox(
      //                         height: 5,
      //                       ),
      //                       Text(
      //                         data.priceUsd,
      //                         style: const TextStyle(
      //                             color: Colors.white,
      //                             fontSize: 20,
      //                             fontWeight: FontWeight.bold),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //               );
      //             });
      //       },
      //       error: (err, trace) => Text(err.toString()),
      //       loading: () => const Center(
      //         child: CircularProgressIndicator(),
      //       ),
      //     ),
    );
  }
}
