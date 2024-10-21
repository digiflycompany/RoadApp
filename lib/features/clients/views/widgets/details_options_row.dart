import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/utils/app_assets.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/core/widgets/share_button.dart';

class DetailsOptionsRow extends StatelessWidget {
  const DetailsOptionsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
          padding:
              EdgeInsets.only(right: 25.w, left: 10.w, top: 5.h, bottom: 5.h),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5), bottomLeft: Radius.circular(5)),
              color: AppColors.primaryColor),
          child: Text(StringManager.ratedForLevel.tr(context),
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700))),
      const Spacer(),
      Container(
          decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(4.r)),
          margin: EdgeInsets.all(5.r),
          padding: EdgeInsets.all(5.r),
          child: SvgPicture.asset(AppAssets.editReservationIcon,
              height: 15.h,
              colorFilter:
                  const ColorFilter.mode(Colors.black, BlendMode.srcIn))),
      SizedBox(width: 10.w),
      const ShareButton(),
      SizedBox(width: 10.w),
      SvgPicture.asset(AppAssets.filterIcon, width: 20.w),
      SizedBox(width: 16.w)
    ]);
  }
}