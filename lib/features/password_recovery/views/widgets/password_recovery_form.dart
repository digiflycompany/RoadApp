import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/app_regex.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/components.dart';
import 'package:roadapp/features/password_recovery/cubit/password_recovery_cubit.dart';
import 'package:roadapp/features/password_recovery/cubit/password_recovery_states.dart';

class PasswordRecoveryForm extends StatelessWidget {
  const PasswordRecoveryForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PasswordRecoveryCubit, PasswordRecoveryStates>(
        builder: (context, state) {
      final cubit = context.read<PasswordRecoveryCubit>();
      return Form(
          key: cubit.requestFormKey,
          child: Column(children: [
            defaultFormField(
                textController: cubit.phoneController,
                type: TextInputType.phone,
                validate: (String value) {
                  if (value.trim().isEmpty) {
                    return StringManager.phoneNumberIsRequired.tr(context);
                  }
                  return null;
                },
                onSubmit: (value) {},
                inputAction: TextInputAction.next,
                labelText: StringManager.phoneNumber.tr(context),
                hint: StringManager.enterPhoneNumberHere.tr(context)),
            SizedBox(height: 20.h),
            defaultFormField(
                textController: cubit.emailController,
                type: TextInputType.emailAddress,
                validate: (value) {
                  if (value == null || value.isEmpty) {
                    return StringManager.pleaseEnterYourEmailAddress
                        .tr(context);
                  }
                  if (!AppRegex.isEmailValid(value)) {
                    return StringManager.invalidEmail.tr(context);
                  }
                  return null;
                },
                onSubmit: (value) {},
                inputAction: TextInputAction.next,
                hint: StringManager.enterEmailHere.tr(context),
                labelText: StringManager.email.tr(context))
          ]));
    });
  }
}