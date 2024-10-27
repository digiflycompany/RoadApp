import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/navigation/navigation.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/features/auth/presentation/views/screens/register_screen.dart';

class CreateAccountRow extends StatelessWidget {
  const CreateAccountRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 5.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(StringManager.doNotHaveAnAccount.tr(context),
              style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.normal)),
          TextButton(
              onPressed: () {
                AppNavigation.navigate(const RegisterScreen());
              },
              child: Text(StringManager.createAccount.tr(context),
                  style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.underline,
                      color: Colors.black)))
        ]));
  }
}