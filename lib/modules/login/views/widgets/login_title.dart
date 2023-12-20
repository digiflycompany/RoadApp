import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginTitle extends StatelessWidget {
  const LoginTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "تسجيل دخول للمستخدم",
      style: TextStyle(
        fontSize: 20.sp,
      ),
    );
  }
}
