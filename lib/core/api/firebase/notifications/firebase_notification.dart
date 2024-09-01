import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'local_notification.dart';

class FirebaseCustomNotification {
  static final messaging = FirebaseMessaging.instance;

  static NotificationSettings? settings;

  static Future<void> firebaseMessagingAppOpen() async {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      if (kDebugMode) {
        String? token = await FirebaseMessaging.instance.getToken();
        print('Notification data: ${message.data}');
        print('Token $token');
      }
    });
  }

  static Future<void> firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {}

  static Future<bool> requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission();

    return settings.authorizationStatus == AuthorizationStatus.authorized;
  }

  static Future<void> setUpFirebase({required BuildContext context}) async {
    bool notificationStatus = await requestNotificationPermission();
    if (notificationStatus) {
      await CustomLocalNotification.setupLocalNotifications();
      FirebaseMessaging.onBackgroundMessage(
          FirebaseCustomNotification.firebaseMessagingBackgroundHandler);
      FirebaseMessaging.onMessage
          .listen(CustomLocalNotification.showFlutterNotification);
      FirebaseMessaging.onMessageOpenedApp
          .listen((CustomLocalNotification.onMessageOpenedApp));
      if (kDebugMode) {
        String? token = await FirebaseMessaging.instance.getToken();
        print('FIREBASE TOKEN: $token');
      }
    }
  }
}
