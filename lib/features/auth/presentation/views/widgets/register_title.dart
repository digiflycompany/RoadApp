import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';

class RegisterTitle extends StatelessWidget {
  const RegisterTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(StringManager.createUserAccount.tr(context),
        style: TextStyle(
            fontSize: 20.sp,
            fontFamily: StringManager.fontFamily,
            fontWeight: FontWeight.w400));
  }
}