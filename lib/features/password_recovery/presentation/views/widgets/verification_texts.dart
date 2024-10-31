import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/auth_logo.dart';

class VerificationTexts extends StatelessWidget {
  const VerificationTexts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const AuthLogo(),
      SizedBox(height: 20.h),
      Text(StringManager.typeConfirmationCode.tr(context),
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
      SizedBox(height: 14.h),
      Text(
          StringManager.pleaseEnterThe4DigitCodeSentToRegisteredEmail
              .tr(context),
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 10.sp)),
      SizedBox(height: 20.h),
      Row(children: [Text(StringManager.confirmationCode.tr(context))])
    ]);
  }
}