import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/logger.dart';
import 'package:roadapp/core/helpers/navigation/navigation.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:roadapp/features/auth/presentation/cubit/auth_state.dart';
import 'package:roadapp/features/password_recovery/views/screens/password_recovery_screen.dart';

class ForgotPasswordRow extends StatelessWidget {
  const ForgotPasswordRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 20.h, bottom: 30.h),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
            var cubit = AuthCubit.get(context);
            return Checkbox.adaptive(
                value: cubit.rememberMe,
                onChanged: (val) {
                  cubit.changeRememberMeCheck(val);
                  DefaultLogger.logger.f(cubit.rememberMe);
                });
          }),
          Text(StringManager.rememberMe.tr(context),
              style: TextStyle(fontSize: 10.sp)),
          const Spacer(),
          InkWell(
              onTap: () {
                AppNavigation.navigate(const PasswordRecoveryScreen());
              },
              child: Text(StringManager.forgotPassword.tr(context),
                  style: TextStyle(
                      decoration: TextDecoration.underline, fontSize: 10.sp)))
        ]));
  }
}