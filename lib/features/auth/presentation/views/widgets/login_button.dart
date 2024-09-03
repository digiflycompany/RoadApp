import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/widgets/custom_button.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 202.w,
      height: 47.h,
      child: CustomElevatedButton(onTap: (){}, widget: Text("دخول",
          style: TextStyle(
              color: AppColors.secondColor,
              fontSize: 11.sp)),borderRadius: 10),
    );
  }
}
