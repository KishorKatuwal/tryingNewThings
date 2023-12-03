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
  bool isFavourite = false;
  late SharedPreferences preferences;
  late List<String> bookmarkList;
  final TextEditingController nameController = TextEditingController();
  bool isLoading = false;

  Future<void> _loadPreferences() async {
    setState(() {
      isLoading = true;
    });
    preferences = await SharedPreferences.getInstance();
    isFavourite = preferences.getBool('bookmarkID') ?? false;
    bookmarkList = preferences.getStringList("places") ?? [];
    setState(() {
      isLoading = false;
    });
  }

  Future<void> _bookmarkPlace(String bookmarkPlace) async {
    isFavourite = await preferences.setBool(bookmarkPlace, true);
    bookmarkList.add(bookmarkPlace);
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
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration:
                        const InputDecoration(border: OutlineInputBorder()),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                      onTap: () {
                        _bookmarkPlace(nameController.text);
                      },
                      text: "Add to shared preferences",
                      color: Colors.blueGrey),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text("Saved Places"),
                  const SizedBox(
                    height: 20,
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: bookmarkList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(border: Border.all()),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(bookmarkList[index]),
                                IconButton(
                                    onPressed: () {
                                      _removeBookmarkPlace(bookmarkList[index]);
                                    },
                                    icon: const Icon(Icons.delete)),
                              ],
                            ),
                          ),
                        );
                      }),
                ],
              ),
            ),
    );
  }
}
