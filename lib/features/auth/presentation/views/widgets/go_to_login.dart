import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/navigation/navigation.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/features/auth/presentation/views/screens/login_screen.dart';

class GoToLogin extends StatelessWidget {
  const GoToLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(StringManager.alreadyHaveAnAccount.tr(context),
          style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.normal)),
      TextButton(
          onPressed: () {
            AppNavigation.navigateOffAll(const LoginScreen());
          },
          child: Text(StringManager.login.tr(context),
              style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.normal,
                  color: Colors.black)))
    ]);
  }
}