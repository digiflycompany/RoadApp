import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/core/dependency_injection/di.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/Theming/styles.dart';
import 'package:roadapp/core/helpers/functions/toast.dart';
import 'package:roadapp/core/helpers/navigation/navigation.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/features/account/data/repo/account_repo.dart';
import 'package:roadapp/features/account/presentation/manager/account_cubit.dart';
import 'package:roadapp/features/account/presentation/manager/account_state.dart';
import 'package:roadapp/features/auth/presentation/views/screens/register_screen.dart';

void showDeleteAccConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return BlocProvider(
        create: (context) => AccountCubit(getIt.get<AccountRepo>()),
        child: Builder(
          builder: (innerContext) {
            var cubit = AccountCubit.get(innerContext);
            return AlertDialog(
              title: Center(
                child: Text(
                  StringManager.deleteAccountConfirmation.tr(innerContext),
                  style: Styles.textStyle18,
                  textAlign: TextAlign.center,
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Text(
                      StringManager.deleteAccountConfirmationMessage.tr(innerContext),
                      style: Styles.textStyle14,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(innerContext);
                  },
                  child: Text(StringManager.cancel.tr(innerContext)),
                ),
                BlocListener<AccountCubit, AccountState>(
                  listener: (innerContext, state) {
                    if (state is DeleteAccountSuccessState) {
                      AppNavigation.navigateOffAll(const RegisterScreen());
                      showToast(
                        message: StringManager.accountDeletedSuccessfully.tr(innerContext),
                        state: ToastStates.success,
                      );
                    }
                  },
                  child: TextButton(
                    onPressed: () => cubit.deleteAccount(),
                    child: Text(StringManager.deleteMyAccount.tr(innerContext)),
                  ),
                ),
              ],
            );
          },
        ),
      );
    },
  );
}
