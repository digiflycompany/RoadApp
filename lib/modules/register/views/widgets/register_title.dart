import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp2/shared/const/app_strings.dart';

class RegisterTitle extends StatelessWidget {
  const RegisterTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "انشاء حساب للمستخدم",
      style: TextStyle(
        fontSize: 20.sp,
        fontFamily: AppConstants.fontFamily,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
