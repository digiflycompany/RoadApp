import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/helpers/navigation/navigation.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/features/auth/presentation/views/screens/login_screen.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    String currentLang = Localizations.localeOf(context).languageCode;
    return Padding(
        padding: EdgeInsets.only(left: 26.w, right: 26.w, bottom: 53.h),
        child: InkWell(
            onTap: () {
              AppNavigation.navigateOffAll(const LoginScreen());
            },
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Text(StringManager.next.tr(context),
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor)),
              Icon(
                  currentLang == 'ar'
                      ? Icons.keyboard_double_arrow_left
                      : Icons.keyboard_double_arrow_right,
                  color: AppColors.primaryColor)
            ])));
  }
}