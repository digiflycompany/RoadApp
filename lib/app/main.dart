import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/core/helpers/functions/initialize_services.dart';
import 'package:roadapp/core/helpers/state_managment/bloc_observer.dart';
import 'package:roadapp/app/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeServices();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}
