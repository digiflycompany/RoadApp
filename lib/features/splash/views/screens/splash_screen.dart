import 'package:flutter/material.dart';
import 'package:roadapp/features/splash/views/widgets/splash.dart';
import 'package:roadapp/features/splash/views/widgets/splash_background.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
          alignment: Alignment.center, children: [SplashBackground(), Splash()]),
    );
  }
}