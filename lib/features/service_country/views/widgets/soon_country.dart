import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/utils/app_assets.dart';
import 'package:roadapp/core/Theming/colors.dart';

class SoonCountry extends StatelessWidget {
  const SoonCountry({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(10.r)),
                height: 150.h,
                width: 150.w,
              ),
            ),
            Container(
              width: 170.w,
              height: 170.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.r),
                color: AppColors.blackColor.withOpacity(0.35),
              ),
            ),
            SvgPicture.asset(
              AppAssets.comingSoon,
              height: 70.h,
            ),
          ],
        ),
      ],
    );
  }
}
