import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingTitle extends StatelessWidget {
  const OnBoardingTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: EdgeInsets.only(top: 10.h, bottom: 16.h),
        child: Text(
          "إصلاح الأعطال",
          style: TextStyle(
              fontSize: 17.sp, fontWeight: FontWeight.bold),
        ));
  }
}
