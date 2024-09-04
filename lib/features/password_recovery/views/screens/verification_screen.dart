import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/Theming/styles.dart';
import 'package:roadapp/core/navigation/navigation.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/core/widgets/auth_logo.dart';
import 'package:roadapp/features/password_recovery/cubit/password_recovery_cubit.dart';
import 'package:roadapp/features/password_recovery/cubit/password_recovery_states.dart';
import 'package:roadapp/core/utils/app_assets.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/features/reset%20password/reset_password_screen.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[400],
        body: Stack(alignment: Alignment.center, children: [
          SvgPicture.asset(AppAssets.roadBackground,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill),
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
                    return Form(
                        key: cubit.codeFormKey,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 50.h),
                              const AuthLogo(),
                              SizedBox(height: 20.h),
                              Text(
                                  StringManager.typeConfirmationCode
                                      .tr(context),
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(height: 14.h),
                              Text(
                                  StringManager
                                      .pleaseEnterThe4DigitCodeSentToRegisteredPhoneNumber
                                      .tr(context),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 10.sp)),
                              SizedBox(height: 20.h),
                              Row(children: [
                                Text(StringManager.confirmationCode.tr(context))
                              ]),
                              SizedBox(height: 10.h),
                              Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: Pinput(
                                      length: 4,
                                      keyboardType: TextInputType.number,
                                      defaultPinTheme: const PinTheme(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  bottom:
                                                      BorderSide(width: 1)))),
                                      focusedPinTheme: const PinTheme(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  bottom:
                                                      BorderSide(width: 1)))),
                                      textInputAction: TextInputAction.next,
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
                                          return StringManager.codeIsRequired
                                              .tr(context);
                                        }
                                        if (value.length != 4) {
                                          return StringManager.enter4Digits
                                              .tr(context);
                                        }
                                        return null;
                                      },
                                      showCursor: true,
                                      onCompleted: null)),
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
                                              const MaterialStatePropertyAll(
                                                  AppColors.primaryColor),
                                          shape:
                                              MaterialStateProperty.all<RoundedRectangleBorder>(
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
                            ]));
                  })))
        ]));
  }
}
