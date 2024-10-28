import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:roadapp/core/helpers/cache_helper/cache_helper.dart';
import 'package:roadapp/core/dependency_injection/di.dart';
import 'package:roadapp/core/helpers/functions/general_functions.dart';

Future<void> initializeServices() async {
  CacheHelper().initPrefs();
  await ScreenUtil.ensureScreenSize();
  GeneralFunctions.setPreferredOrientation();
  await setupServiceLocator();
  await Hive.initFlutter();
  await Hive.openBox('complexDataBox');
}