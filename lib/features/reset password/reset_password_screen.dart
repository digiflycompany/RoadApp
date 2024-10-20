import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/core/widgets/auth_logo.dart';
import 'package:roadapp/features/auth/presentation/views/screens/login_screen.dart';
import 'package:roadapp/features/reset%20password/cubit/cubit.dart';
import 'package:roadapp/core/navigation/navigation.dart';
import 'package:roadapp/core/widgets/components.dart';
import 'package:roadapp/core/utils/app_assets.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'cubit/state.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ResetPasswordCubit(),
        child: BlocConsumer<ResetPasswordCubit, ResetPasswordStates>(
            listener: (BuildContext context, ResetPasswordStates state) {
          if (state is ResetPasswordSuccessStates) {
            AppNavigation.navigateOffAll(const LoginScreen());
          }
        }, builder: (BuildContext context, ResetPasswordStates state) {
          var cubit = ResetPasswordCubit.get(context);
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
                        child: Form(
                            key: cubit.formKey,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: 50.h),
                                  const AuthLogo(),
                                  SizedBox(height: 20.h),
                                  Text(
                                      //  AppLocalizations.of(context)!.language1,
                                      StringManager.resetPassword.tr(context),
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(height: 6.h),
                                  Text(
                                      StringManager.pleaseEnterNewPassword
                                          .tr(context),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 10.sp)),
                                  SizedBox(height: 45.h),
                                  defaultFormField(
                                      textController: cubit.passwordController,
                                      type: TextInputType.visiblePassword,
                                      validate: (String value) {
                                        if (value.trim().isEmpty) {
                                          return StringManager
                                              .newPasswordIsRequired
                                              .tr(context);
                                        }
                                        if (value !=
                                            cubit.password2Controller.text) {
                                          return StringManager
                                              .passwordsMustMatch
                                              .tr(context);
                                        }
                                        return null;
                                      },
                                      isPassword: cubit.visiblePassword,
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            cubit.changePasswordVisibility();
                                          },
                                          icon: Icon(cubit.suffix)),
                                      labelText:
                                          StringManager.password.tr(context)),
                                  SizedBox(height: 20.h),
                                  defaultFormField(
                                      textController: cubit.password2Controller,
                                      type: TextInputType.visiblePassword,
                                      validate: (String value) {
                                        if (value.trim().isEmpty) {
                                          return StringManager
                                              .passwordConfirmationIsRequired
                                              .tr(context);
                                        }
                                        if (value !=
                                            cubit.passwordController.text) {
                                          return StringManager
                                              .passwordsMustMatch
                                              .tr(context);
                                        }
                                        return null;
                                      },
                                      isPassword: cubit.visiblePassword2,
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            cubit.changePassword2Visibility();
                                          },
                                          icon: Icon(cubit.suffix2)),
                                      labelText: StringManager
                                          .passwordConfirmation
                                          .tr(context)),
                                  SizedBox(height: 50.h),
                                  SizedBox(
                                      width: 202.w,
                                      height: 47.h,
                                      child: ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  const WidgetStatePropertyAll(
                                                      AppColors.primaryColor),
                                              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.r)))),
                                          onPressed: () =>
                                              cubit.validateToResetPassword(),
                                          child: Text(
                                              StringManager.finish.tr(context),
                                              style: TextStyle(
                                                  color: AppColors.secondColor,
                                                  fontSize: 11.sp)))),
                                  SizedBox(height: 50.h)
                                ]))))
              ]));
        }));
  }
}