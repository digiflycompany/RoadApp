import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/Theming/styles.dart';
import 'package:roadapp/core/navigation/navigation.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/core/widgets/auth_logo.dart';
import 'package:roadapp/features/password_recovery/cubit/password_recovery_cubit.dart';
import 'package:roadapp/features/password_recovery/cubit/password_recovery_states.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/features/password_recovery/views/widgets/code_form.dart';
import 'package:roadapp/features/password_recovery/views/widgets/password_recovery_background.dart';
import 'package:roadapp/features/password_recovery/views/widgets/verification_texts.dart';
import 'package:roadapp/features/reset%20password/reset_password_screen.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[400],
        body: Stack(alignment: Alignment.center, children: [
          const PasswordRecoveryBackground(),
          SingleChildScrollView(
              child: Container(
                  color: AppColors.tertiary,
                  padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                  width: MediaQuery.of(context).size.width * 0.80,
                  child: BlocConsumer<PasswordRecoveryCubit,
                      PasswordRecoveryStates>(listener: (context, state) {
                    if (state is VerifyCodeSuccessState) {
                      AppNavigation.navigateReplacement(
                          const ResetPasswordScreen());
                    }
                  }, builder: (_, state) {
                    var cubit = PasswordRecoveryCubit.get(context);
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 50.h),
                          const VerificationTexts(),
                          SizedBox(height: 10.h),
                          const CodeForm(),
                          SizedBox(height: 25.h),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    StringManager.codeHasNotBeenReceived
                                        .tr(context),
                                    style: Styles.textStyle12.copyWith(
                                        color: AppColors.greyColor2)),
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                        StringManager.resendCode
                                            .tr(context),
                                        style: Styles.textStyle12.copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.black)))
                              ]),
                          SizedBox(height: 9.h),
                          SizedBox(
                              width: 202.w,
                              height: 47.h,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          const WidgetStatePropertyAll(
                                              AppColors.primaryColor),
                                      shape:
                                          WidgetStateProperty.all<RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.r)))),
                                  onPressed: () =>
                                      cubit.validateToVerifyCode(),
                                  child: Text(StringManager.send.tr(context),
                                      style: TextStyle(
                                          color: AppColors.secondColor,
                                          fontSize: 11.sp)))),
                          SizedBox(height: 50.h)
                        ]);
                  })))
        ]));
  }
}