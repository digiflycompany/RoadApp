import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp2/modules/login/views/screens/login_screen.dart';
import 'package:roadapp2/services/navigation/navigation.dart';
import 'package:roadapp2/shared/resources/colors.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 26.w, right: 26.w, bottom: 53.h),
      child: InkWell(
        onTap: () {
          AppNavigation.navigateOffAll(const LoginScreen());
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'التالي',
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold,color: AppColors.primaryColor),
            ),
            const Icon(Icons.keyboard_double_arrow_left,color: AppColors.primaryColor,)
          ],
        ),
      ),
    );
  }
}
