import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:localnoti/main.dart';

class NotifiLocal extends StatefulWidget {
  const NotifiLocal({super.key});

  @override
  State<NotifiLocal> createState() => _NotifiLocalState();
}

class _NotifiLocalState extends State<NotifiLocal> {
  @override
  void initState() {
    super.initState();
    requestPermission();
  }

  void requestPermission() async {
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestFullScreenIntentPermission();
  }

  Future<void> showNotification() async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      channelDescription: 'Notification Channel',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.show(
      id: 0,
      title: "Flutter Notification",
      body: "This is a local notification",
      notificationDetails: notificationDetails,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Local Notification"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: showNotification,
          child: const Text("Show Notification"),
        ),
      ),
    );
  }
}