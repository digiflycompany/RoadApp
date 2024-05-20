import 'package:flutter/material.dart';
import 'package:roadapp/my_app.dart';

class AppNavigation {
  static const int _navigationMilliSeconds = 300;

  static void back() {
    navigatorKey.currentState!.pop();
  }

  static void navigate(Widget page) {
    navigatorKey.currentState?.push(
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => page,
        transitionDuration:
        const Duration(milliseconds: _navigationMilliSeconds),
        transitionsBuilder: (_, a, __, c) =>
            FadeTransition(opacity: a, child: c),
      ),
    );
  }

  static void navigateReplacement(Widget page) {
    navigatorKey.currentState?.pushReplacement(
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => page,
        transitionDuration:
        const Duration(milliseconds: _navigationMilliSeconds),
        transitionsBuilder: (_, a, __, c) =>
            FadeTransition(opacity: a, child: c),
      ),
    );
  }

  static void navigateOffAll(Widget page) {
    navigatorKey.currentState?.pushAndRemoveUntil(
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => page,
        transitionDuration:
        const Duration(milliseconds: _navigationMilliSeconds),
        transitionsBuilder: (_, a, __, c) =>
            FadeTransition(opacity: a, child: c),
      ),
          (Route<dynamic> route) => false,
    );
  }
}
