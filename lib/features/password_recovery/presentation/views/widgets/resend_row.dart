import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/Theming/styles.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/features/password_recovery/presentation/cubit/password_recovery_cubit.dart';

class ResendRow extends StatelessWidget {
  const ResendRow({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PasswordRecoveryCubit>();

    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(StringManager.codeHasNotBeenReceived.tr(context),
          style: Styles.textStyle12.copyWith(color: AppColors.greyColor2)),
      TextButton(
          onPressed: () =>
              cubit.validateToRequestCode(context,resendResetPasswordCode: true),
          child: Text(StringManager.resendCode.tr(context),
              style: Styles.textStyle12.copyWith(
                  fontWeight: FontWeight.bold, color: AppColors.black)))
    ]);
  }
}
