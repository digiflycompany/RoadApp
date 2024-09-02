import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/di/di.dart';
import 'package:roadapp/core/functions/general_functions.dart';
import 'package:roadapp/services/shared_preferences/preferences_helper.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> initializeServices() async {
  // await initializeFirebase();
  PreferencesHelper.init();
  await ScreenUtil.ensureScreenSize();
  // await fetchAndStoreFCMToken();
  // await FirebaseApi().initNotification();
  // تهيئة إعدادات الإشعارات لنظام Android
  // var initializationSettingsAndroid =
  //     const AndroidInitializationSettings('@mipmap/ic_launcher');
  // إعدادات التهيئة العامة لمكونات الإشعارات
  // var initializationSettings =
  //     InitializationSettings(android: initializationSettingsAndroid);
  // تهيئة ال plugin بالإعدادات المحددة
  // flutterLocalNotificationsPlugin.initialize(
  //   initializationSettings,
  //   onDidReceiveBackgroundNotificationResponse: (details) {
  //     AppRoutes.routes.push(Routes.notificationView);
  //   },
  //   onDidReceiveNotificationResponse: (details) {
  //     AppRoutes.routes.push(Routes.notificationView);
  //   },
  // );
  await EasyLocalization.ensureInitialized();
  // DioHelper.init();
  GeneralFunctions.setPreferredOrientation();
  await setupServiceLocator();
}
