import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/utils/app_assets.dart';

class DeleteAccountRow extends StatelessWidget {
  const DeleteAccountRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(AppAssets.deleteAccountIcon),
        SizedBox(width: 10.w,),
        Text(
          'تعطيل الحساب',
          style: TextStyle(
              color: Colors.red,
              fontSize: 13.sp,
              fontWeight: FontWeight.w600
          ),
        ),
      ],
    );
  }
}
