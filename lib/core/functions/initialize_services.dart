import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/cach_helper/cache_helper.dart';
import 'package:roadapp/core/di/di.dart';
import 'package:roadapp/core/functions/general_functions.dart';

Future<void> initializeServices() async {
  CacheHelper().initPrefs();
  await ScreenUtil.ensureScreenSize();
  // DioHelper.init();
  GeneralFunctions.setPreferredOrientation();
  await setupServiceLocator();
}
