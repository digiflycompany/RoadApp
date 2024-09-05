import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/Theming/styles.dart';
import 'package:roadapp/core/functions/toast.dart';
import 'package:roadapp/core/navigation/navigation.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/features/account/presentation/manager/account_cubit.dart';
import 'package:roadapp/features/account/presentation/manager/account_state.dart';
import 'package:roadapp/features/auth/presentation/views/screens/register_screen.dart';

void showDeleteAccConfirmationDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Center(
                child: Text(
                    StringManager.deleteAccountConfirmation.tr(context),
                    style: Styles.textStyle18,
                    textAlign: TextAlign.center)),
            content: Column(mainAxisSize: MainAxisSize.min, children: [
              Flexible(
                  child: Text(
                      StringManager.deleteAccountConfirmationMessage
                          .tr(context),
                      style: Styles.textStyle14,
                      textAlign: TextAlign.center))
            ]),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(StringManager.cancel.tr(context))), //Hay, chat GPT, Why this text does not appear
              BlocListener<AccountCubit, AccountState>(
                listener: (context, state) {
                  if(state is DeleteAccountSuccessState) {
                    AppNavigation.navigateOffAll(const RegisterScreen());
                    showToast(message: StringManager.accountDeletedSuccessfully.tr(context), state: ToastStates.success);
                  }
                },
                child: TextButton(
                    onPressed: () =>
                        context.read<AccountCubit>().deleteAccount(),
                    child: Text(StringManager.deleteMyAccount.tr(context))),// and this also
              )
            ]);
      });
}