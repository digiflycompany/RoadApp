import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/features/reset%20password/presentation/cubit/cubit.dart';

class ResetPasswordButton extends StatelessWidget {
  const ResetPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = ResetPasswordCubit.get(context);
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
            onPressed: () => cubit.validateToResetPassword(),
            child: Text(StringManager.finish.tr(context),
                style:
                    TextStyle(color: AppColors.secondColor, fontSize: 11.sp))));
  }
}