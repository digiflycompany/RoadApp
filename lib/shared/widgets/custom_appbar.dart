import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp2/shared/const/app_images.dart';

import '../resources/colors.dart';

Size preferredSize = Size(double.infinity, 76.h);

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, required this.text, this.leading})
      : super(key: key);

  final String text;

  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.primaryColor,
      centerTitle: true,
      title: Text(
        text.tr(),
        style: TextStyle(
            fontSize: 16.sp,
            fontFamily: 'NotoKufiArabic',
            fontWeight: FontWeight.w600),
      ),
      leading: leading,
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SvgPicture.asset(AppImages.notification),
        ),
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.sp),
            bottomRight: Radius.circular(20.sp)),
      ),
    );
  }
}
