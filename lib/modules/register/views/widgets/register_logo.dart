import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp2/shared/const/app_images.dart';

class RegisterLogo extends StatelessWidget {
  const RegisterLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 25.h, bottom: 10.h),
          child: SizedBox(
              width: 100.w,
              height: 100.h,
              child: Image.asset(AppImages.appIcon)),
        ),
        Text(
          'طريقك أمان',
          style: TextStyle(
              fontSize: 15.sp, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
