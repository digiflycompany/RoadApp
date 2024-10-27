import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_button.dart';
import 'package:roadapp/features/auth/presentation/cubit/auth_cubit.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = AuthCubit.get(context);
    return SizedBox(
        width: 202.w,
        height: 47.h,
        child: CustomElevatedButton(
            onTap: () => cubit.validateToLogin(),
            widget: Text(StringManager.login.tr(context),
                style:
                    TextStyle(color: AppColors.secondColor, fontSize: 11.sp)),
            radiusAllNumber: 10));
  }
}