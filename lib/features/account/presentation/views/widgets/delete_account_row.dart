import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/app_assets.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/features/account/presentation/views/widgets/delete_account_popup.dart';

class DeleteAccountRow extends StatelessWidget {
  const DeleteAccountRow({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => showDeleteAccConfirmationDialog(context),
        child: Row(children: [
          SvgPicture.asset(AppAssets.deleteAccountIcon),
          SizedBox(width: 10.w),
          Text(StringManager.deActivateAccount.tr(context),
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600))
        ]));
  }
}