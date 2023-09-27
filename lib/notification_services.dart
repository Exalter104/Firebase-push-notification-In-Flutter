import 'package:app_settings/app_settings.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

class NotificationServices {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  // this function you use anywhere to any application
  void requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    if (kDebugMode) {
      print(
          "Requested permission. Authorization status: ${settings.authorizationStatus}");
    }

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      if (kDebugMode) {
        print("User granted permission");
      }
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      if (kDebugMode) {
        print("User provisional permission");
      }
    } else {
      if (kDebugMode) {
        print("User denied permission");
      }
      AppSettings.openAppSettings();
    }
  }
}
