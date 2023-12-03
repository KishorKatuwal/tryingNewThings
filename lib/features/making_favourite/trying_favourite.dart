import 'package:flutter/material.dart';
import 'package:own_project/common/custom_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TryingFavouriteScreen extends StatefulWidget {
  static const String routeName = "/trying-favourite-string";

  const TryingFavouriteScreen({super.key});

  @override
  State<TryingFavouriteScreen> createState() => _TryingFavouriteScreenState();
}

class _TryingFavouriteScreenState extends State<TryingFavouriteScreen> {
  late bool isFavourite;
  late SharedPreferences preferences;
  late List<String> bookmarkList;

  Future<void> _loadPreferences() async {
    preferences = await SharedPreferences.getInstance();
    isFavourite = preferences.getBool('bookmarkID') ?? false;
    bookmarkList = preferences.getStringList("places") ?? [];
    setState(() {});
  }

  Future<void> _bookmarkPlace() async {
    isFavourite = await preferences.setBool('bookmarkID', true);
    bookmarkList.add("");
    await preferences.setStringList("places", bookmarkList);
    setState(() {});
  }

  Future<void> _removeBookmarkPlace(String name) async {
    bookmarkList.remove(name);
    await preferences.remove(name);
    await preferences.setStringList("places", bookmarkList);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourite Screen"),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isFavourite = !isFavourite;
                });
              },
              icon: Icon(isFavourite
                  ? Icons.favorite
                  : Icons.favorite_border_outlined)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
                onTap: () {},
                text: "Add to shared preferences",
                color: Colors.blueGrey),
          ],
        ),
      ),
    );
  }
}
