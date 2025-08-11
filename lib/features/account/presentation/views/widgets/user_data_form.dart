import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/functions/toast.dart';
import 'package:roadapp/core/helpers/app_regex.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/features/account/data/models/account_response.dart';
import 'package:roadapp/features/account/presentation/manager/account_cubit.dart';
import 'package:roadapp/features/account/presentation/manager/account_state.dart';
import 'package:roadapp/features/account/presentation/views/widgets/account_text_field.dart';

import '../../../data/models/profile_user_response.dart';

class UserDataForm extends StatelessWidget {
  const UserDataForm({super.key, required this.user});
  final UserUser user;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit, AccountState>(builder: (context, state) {
      var cubit = AccountCubit.get(context);

      cubit.nameController.text = user.fullName ?? '';
      cubit.phoneController.text = user.phoneNumber ?? '';
      cubit.emailController.text = user.email ?? '';

      if (state is UpdateProfileSuccessState) {
        Navigator.pop(context);
        showToast(
            message: StringManager.profileUpdatedSuccessfully.tr(context),
            state: ToastStates.success);
      }

      return Form(
        key: cubit.userFormKey,
        child: Column(
          children: [
            AccountTextField(
              controller: cubit.nameController,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return StringManager.nameCannotBeEmpty.tr(context);
                }
                return null;
              },
              text: StringManager.name.tr(context)
            ),
            AccountTextField(
              controller: cubit.phoneController,
              inputType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return StringManager.phoneNumberIsRequired.tr(context);
                }
                return null;
              },
              text: StringManager.phoneNumber.tr(context)
            ),
            AccountTextField(
              controller: cubit.emailController,
              inputType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return StringManager.pleaseEnterYourEmailAddress
                      .tr(context);
                }
                if (!AppRegex.isEmailValid(value)) {
                  return StringManager.invalidEmail.tr(context);
                }
                return null;
              },
              text: StringManager.email.tr(context)
            ),
            AccountTextField(
              obscureText: true,
              controller: cubit.passwordController,
              textInputAction: TextInputAction.done,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return StringManager.passwordIsRequired.tr(context);
                }

                String password = value.trim();

                if (password.length < 8) {
                  return StringManager.passwordTooShort.tr(context); // لازم تضيف النص في الترجمة
                }

                if (!RegExp(r'[A-Z]').hasMatch(password)) {
                  return StringManager.passwordMustContainUppercase.tr(context);
                }

                if (!RegExp(r'[a-z]').hasMatch(password)) {
                  return StringManager.passwordMustContainLowercase.tr(context);
                }

                if (!RegExp(r'[0-9]').hasMatch(password)) {
                  return StringManager.passwordMustContainNumber.tr(context);
                }

                if (!RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(password)) {
                  return StringManager.passwordMustContainSpecialChar.tr(context);
                }

                return null;
              },
              text: StringManager.password.tr(context),
            )

          ]
        )
      );
    });
  }
}
