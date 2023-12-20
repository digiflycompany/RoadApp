import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:roadapp2/services/dio_helper/dio_helper.dart';
import 'package:roadapp2/services/shared_preferences/preferences_helper.dart';
import 'package:roadapp2/shared/functions/general_functions.dart';
import 'package:roadapp2/shared/functions/restart_app.dart';

import 'my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  PreferencesHelper.init();
  DioHelper.init();
  GeneralFunctions.setPreferredOrientation();
  runApp(

    EasyLocalization(
      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
      ],
      startLocale: const Locale('ar'),
      path: 'assets/translations',
      child: const RestartWidget(child: MyApp()),
    ),
  );
}
