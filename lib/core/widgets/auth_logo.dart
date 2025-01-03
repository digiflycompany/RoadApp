import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/app_assets.dart';
import 'package:roadapp/core/helpers/string_manager.dart';

class AuthLogo extends StatelessWidget {
  const AuthLogo({super.key});

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
          StringManager.yourRoadIsSafe.tr(context),
          style: TextStyle(
              fontSize: 15.sp, fontWeight: FontWeight.w400)
        ),

      ],
    );
  }
}
