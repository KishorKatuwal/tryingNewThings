import 'package:flutter/material.dart';
import 'package:own_project/features/country/country_screen.dart';
import 'package:own_project/features/gpt_4_code/GPTGame.dart';
import 'package:own_project/features/making_favourite/trying_favourite.dart';
import 'package:own_project/features/mario/mario_screen.dart';
import 'package:own_project/features/temples/temple_screen.dart';
import 'package:own_project/features/users/screens/user_screen.dart';

import '../common/custom_button.dart';
import '../features/bit_coin/screens/all_bitcon_screen.dart';
import '../features/computer_games/computer_games_screen.dart';
import '../features/game/screens/game_screen.dart';
import '../features/leaflet_map/LeafLetScreen.dart';
import '../features/pdf_reader/pdf_reader.dart';
import '../features/reading_text/reading_text.dart';
import '../features/real_time_crypto/crypto_screen.dart';
import '../notification/notification_service.dart';

class MyHomePage extends StatefulWidget {
  static const String routeName = '/home-screen';

  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  NotificationService notificationService = NotificationService();
  String text = "Let's Begin";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            children: [
              CustomButton(
                  text: "Values",
                  onTap: () {
                    Navigator.pushNamed(context, AllBitCoinScreen.routeName);
                  }),
              CustomButton(
                text: "User Data",
                onTap: () => Navigator.pushNamed(context, UserScreen.routeName),
              ),
              CustomButton(
                text: "RealTime-Crypto",
                onTap: () => Navigator.pushNamed(
                    context, RealTimeCryptoScreen.routeName),
              ),
              CustomButton(
                text: "Push Notification",
                onTap: () {
                  notificationService.initialiseNotifications();
                  notificationService.showBigPictureNotificationURL(
                    notificationId: "0",
                    body: "Local Body",
                    title: "Local Title",
                    url:
                        "https://www.consultancynepal.com/cnbackend/public/uploads/events/IMG-646340ea99f126.94825106.webp",
                  );
                },
              ),
              CustomButton(
                text: "Game",
                onTap: () => Navigator.pushNamed(context, GameScreen.routeName),
              ),
              CustomButton(
                text: "PDF READER",
                onTap: () =>
                    Navigator.pushNamed(context, PDFReaderScreen.routeName),
              ),
              CustomButton(
                text: "Reading Text",
                onTap: () =>
                    Navigator.pushNamed(context, ReadingTextScreen.routeName),
              ),
              CustomButton(
                text: "PDF READER",
                onTap: () =>
                    Navigator.pushNamed(context, PDFReaderScreen.routeName),
              ),
              CustomButton(
                text: "Marios",
                onTap: () =>
                    Navigator.pushNamed(context, AmibboScreen.routeName),
              ),
              CustomButton(
                text: "Compute Game Screen",
                onTap: () =>
                    Navigator.pushNamed(context, ComputerGameScreen.routeName),
              ),
              CustomButton(
                text: "Temple Screen",
                onTap: () =>
                    Navigator.pushNamed(context, TempleScreen.routeName),
              ),
              CustomButton(
                text: "Country Screen",
                onTap: () =>
                    Navigator.pushNamed(context, CountryScreen.routeName),
              ),
              CustomButton(
                text: "Leaflet MAP Screen",
                onTap: () =>
                    Navigator.pushNamed(context, LeafLetScreen.routeName),
              ),
              CustomButton(
                text: "Trying Favourite Screen",
                onTap: () => Navigator.pushNamed(
                    context, TryingFavouriteScreen.routeName),
              ),
              CustomButton(
                text: "GPT-4 Code",
                onTap: () =>
                    Navigator.pushNamed(context, GenderAvatar.routeName),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
