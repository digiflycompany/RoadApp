import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/features/password_recovery/presentation/cubit/password_recovery_cubit.dart';

class VerifyCodeButton extends StatelessWidget {
  const VerifyCodeButton({super.key, this.justRegistered});
  final bool? justRegistered;

  @override
  Widget build(BuildContext context) {
    var cubit = PasswordRecoveryCubit.get(context);
    return SizedBox(
        width: 202.w,
        height: 47.h,
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                const WidgetStatePropertyAll(
                    AppColors.primaryColor),
                shape:
                WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(
                            15.r)))),
            onPressed: () =>
                cubit.validateToVerifyCode(justRegistered: justRegistered),
            child: Text(StringManager.send.tr(context),
                style: TextStyle(
                    color: AppColors.secondColor,
                    fontSize: 11.sp))));
  }
}
