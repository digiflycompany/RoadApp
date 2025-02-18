import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/helpers/app_assets.dart';

class OnBoardingImg extends StatelessWidget {
  const OnBoardingImg({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: SvgPicture.asset(AppAssets.onboardingImg));
  }
}