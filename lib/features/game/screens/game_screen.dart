import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:own_project/common/custom_button.dart';
import 'package:own_project/common/search_loading.dart';
import 'package:own_project/common/show_snackbar.dart';
import 'package:own_project/features/game/controller/game_controller.dart';
import 'package:own_project/features/game/model/user_gender_model.dart';

class GameScreen extends ConsumerStatefulWidget {
  static const String routeName = "/game-screen";

  const GameScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends ConsumerState<GameScreen> {
  final emailController = TextEditingController();
  String gender = "";
  late UserGenderModel userGenderModel;
  bool isLoading = false;

  void checkStatus({required String name}) async {
    setState(() {
      isLoading = true;
    });
    final data = await ref
        .read(gameControllerProvider)
        .checkIdentity(predictionName: name);
    if (data[0]) {
      userGenderModel = data[1];
      setState(() {
        gender = userGenderModel.gender;
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      if(!context.mounted) return;
      showSnackBar(context, "Please enter a valid name");
    }
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
                controller: emailController,
                enabled: !isLoading,
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
                  isLoading: isLoading,
                  text: "Check your Identity",
                  onTap: () {
                    if (emailController.text.isEmpty) {
                      showSnackBar(context, "Please enter your name");
                    } else {
                      checkStatus(name: emailController.text.trim());
                    }
                  }),
              const SizedBox(
                height: 30,
              ),
              gender.isEmpty
                  ? Container()
                  : SearchLoading(text: "You are a $gender", gender: gender),
            ],
          ),
        ),
      ),
    );
  }
}
