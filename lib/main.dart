import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/core/helpers/functions/initialize_services.dart';
import 'package:roadapp/core/helpers/state_managment/bloc_observer.dart';
import 'package:roadapp/my_app.dart';
import 'package:sentry_flutter/sentry_flutter.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeServices();
  Bloc.observer = MyBlocObserver();
  if (kReleaseMode) {
    await SentryFlutter.init((options) {
      options.dsn =
          'https://422acaf1f283f5d78d586d7ea0afcb38@o4508109683032064.ingest.de.sentry.io/4508109695615056';
      options.tracesSampleRate = .01;
    }, appRunner: () => runApp(const MyApp()));
  } else {
    runApp(const MyApp());
  }
}