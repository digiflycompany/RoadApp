import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/features/account/presentation/manager/account_cubit.dart';

class AccountDetailsButton extends StatelessWidget {
  const AccountDetailsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => AccountCubit.get(context).validateToSave(),
      child: Center(
        child: Container(
          width: 230.w,
          height: 60.h,
          decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(10.r)
          ),
          child: Center(
            child: Text(
                StringManager.save.tr(context)
            )
          )
        )
      ),
    );
  }
}
