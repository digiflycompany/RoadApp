import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/features/auth/presentation/manager/auth_cubit.dart';

class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({super.key, this.person});
  final bool? person;

  @override
  Widget build(BuildContext context) {
    var cubit = AuthCubit.get(context);
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
            onPressed: () => person == true? cubit.validatePersonToSignUp() :cubit.validateOrganizationToSignUp(),
            child: Text(StringManager.createAccount.tr(context),
                style:
                    TextStyle(color: AppColors.secondColor, fontSize: 11.sp))));
  }
}