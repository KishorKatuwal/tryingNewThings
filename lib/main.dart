import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:own_project/notification/notification_service.dart';
import 'package:own_project/router.dart';

import 'home_screen/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // OneSignal.initialize("088551f9-b784-4bf1-bc91-a1d61a65d9eb");
  //OneSignal.initialize("b25cdc3d-f71f-4724-8f1c-073e773523bc");
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final NotificationService notificationService = NotificationService();
  bool isOneSignalListenerAdded = false;

  @override
  void initState() {
    super.initState();
    //initPlatformState();
    //getOneSignalPlayerId();
  }

  Future<void> initPlatformState() async {
    if (!isOneSignalListenerAdded) {
      handleOneSignal();
      isOneSignalListenerAdded = true;
    }
  }

  void getOneSignalPlayerId() async {
    await Future.delayed(const Duration(seconds: 2));
    String? playerId = OneSignal.User.pushSubscription.id;
    print("The player if is $playerId");
  }

  void handleOneSignal() {
    OneSignal.Notifications.requestPermission(true);
    OneSignal.Notifications.addForegroundWillDisplayListener((event) {
      try {
        event.preventDefault();
        notificationService.showBigPictureNotificationURL(
          notificationId: event.notification.notificationId,
          title: "From Main title",
          url: event.notification.bigPicture!,
          body: "From Main body",
        );
      } catch (e) {
        event.notification.display();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Own Project',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: false,
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const MyHomePage(title: 'Home Page'),
    );
  }
}
