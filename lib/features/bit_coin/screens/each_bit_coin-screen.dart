import 'package:flutter/material.dart';
import 'package:own_project/models/bit_coin_model.dart';

class EachBitCoinScreen extends StatelessWidget {
  static const String routeName = '/each-bit-coin-screen';
  final BitCoinModel coinModel;

  const EachBitCoinScreen({Key? key, required this.coinModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = coinModel;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text(
                  data.symbol,
                  style: const TextStyle(fontSize: 30, color: Colors.black),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey, // Border color
                      width: 1.0, // Border width
                    ),
                  ),
                  child: DataTable(
                    dividerThickness: 5,

                    columnSpacing: 92, // Adjust the column spacing as needed
                    columns: const <DataColumn>[
                      DataColumn(
                        label: Text('Price'),
                      ),
                      DataColumn(
                        label: Text('Value'),
                      ),
                    ],
                    rows: <DataRow>[
                      DataRow(
                        cells: [
                          const DataCell(Text("Price Change")),
                          DataCell(Text(data.priceChange)),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          const DataCell(Text('Price Change%')),
                          DataCell(Text(data.priceChangePercent)),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          const DataCell(Text("Weighted Average Price")),
                          DataCell(Text(data.weightedAvgPrice)),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          const DataCell(Text("Previous Closing Price")),
                          DataCell(Text(data.prevClosePrice)),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          const DataCell(Text("Open Price")),
                          DataCell(Text(data.openPrice)),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          const DataCell(Text("High Price")),
                          DataCell(Text(data.highPrice)),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          const DataCell(Text("Low Price")),
                          DataCell(Text(data.lowPrice)),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          const DataCell(Text("BID Price")),
                          DataCell(Text(data.bidPrice)),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          const DataCell(Text("ASK Price")),
                          DataCell(Text(data.askPrice)),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Quantity",
                  style: TextStyle(fontSize: 24),
                ),
                descText(headText: "Ask Quantity", bodyText: data.askQty),
                descText(headText: "Bid Quantity", bodyText: data.bidQty),
                descText(headText: "Last Quantity", bodyText: data.lastQty),
                const Text(
                  "Volume",
                  style: TextStyle(fontSize: 24),
                ),
                descText(headText: "Volume", bodyText: data.volume),
                descText(headText: "Quote Volume", bodyText: data.quoteVolume),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget descText({
  required String headText,
  required String bodyText,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: RichText(
      text: TextSpan(
        text: '$headText : ',
        style: const TextStyle(color: Colors.black, fontSize: 18),
        // Default text style
        children: <TextSpan>[
          TextSpan(
            text: bodyText,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
        ],
      ),
    ),
  );
}
