import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/features/password_recovery/cubit/password_recovery_cubit.dart';

class SendCodeButton extends StatelessWidget {
  const SendCodeButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PasswordRecoveryCubit>();
    return SizedBox(
        width: 202.w,
        height: 47.h,
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    const WidgetStatePropertyAll(AppColors.primaryColor),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.r)))),
            onPressed: () => cubit.validateToRequestCode(),
            child: Text(StringManager.send.tr(context),
                style:
                    TextStyle(color: AppColors.secondColor, fontSize: 11.sp))));
  }
}