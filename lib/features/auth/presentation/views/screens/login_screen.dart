import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/core/widgets/custom_button.dart';
import 'package:roadapp/features/auth/presentation/manager/auth_cubit.dart';
import 'package:roadapp/features/auth/presentation/manager/auth_state.dart';
import 'package:roadapp/features/auth/presentation/views/screens/register_screen.dart';
import 'package:roadapp/features/auth/presentation/views/widgets/account_type.dart';
import 'package:roadapp/features/auth/presentation/views/widgets/login_background.dart';
import 'package:roadapp/features/auth/presentation/views/widgets/login_inputs.dart';
import 'package:roadapp/core/widgets/auth_logo.dart';
import 'package:roadapp/features/auth/presentation/views/widgets/login_title.dart';
import 'package:roadapp/features/password_recovery/views/screens/password_recovery_screen.dart';
import 'package:roadapp/core/navigation/navigation.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/features/service_sector/views/screens/service_sector_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AuthCubit(),
        child: BlocConsumer<AuthCubit, AuthState>(
            listener: (BuildContext context, AuthState state) {
              if(state is AuthSuccessState) AppNavigation.navigateOffAll(const ServiceSectorScreen());
            },
            builder: (BuildContext context, AuthState state) {
              var cubit = AuthCubit.get(context);
              return Scaffold(
                  body: SafeArea(
                      child: Stack(alignment: Alignment.center, children: [
                const LoginBackground(),
                Container(
                    color: AppColors.tertiary,
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    height: MediaQuery.of(context).size.height * 0.85,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: SingleChildScrollView(
                        child: Form(
                          key: cubit.loginFormKey,
                          child: Column(children: [
                                                const AuthLogo(),
                                                const LoginTitle(),
                                                const AccountType(),
                                                const LoginInputs(),
                                                Padding(
                            padding: EdgeInsets.only(top: 20.h, bottom: 30.h),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Checkbox.adaptive(
                                      value: cubit.rememberMe,
                                      onChanged: (val) {
                                        cubit.changeRememberMeCheck(val);
                                      }),
                                  Text(StringManager.rememberMe.tr(context),
                                      style: TextStyle(fontSize: 10.sp)),
                                  const Spacer(),
                                  InkWell(
                                      onTap: () {
                                        AppNavigation.navigate(
                                            const PasswordRecoveryScreen());
                                      },
                                      child: Text(
                                          StringManager.forgotPassword
                                              .tr(context),
                                          style: TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
                                              fontSize: 10.sp)))
                                ])),
                                                SizedBox(
                            width: 202.w,
                            height: 47.h,
                            child: CustomElevatedButton(
                                onTap: () => cubit.validateToLogin(),
                                widget: Text(StringManager.login.tr(context),
                                    style: TextStyle(
                                        color: AppColors.secondColor,
                                        fontSize: 11.sp)),
                                radiusAllNumber: 10)),
                                                Padding(
                            padding: EdgeInsets.only(top: 5.h),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                      StringManager.doNotHaveAnAccount
                                          .tr(context),
                                      style: TextStyle(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.normal)),
                                  TextButton(
                                      onPressed: () {
                                        AppNavigation.navigate(
                                            const RegisterScreen());
                                      },
                                      child: Text(
                                          StringManager.createAccount.tr(context),
                                          style: TextStyle(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.normal,
                                              decoration:
                                                  TextDecoration.underline,
                                              color: Colors.black)))
                                ]))
                                              ]),
                        )))
              ])));
            }));
  }
}