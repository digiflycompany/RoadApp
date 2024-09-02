import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/core/functions/initialize_services.dart';
import 'package:roadapp/core/functions/restart_app.dart';
import 'package:roadapp/core/state_managment/bloc_observer.dart';
import 'my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeServices();
  Bloc.observer = MyBlocObserver();
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
