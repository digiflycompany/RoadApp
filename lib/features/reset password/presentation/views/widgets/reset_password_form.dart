import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/components.dart';
import 'package:roadapp/features/reset password/presentation/cubit/cubit.dart';
import 'package:roadapp/features/reset password/presentation/cubit/state.dart';

class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordCubit, ResetPasswordStates>(
      builder: (context, state) {
        var cubit = ResetPasswordCubit.get(context);
        return Form(
          key: cubit.formKey,
          child: Column(
            children: [
              defaultFormField(
                textController: cubit.passwordController,
                type: TextInputType.visiblePassword,
                validate: (String? value) {
                  if (value == null || value.trim().isEmpty) {
                    return StringManager.newPasswordIsRequired.tr(context);
                  }
                  if (value != cubit.password2Controller.text) {
                    return StringManager.passwordsMustMatch.tr(context);
                  }
                  return null;
                },
                isPassword: cubit.visiblePassword,
                suffixPressed: () {
                  cubit.changePasswordVisibility();
                },
                suffixIcon: Icon(cubit.suffix),
                labelText: StringManager.password.tr(context),
              ),
              SizedBox(height: 20.h),
              defaultFormField(
                textController: cubit.password2Controller,
                type: TextInputType.visiblePassword,
                validate: (String? value) {
                  if (value == null || value.trim().isEmpty) {
                    return StringManager.passwordConfirmationIsRequired
                        .tr(context);
                  }
                  if (value != cubit.passwordController.text) {
                    return StringManager.passwordsMustMatch.tr(context);
                  }
                  return null;
                },
                isPassword: cubit.visiblePassword2,
                suffixPressed: () {
                  cubit.changePassword2Visibility();
                },
                suffixIcon: Icon(cubit.suffix2),
                labelText: StringManager.passwordConfirmation.tr(context),
              ),
            ],
          ),
        );
      },
    );
  }
}
