import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/utils/app_strings.dart';

class RegisterTitle extends StatelessWidget {
  const RegisterTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "انشاء حساب للمستخدم",
      style: TextStyle(
        fontSize: 20.sp,
        fontFamily: AppStrings.fontFamily,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
