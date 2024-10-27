import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/auth_logo.dart';

class PasswordRecoveryTexts extends StatelessWidget {
  const PasswordRecoveryTexts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: 50.h),
      const AuthLogo(),
      SizedBox(height: 20.h),
      Text(StringManager.passwordRecovery.tr(context),
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
      SizedBox(height: 14.h),
      Text(
          StringManager.pleaseEnterRegisteredPhoneNumberToResetPassword
              .tr(context),
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 10.sp)),
      SizedBox(height: 25.h)
    ]);
  }
}