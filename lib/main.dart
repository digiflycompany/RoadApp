import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/core/functions/device_preview_app.dart';
import 'package:roadapp/core/functions/initialize_services.dart';
import 'package:roadapp/core/state_managment/bloc_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeServices();
  Bloc.observer = MyBlocObserver();
  runApp(
    DevicePreviewApp()
  );
}
