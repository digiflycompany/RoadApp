import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/functions/toast.dart';
import 'package:roadapp/core/utils/app_regex.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/features/account/presentation/manager/account_cubit.dart';
import 'package:roadapp/features/account/presentation/manager/account_state.dart';
import 'package:roadapp/features/account/presentation/views/widgets/account_text_field.dart';

class UserDataForm extends StatelessWidget {
  const UserDataForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit, AccountState>(builder: (context, state) {
      var cubit = AccountCubit.get(context);
      if (state is UpdateProfileSuccessState) {
        Navigator.pop(context);
        showToast(
            message: StringManager.profileUpdatedSuccessfully.tr(context),
            state: ToastStates.success);
      }
      return Form(
          key: cubit.userFormKey,
          child: Column(children: [
            AccountTextField(
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return StringManager.nameCannotBeEmpty.tr(context);
                  }
                  return null;
                },
                text: StringManager.name.tr(context)),
            AccountTextField(
                inputType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return StringManager.phoneNumberIsRequired.tr(context);
                  }
                  return null;
                },
                text: StringManager.phoneNumber.tr(context)),
            AccountTextField(
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
                text: StringManager.email.tr(context)),
            AccountTextField(
                textInputAction: TextInputAction.done,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return StringManager.passwordIsRequired.tr(context);
                  }
                  return null;
                },
                text: StringManager.password.tr(context))
          ]));
    });
  }
}