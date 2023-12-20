import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp2/layout/views/screens/app_layout.dart';
import 'package:roadapp2/modules/login/cubit/cubit.dart';
import 'package:roadapp2/modules/login/cubit/states.dart';
import 'package:roadapp2/modules/login/views/widgets/login_account_type.dart';
import 'package:roadapp2/modules/login/views/widgets/login_background.dart';
import 'package:roadapp2/modules/login/views/widgets/login_inputs.dart';
import 'package:roadapp2/modules/login/views/widgets/login_logo.dart';
import 'package:roadapp2/modules/login/views/widgets/login_title.dart';
import 'package:roadapp2/modules/recovery/recovery_screen.dart';
import 'package:roadapp2/modules/register/views/screens/register_screen.dart';
import 'package:roadapp2/modules/reset%20password/reset_password_screen.dart';
import 'package:roadapp2/modules/verification/verification_screen.dart';
import 'package:roadapp2/services/navigation/navigation.dart';
import 'package:roadapp2/shared/resources/colors.dart';
import 'package:roadapp2/shared/widgets/custom_button.dart';

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
                    height: MediaQuery.of(context).size.height * 0.9,
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
                                    cubit.rememberMe = val!;
                                  },
                                ),
                                const Text("تذكرني"),
                                const Spacer(),
                                InkWell(
                                    onTap: () {
                                      // AppNavigation.navigate();
                                      AppNavigation.navigate(
                                          const RecoveryScreen());
                                    },
                                    child: const Text(
                                      "نسيت كلمة المرور؟",
                                      style: TextStyle(
                                          decoration: TextDecoration.underline),
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 202.w,
                            height: 47.h,
                            child: CustomElevatedButton(
                                onTap: () {
                                  AppNavigation.navigateOffAll(
                                      const AppLayout());
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
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    AppNavigation.navigate(
                                        const VerificationScreen());
                                  },
                                  icon: const Text("1")),
                              IconButton(
                                  onPressed: () {
                                    AppNavigation.navigate(
                                        const RecoveryScreen());
                                  },
                                  icon: const Text("2")),
                              IconButton(
                                  onPressed: () {
                                    AppNavigation.navigate(
                                        const ResetPasswordScreen());
                                  },
                                  icon: const Text("3")),
                            ],
                          ),
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
