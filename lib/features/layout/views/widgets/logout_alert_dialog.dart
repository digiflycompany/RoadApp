import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/core/widgets/custom_button.dart';
import 'package:roadapp/core/navigation/navigation.dart';
import 'package:roadapp/core/utils/app_assets.dart';
import 'package:roadapp/features/auth/presentation/views/screens/login_screen.dart';

class LogoutALerDialog extends StatelessWidget {
  const LogoutALerDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 10.h,
          ),
          SvgPicture.asset(AppAssets.alertYellowIcon),
          SizedBox(
            height: 16.h,
          ),
          Text(
              StringManager.noNotificationsHaveBeenSentWhenExitAreYouSure
                  .tr(context),
              style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w700)),
          SizedBox(height: 20.h),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomElevatedButton(
                        onTap: () =>
                            AppNavigation.navigateOffAll(const LoginScreen()),
                        widget: Text(StringManager.ok.tr(context),
                            style: TextStyle(fontSize: 10.sp))),
                    CustomElevatedButton(
                        onTap: () => Navigator.pop(context),
                        widget: Text(StringManager.cancel.tr(context),
                            style: TextStyle(fontSize: 10.sp)))
                  ]))
        ]);
  }
}