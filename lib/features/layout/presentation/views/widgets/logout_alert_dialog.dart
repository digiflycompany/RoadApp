import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/helpers/cache_helper/cache_helper.dart';
import 'package:roadapp/core/helpers/cache_helper/cache_vars.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_button.dart';
import 'package:roadapp/core/helpers/navigation/navigation.dart';
import 'package:roadapp/core/helpers/app_assets.dart';
import 'package:roadapp/features/auth/presentation/views/screens/login_screen.dart';
import 'package:roadapp/features/layout/presentation/cubit/applayout_cubit.dart';

class LogoutALerDialog extends StatelessWidget {
  const LogoutALerDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10.h),
          SvgPicture.asset(AppAssets.alertYellowIcon),
          SizedBox(height: 16.h),
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
                        onTap: () async {
                          await CacheHelper().removeData(CacheVars.accessToken);
                          await CacheHelper().removeData('MaintenanceCenterProfileIdKey');
                          await CacheHelper().removeData('CLIENT');
                          await CacheHelper().removeData('profileImageUrl');
                        AppLayoutCubit.get(context).changeBottomNavBar(0);
                        AppNavigation.navigateOffAll(const LoginScreen());
                        },
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