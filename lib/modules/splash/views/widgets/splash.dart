import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/modules/onboarding/views/screens/onboarding_screen.dart';
import 'package:roadapp/shared/const/app_images.dart';

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
              AppImages.appIcon,
              width: 150.w,
              height: 150.h,
            ),
            SizedBox(height: 24.h),
            Text(
              "طريقك امان",
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
