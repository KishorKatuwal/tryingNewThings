import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
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
  late double lat;
  late double lon;
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentLocation();
  }

  void assignValue() async {
    await getCurrentLocation();
  }

  Future<void> getCurrentLocation() async {
    late double latitude;
    late double longitude;
    try {
      setState(() {
        isLoading = true;
      });
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      latitude = position.latitude;
      longitude = position.longitude;
      lon = longitude;
      lat = latitude;
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Data"),
      ),
      body: isLoading
          ? const Center(child:  CircularProgressIndicator())
          : SingleChildScrollView(
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
                                enableScrollWheel: true,
                                keepAlive: true,
                                zoom: 18,
                                maxZoom: 18,
                                 minZoom: 3,
                                slideOnBoundaries: true,
                                center: LatLng(double.parse("27.71049"),
                                    double.parse("85.34868")),
                              ),
                              children: [
                                TileLayer(
                                  urlTemplate:
                                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                                  subdomains: const ["a", "b", "c"],
                                ),
                                MarkerLayer(
                                  markers: [
                                    Marker(
                                      point: LatLng(double.parse("27.71049"),
                                          double.parse("85.34868")),
                                      builder: (context) {
                                        return const Icon(
                                          Icons.pin_drop,
                                          color: Colors.red,
                                          size: 40,
                                        );
                                      },
                                    ),
                                    Marker(
                                      point: LatLng(lat, lon),
                                      builder: (context) {
                                        return const Icon(
                                          Icons.circle,
                                          color: Colors.blue,
                                          size: 30,
                                        );
                                      },
                                    ),
                                  ],
                                )
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
