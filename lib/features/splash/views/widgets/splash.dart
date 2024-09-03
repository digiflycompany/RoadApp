import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/features/onboarding/views/screens/onboarding_screen.dart';
import 'package:roadapp/core/utils/app_assets.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: AnimatedSplashScreen(
        splashIconSize: 250.h,
        splash: Column(
          children: [
            Image.asset(
              AppAssets.appIcon,
              width: 150.w,
              height: 150.h,
            ),
            SizedBox(height: 24.h),
            Text(
              StringManager.yourRoadIsSafe.tr(context),
              style: TextStyle(fontSize: 15.sp),
            ),
          ],
        ),
        nextScreen: const OnBoardingScreen(),
        duration: 1000,
      ),
    );
  }
}
