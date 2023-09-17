import 'dart:collection';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;

class NotificationService {
  int finalId = 0;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final AndroidInitializationSettings androidInitializationSettings =
      const AndroidInitializationSettings('@mipmap/ic_launcher');

  void initialiseNotifications() async {
    InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
    );
    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<Uint8List> _getByteArrayFromUrl(String url) async {
    final http.Response response = await http.get(Uri.parse(url));
    return response.bodyBytes;
  }

// Define a Set to store processed IDs
  Queue<int> processedIds = Queue<int>();

  Future<void> showBigPictureNotificationURL({
    required String notificationId,
    required String title,
    required String url,
    required String body,
  }) async {
    String trimmedUuid = notificationId.substring(0, 5);
    int intValue = int.parse(trimmedUuid, radix: 16);
    if (!processedIds.contains(intValue)) {
      processedIds.add(intValue);
      if (processedIds.length > 5) {
        processedIds.removeFirst();
      }
      final ByteArrayAndroidBitmap bigPicture =
          ByteArrayAndroidBitmap(await _getByteArrayFromUrl(url));
      final BigPictureStyleInformation bigPictureStyleInformation =
          BigPictureStyleInformation(bigPicture,
              hideExpandedLargeIcon: false,
              htmlFormatContentTitle: false,
              htmlFormatSummaryText: true);
      final AndroidNotificationDetails androidNotificationDetails =
          AndroidNotificationDetails('big text channel id', 'New Updates',
              channelDescription: 'Immediate updates',
              importance: Importance.max,
              priority: Priority.high,
              styleInformation: bigPictureStyleInformation);
      final NotificationDetails notificationDetails =
          NotificationDetails(android: androidNotificationDetails);
      await _flutterLocalNotificationsPlugin.show(
          intValue, title, body, notificationDetails);
    }
  }
}

class CustomNotificationLayout extends StatelessWidget {
  final String imageUrl;

  const CustomNotificationLayout({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Custom Notification',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
        const SizedBox(height: 8.0),
        const Text('Tap to open the app and view details.'),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Open App'),
        ),
        ExpansionTile(
          title: const Text('Additional Info'),
          children: [
            // Add an Image widget here to display the image.
            Image.network(imageUrl),
            // Add any additional content you want to show when expanded.
            const Text('More information goes here.'),
          ],
        ),
      ],
    );
  }
}
