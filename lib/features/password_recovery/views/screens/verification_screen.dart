import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/navigation/navigation.dart';
import 'package:roadapp/features/password_recovery/cubit/password_recovery_cubit.dart';
import 'package:roadapp/features/password_recovery/cubit/password_recovery_states.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/features/password_recovery/views/widgets/code_form.dart';
import 'package:roadapp/features/password_recovery/views/widgets/password_recovery_background.dart';
import 'package:roadapp/features/password_recovery/views/widgets/resend_row.dart';
import 'package:roadapp/features/password_recovery/views/widgets/verification_texts.dart';
import 'package:roadapp/features/password_recovery/views/widgets/verify_code_button.dart';
import 'package:roadapp/features/reset%20password/presentation/views/screens/reset_password_screen.dart';

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
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 50.h),
                          const VerificationTexts(),
                          SizedBox(height: 10.h),
                          const CodeForm(),
                          SizedBox(height: 25.h),
                          const ResendRow(),
                          SizedBox(height: 9.h),
                          const VerifyCodeButton(),
                          SizedBox(height: 50.h)
                        ]);
                  })))
        ]));
  }
}