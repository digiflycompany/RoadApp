import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/features/password_recovery/cubit/password_recovery_cubit.dart';
import 'package:roadapp/features/password_recovery/cubit/password_recovery_states.dart';
import 'package:roadapp/features/password_recovery/views/screens/verification_screen.dart';
import 'package:roadapp/core/navigation/navigation.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/features/password_recovery/views/widgets/password_recovery_background.dart';
import 'package:roadapp/features/password_recovery/views/widgets/password_recovery_form.dart';
import 'package:roadapp/features/password_recovery/views/widgets/password_recovery_texts.dart';
import 'package:roadapp/features/password_recovery/views/widgets/send_code_button.dart';

class PasswordRecoveryScreen extends StatelessWidget {
  const PasswordRecoveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PasswordRecoveryCubit>(
        create: (BuildContext context) => PasswordRecoveryCubit(),
        child: BlocConsumer<PasswordRecoveryCubit, PasswordRecoveryStates>(
            listener: (BuildContext context, PasswordRecoveryStates state) {
          if (state is RequestCodeSuccessState) {
            AppNavigation.navigateReplacement(const VerificationScreen());
          }
        }, builder: (BuildContext context, PasswordRecoveryStates state) {
          return Scaffold(
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
                          const PasswordRecoveryTexts(),
                          const PasswordRecoveryForm(),
                          SizedBox(height: 46.h),
                          const SendCodeButton(),
                          SizedBox(height: 50.h)
                        ])))
          ]));
        }));
  }
}