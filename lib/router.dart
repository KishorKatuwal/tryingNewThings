import 'package:flutter/material.dart';
import 'package:own_project/features/bit_coin/screens/all_bitcon_screen.dart';
import 'package:own_project/features/bit_coin/screens/each_bit_coin-screen.dart';
import 'package:own_project/features/game/screens/game_screen.dart';
import 'package:own_project/features/trying_map/trying_map.dart';
import 'package:own_project/models/bit_coin_model.dart';

import 'features/users/screens/user_screen.dart';
import 'home_screen/home_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case MyHomePage.routeName:
      return MaterialPageRoute(
          builder: (context) => const MyHomePage(
                title: "HomePage",
              ));

    case AllBitCoinScreen.routeName:
      return MaterialPageRoute(builder: (context) => const AllBitCoinScreen());

    case EachBitCoinScreen.routeName:
      final coinModel = settings.arguments as BitCoinModel;
      return MaterialPageRoute(
        builder: (context) => EachBitCoinScreen(
          coinModel: coinModel,
        ),
      );

    case UserScreen.routeName:
      return MaterialPageRoute(
          builder: (context) => const UserScreen());

      case TryingMapScreen.routeName:
      return MaterialPageRoute(
          builder: (context) => const TryingMapScreen());


    case GameScreen.routeName:
      return MaterialPageRoute(
          builder: (context) => const GameScreen());

    // case CreateGroupScreen.routeName:
    //   return MaterialPageRoute(builder: (context) => const CreateGroupScreen());
    //
    // case MobileChatScreen.routeName:
    //   final arguments = settings.arguments as Map<String, dynamic>;
    //   final name = arguments['name'];
    //   final uid = arguments['uid'];
    //   final isGroupChat = arguments['isGroupChat'];
    //   final profilePic = arguments['profilePic'];
    //   return MaterialPageRoute(
    //     builder: (context) => MobileChatScreen(
    //       name: name,
    //       uid: uid,
    //       isGroupChat: isGroupChat,
    //       profilePic: profilePic,
    //     ),
    //   );
    //
    // case StatusScreen.routeName:
    //   final status = settings.arguments as Status;
    //   return MaterialPageRoute(
    //     builder: (context) => StatusScreen(
    //       status: status,
    //     ),
    //   );
    //
    // case SelectContactsScreen.routeName:
    //   return MaterialPageRoute(
    //       builder: (context) => const SelectContactsScreen());
    //
    // case ConfirmStatusScreen.routeName:
    //   final file = settings.arguments as File;
    //   return MaterialPageRoute(
    //     builder: (context) => ConfirmStatusScreen(
    //       file: file,
    //     ),
    //   );
    //
    // case OTPScreen.routeName:
    //   final verificationID = settings.arguments as String;
    //   return MaterialPageRoute(
    //       builder: (context) => OTPScreen(verificationId: verificationID));

    default:
      return MaterialPageRoute(
          builder: (context) => const Scaffold(
                  body: Center(
                child: Text("This page doesn't exist!!"),
              )));
  }
}
