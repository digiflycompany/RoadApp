import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_elevated_button_two.dart';
import 'package:roadapp/features/account/presentation/manager/account_cubit.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = AccountCubit.get(context);
    return CustomElevatedButtonTwo(
        width: 200.w,
        height: 60.h,
        onTap: () => cubit.validateVendorToSave(),
        widget: Text(StringManager.save.tr(context),
            style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600)));
  }
}