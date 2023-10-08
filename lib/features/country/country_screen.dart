import 'package:flutter/material.dart';
import 'package:own_project/features/country/country_model.dart';
import 'package:own_project/features/country/country_service.dart';

import '../../common/custom_button.dart';
import '../../common/show_snackbar.dart';

class CountryScreen extends StatefulWidget {
  static const String routeName = "/country-screen";

  const CountryScreen({super.key});

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  final CountryService countryService = CountryService();
  final nameController = TextEditingController();
  bool isLoading = false;
  late CountryModel countryModel;
  List<Country> country = [];
  String name = "";

  void getData() async {
    setState(() {
      isLoading = true;
    });
    final data =
        await countryService.checkCountry(predictionName: nameController.text);

    if (data[0]) {
      countryModel = data[1];
      country = countryModel.country;
      name = countryModel.name;
      setState(() {
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: nameController,
                // enabled: !isLoading,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                  // isLoading: isLoading,
                  text: "Check your Country",
                  onTap: () {
                    if (nameController.text.isEmpty) {
                      showSnackBar(context, "Please enter your name");
                    } else {
                      getData();
                    }
                  }),
              const SizedBox(
                height: 30,
              ),
              Text(name),

              country.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: country.length,
                      itemBuilder: (context, index) {
                        final dataa = country[index];
                        return Card(
                          child: Column(
                            children: [
                              Text(dataa.probability.toString()),
                              Text(dataa.countryId.toString()),
                            ],
                          ),
                        );
                      })
                  : Container()

              // gender.isEmpty
              //     ? Container()
              //     : SearchLoading(text: "You are a $gender", gender: gender),
            ],
          ),
        ),
      ),
    );
  }
}
