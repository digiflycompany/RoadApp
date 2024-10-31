import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/functions/show_default_dialog.dart';
import 'package:roadapp/core/helpers/functions/show_default_loading_indicator.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/navigation/navigation.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/features/layout/presentation/views/screens/app_layout.dart';
import 'package:roadapp/features/password_recovery/presentation/cubit/password_recovery_cubit.dart';
import 'package:roadapp/features/password_recovery/presentation/cubit/password_recovery_states.dart';
import 'package:roadapp/features/password_recovery/presentation/views/widgets/code_form.dart';
import 'package:roadapp/features/password_recovery/presentation/views/widgets/password_recovery_background.dart';
import 'package:roadapp/features/password_recovery/presentation/views/widgets/resend_row.dart';
import 'package:roadapp/features/password_recovery/presentation/views/widgets/verification_texts.dart';
import 'package:roadapp/features/password_recovery/presentation/views/widgets/verify_code_button.dart';
import 'package:roadapp/features/reset%20password/presentation/views/screens/reset_password_screen.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key, this.justRegistered});
  final bool? justRegistered;

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
                    if (state is VerificationLoadingState) {
                      showDefaultLoadingIndicator(context, cancelable: false);
                    }
                    if (state is VerificationErrorState) {
                      Navigator.pop(context);
                      showDefaultDialog(context,
                          type: NotificationType.error,
                          description: state.error,
                          title: StringManager.verificationError.tr(context));
                    }
                    if (state is VerifyCodeSuccessState) {
                      AppNavigation.navigateReplacement(
                          justRegistered == true? const AppLayout(): const ResetPasswordScreen());
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
