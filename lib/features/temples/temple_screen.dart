import 'package:flutter/material.dart';
import 'package:own_project/features/temples/temple_model.dart';
import 'package:own_project/features/temples/temple_service.dart';

class TempleScreen extends StatefulWidget {
  static const String routeName = "/temple-screen";

  const TempleScreen({super.key});

  @override
  State<TempleScreen> createState() => _TempleScreenState();
}

class _TempleScreenState extends State<TempleScreen> {
  final TempleService templeService = TempleService();
  List<TempleModel> templeModel = [];
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Temple Screen"),
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                ListView(shrinkWrap: true, children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Search places',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ]),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  color: Colors.blueGrey,
                  width: double.infinity,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        "Popular Historical Places",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                ),
                const Expanded(child: ReusableWidget()),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  color: Colors.blueGrey,
                  width: double.infinity,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        "Popular Historical Places",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: FutureBuilder(
                      future: templeService.getTempleData(),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text(snapshot.error.toString()),
                          );
                        } else if (snapshot.hasData) {
                          templeModel = snapshot.data;
                          return ListView.builder(
                              itemCount: templeModel.length,
                              itemBuilder: (context, index) {
                                final data = templeModel[index];
                                return Card(
                                  child: Column(
                                    children: [
                                      Image.network(
                                        data.image,
                                        height: 300,
                                      ),
                                      Text(data.name),
                                      Text(data.description)
                                    ],
                                  ),
                                );
                              });
                        } else {
                          return const Center(
                            child: Text("No data Available"),
                          );
                        }
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ReusableWidget extends StatefulWidget {
  const ReusableWidget({super.key});

  @override
  State<ReusableWidget> createState() => _ReusableWidgetState();
}

class _ReusableWidgetState extends State<ReusableWidget> {
  final TempleService templeService = TempleService();
  List<TempleModel> templeModel = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: templeService.getTempleData(),
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
            templeModel = snapshot.data;
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: templeModel.length,
                itemBuilder: (context, index) {
                  final data = templeModel[index];
                  return Card(
                    child: Column(
                      children: [
                        Image.network(
                          data.image,
                          height: 200,
                        ),
                        Text(data.name),
                        Container(width: 300, child: Text(data.description)),
                      ],
                    ),
                  );
                });
          } else {
            return const Center(
              child: Text("No data Available"),
            );
          }
        });
  }
}
