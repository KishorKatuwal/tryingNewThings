import 'package:flutter/material.dart';
import 'package:own_project/features/computer_games/computer_game_service.dart';

import 'computer_game_model.dart';

class ComputerGameScreen extends StatefulWidget {
  static const String routeName = "/computer-game-screen";

  const ComputerGameScreen({super.key});

  @override
  State<ComputerGameScreen> createState() => _ComputerGameScreenState();
}

class _ComputerGameScreenState extends State<ComputerGameScreen> {
  final ComputerGameService computerGameService = ComputerGameService();
  List<ComputerGamesModel> computerGameModel = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Computer Games"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                  future: computerGameService.getComputerGames(),
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
                      computerGameModel = snapshot.data;
                      return ListView.builder(
                          itemCount: computerGameModel.length,
                          itemBuilder: (context, index) {
                            final data = computerGameModel[index];
                            return Card(
                                elevation: 8,
                                margin:
                                    const EdgeInsets.only(bottom: 10, top: 3),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Image.network(
                                            data.thumb,
                                            width: 100,
                                            height: 100,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            width: 1, // Divider width
                                            height: 100, // Divider height
                                            color:
                                                Colors.black, // Divider color
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          SizedBox(
                                            width: 220,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  data.title,
                                                  maxLines: 3,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 22,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      decoration: BoxDecoration(
                                                        color: Colors.green,
                                                        // You can choose your own color
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          const Icon(
                                                            Icons.star,
                                                            color: Colors.white,
                                                            size: 18.0,
                                                          ),
                                                          const SizedBox(
                                                              width: 4.0),
                                                          Text(
                                                            data.dealRating,
                                                            style:
                                                                const TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 16.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      decoration: BoxDecoration(
                                                        color: Colors.green,
                                                        // You can choose your own color
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          const Icon(
                                                            Icons.attach_money,
                                                            color: Colors.white,
                                                            size: 18.0,
                                                          ),
                                                          const SizedBox(
                                                              width: 4.0),
                                                          Text(
                                                            "\$ ${data.normalPrice}",
                                                            style:
                                                                const TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 16.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                const SizedBox(
                                                  width: double.infinity,
                                                  child: Text(
                                                    "Click here to know more...",
                                                    textAlign: TextAlign.end,
                                                    style: TextStyle(
                                                        color: Colors.blueGrey,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ));
                          });
                    } else {
                      return const Center(
                        child: Text("No data available"),
                      );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
