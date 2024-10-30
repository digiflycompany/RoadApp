import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/features/auth/presentation/views/screens/login_screen.dart';
import 'package:roadapp/core/helpers/navigation/navigation.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/features/password_recovery/presentation/views/widgets/password_recovery_background.dart';
import 'package:roadapp/features/reset%20password/presentation/cubit/cubit.dart';
import 'package:roadapp/features/reset%20password/presentation/cubit/state.dart';
import 'package:roadapp/features/reset%20password/presentation/views/widgets/reset_password_button.dart';
import 'package:roadapp/features/reset%20password/presentation/views/widgets/reset_password_form.dart';
import 'package:roadapp/features/reset%20password/presentation/views/widgets/reset_password_texts.dart';

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
          return Scaffold(
              backgroundColor: Colors.grey[400],
              body: Stack(alignment: Alignment.center, children: [
                const PasswordRecoveryBackground(),
                SingleChildScrollView(
                    child: Container(
                        color: AppColors.tertiary,
                        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                        width: MediaQuery.of(context).size.width * 0.80,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 50.h),
                              const ResetPasswordTexts(),
                              SizedBox(height: 45.h),
                              const ResetPasswordForm(),
                              SizedBox(height: 50.h),
                              const ResetPasswordButton(),
                              SizedBox(height: 50.h)
                            ])))
              ]));
        }));
  }
}