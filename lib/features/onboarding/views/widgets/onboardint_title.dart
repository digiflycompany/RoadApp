import 'package:flutter/material.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/string_manager.dart';

class OnBoardingTitle extends StatelessWidget {
  const OnBoardingTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 16),
        child: Text(StringManager.troubleshooting.tr(context),
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)));
  }
}