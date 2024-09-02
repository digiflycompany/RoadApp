import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/widgets/custom_button.dart';
import 'package:roadapp/features/login/cubit/cubit.dart';
import 'package:roadapp/features/login/cubit/states.dart';
import 'package:roadapp/features/login/views/widgets/login_account_type.dart';
import 'package:roadapp/features/login/views/widgets/login_background.dart';
import 'package:roadapp/features/login/views/widgets/login_inputs.dart';
import 'package:roadapp/features/login/views/widgets/login_logo.dart';
import 'package:roadapp/features/login/views/widgets/login_title.dart';
import 'package:roadapp/features/password_recovery/views/screens/password_recovery_screen.dart';
import 'package:roadapp/features/register/views/screens/register_screen.dart';
import 'package:roadapp/features/service_sector/views/screens/service_sector_screen.dart';
import 'package:roadapp/core/navigation/navigation.dart';
import 'package:roadapp/core/Theming/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (BuildContext context, LoginStates state) {},
        builder: (BuildContext context, LoginStates state) {
          var cubit = LoginCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const LoginBackground(),
                  Container(
                    color: AppColors.tertiary,
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    height: MediaQuery.of(context).size.height * 0.85,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const LoginLogo(),
                          const LoginTitle(),
                          const LoginAccountType(),
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
                                  },
                                ),
                                 Text("تذكرني",style: TextStyle(
                                  fontSize: 10.sp
                                ),),
                                const Spacer(),
                                InkWell(
                                    onTap: () {
                                      // AppNavigation.navigate();
                                      AppNavigation.navigate(
                                          const PasswordRecoveryScreen());
                                    },
                                    child: Text(
                                      "نسيت كلمة المرور؟",
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,fontSize: 10.sp),
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 202.w,
                            height: 47.h,
                            child: CustomElevatedButton(
                                onTap: () {
                                  // AppNavigation.navigateOffAll(
                                  //     const AppLayout());
                                  AppNavigation.navigateOffAll(
                                      const ServiceSectorScreen());
                                },
                                widget: Text("دخول",
                                    style: TextStyle(
                                        color: AppColors.secondColor,
                                        fontSize: 11.sp)),
                                borderRadius: 10),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5.h),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "ليس لديك حساب؟",
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      AppNavigation.navigate(
                                          const RegisterScreen());
                                    },
                                    child: Text(
                                      "انشاء حساب",
                                      style: TextStyle(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.normal,
                                          decoration: TextDecoration.underline,
                                          color: Colors.black),
                                    ),
                                  )
                                ]),
                          ),
                          // Row(
                          //   children: [
                          //     IconButton(
                          //         onPressed: () {
                          //           AppNavigation.navigate(
                          //               const VerificationScreen());
                          //         },
                          //         icon: const Text("1")),
                          //     IconButton(
                          //         onPressed: () {
                          //           AppNavigation.navigate(
                          //               const PasswordRecoveryScreen());
                          //         },
                          //         icon: const Text("2")),
                          //     IconButton(
                          //         onPressed: () {
                          //           AppNavigation.navigate(
                          //               const ResetPasswordScreen());
                          //         },
                          //         icon: const Text("3")),
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}