import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/utils/app_assets.dart';

class OnBoardingImg extends StatelessWidget {
  const OnBoardingImg({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 40.h),
      child: SvgPicture.asset(AppAssets.onboardingImg),
    );
  }
}
