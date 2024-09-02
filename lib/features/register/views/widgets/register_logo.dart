import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/utils/app_assets.dart';

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
              child: Image.asset(AppAssets.appIcon)),
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
