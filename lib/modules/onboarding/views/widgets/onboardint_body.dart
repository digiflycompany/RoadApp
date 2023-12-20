import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 26.w),
      child: Text(
          ' مركز خدمة متكامل يقدم خدمة صيانة العربيات لحد عندكم من خلال توفير عربية صيانة تتنقل لمكانك  لتقوم بعمل الخدمات التي تريدها ...',
          style: TextStyle(
            fontSize: 12.sp,
          ),
          textAlign: TextAlign.center),
    );
  }
}
