import 'package:flutter/material.dart';
import 'package:own_project/features/mario/ambiio_model.dart';
import 'package:own_project/features/mario/ambiio_service.dart';

class AmibboScreen extends StatefulWidget {
  static const String routeName = "/amibbo-screen";

  const AmibboScreen({super.key});

  @override
  State<AmibboScreen> createState() => _AmibboScreenState();
}

class _AmibboScreenState extends State<AmibboScreen> {
  final AmbiioService ambiioService = AmbiioService();
  late AmiioModel amiioModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: ambiioService.getBitCoinData(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else if (snapshot.hasData) {
              amiioModel = snapshot.data;
              return Column(
                children: [
                  Text(amiioModel.amiibo[0].amiiboSeries),
                  Text(amiioModel.amiibo[1].amiiboSeries),
                  Text(amiioModel.amiibo[2].amiiboSeries),
                ],
              );
            } else {
              return const Center(
                child: Text("No data"),
              );
            }
          }),
    );
  }
}
