import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:own_project/features/users/controller/user_controller.dart';
import 'package:own_project/features/users/model/user_model.dart';

class UserScreen extends ConsumerStatefulWidget {
  static const routeName = "/user-screen";

  const UserScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends ConsumerState<UserScreen> {
  UserModel? userModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Data"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: FutureBuilder<UserModel>(
              future: ref.watch(userControllerProvider).getUserData(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return const Center(child: Text("No data"));
                } else if (snapshot.hasData) {
                  userModel = snapshot.data;
                  final data = userModel!;
                  return Column(children: [
                    Text(data.name),
                    Text(data.username),
                    Text(data.address.city),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 300,
                      child: FlutterMap(
                        options: MapOptions(
                          keepAlive: true,
                          zoom: 13,
                          maxZoom: 18,
                          slideOnBoundaries: true,
                          center: LatLng(double.parse("27.717245"),
                              double.parse("85.323959")),
                        ),
                        children: [
                          TileLayer(
                            urlTemplate:
                                "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                            subdomains: const ["a", "b", "c"],
                          ),
                        ],
                      ),
                    ),
                  ]);
                } else {
                  return const Text("No data");
                }
              }),
        ),
      ),
    );
  }
}
