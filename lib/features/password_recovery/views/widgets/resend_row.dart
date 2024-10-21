import 'package:flutter/material.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/Theming/styles.dart';
import 'package:roadapp/core/utils/string_manager.dart';

class ResendRow extends StatelessWidget {
  const ResendRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(StringManager.codeHasNotBeenReceived.tr(context),
          style: Styles.textStyle12.copyWith(color: AppColors.greyColor2)),
      TextButton(
          onPressed: () {},
          child: Text(StringManager.resendCode.tr(context),
              style: Styles.textStyle12.copyWith(
                  fontWeight: FontWeight.bold, color: AppColors.black)))
    ]);
  }
}