import 'package:flutter/material.dart';
import 'package:roadapp/features/splash/views/screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  static SharedPreferences? preferences;

  static void init() async {
    preferences = await SharedPreferences.getInstance();
  }

  static Future<void> saveToken({required String token}) async {
    await preferences?.setString("token", token);
  }

  static String? getToken() {
    return preferences?.getString("token");
  }

  static Future<void> saveLang({required String lang}) async {
    await preferences?.setString("lang", lang);
  }

  static Future<void> saveIsVendor({required bool isVendor}) async {
    await preferences?.setBool("isVendor", isVendor);
  }

  static bool get isVendor {
    return preferences?.getBool("isVendor") ?? false;
  }

  static String? getLang() {
    return preferences?.getString("lang") ?? 'ar';
  }

  static Future saveIsFirstOpenApp({required bool value}) async {
    await preferences?.setBool("isFirstOpenApp", value);
  }

  static bool get isFirstOpenApp {
    return preferences?.getBool("isFirstOpenApp") ?? false;
  }

  static Future saveEnableNotifications(
      {required bool isEnableNotification}) async {
    await preferences?.setBool("enableNotification", isEnableNotification);
  }

  static bool get isEnableNotifications =>
      preferences?.getBool("enableNotification") ?? false;

  static Future saveKeepMeLogged({required bool keepMeLogged}) async {
    await preferences?.setBool("keepMeLogged", keepMeLogged);
  }

  static bool get isKeptLogged {
    return preferences?.getBool("keepMeLogged") ?? false;
  }

  static Future<void> saveIsVisitor({required bool isVisitor}) async {
    await preferences?.setBool("isVisitor", isVisitor);
  }

  // static bool get isVisitor {
  //   return preferences?.getBool("isVisitor") ?? false;
  // }

  // static Future<void> saveUserModel({UserModel? userModel}) async {
  //   await preferences?.setString('userModel', json.encode(userModel));
  // }
  //
  // static UserModel? get getUserModel {
  //   if (preferences?.getString('userModel') != null) {
  //     return UserModel.fromJson(
  //         json.decode('${preferences?.getString('userModel')}'));
  //   }
  //   return null;
  // }
  //
  // static String get getName {
  //   UserModel? userModel = UserModel.fromJson(
  //       json.decode('${preferences?.getString('userModel')}'));
  //   return userModel.user?.name ?? '';
  // }

  static void logOut() {
    preferences?.remove('token');
    preferences?.remove('userModel');
    preferences?.remove('keepMeLogged');
    preferences?.remove('isVisitor');
    preferences?.setBool('isVisitor', false);
  }

  static Widget get applicationFirstPage {
    // return PreferencesHelper.isKeptLogged == true
    //     ? BottomNavigationScreen()
    //     : PreferencesHelper.isFirstOpenApp
    //         ? LoginScreen()
    //         : IntroductionScreen();
   return const SplashScreen();
 }
}
