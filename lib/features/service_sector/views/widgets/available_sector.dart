import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/app_assets.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/helpers/string_manager.dart';

class AvailableSector extends StatelessWidget {
  const AvailableSector({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width, height = MediaQuery.of(context).size.height;
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(7.r),
            boxShadow: const [
              BoxShadow(
                  color: Color(0xFFD7D7D7), blurRadius: 4, offset: Offset(0, 2))
            ]),
        child: Column(
            mainAxisSize: MainAxisSize.min, children: [
          SizedBox(height: 8.h),
          Container(
              height: width >= 500? height * .3: 110.h,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(15.r)),
              child: SvgPicture.asset(AppAssets.carIcon, height: 50.h)),
          SizedBox(height: 8.h),
          Expanded(
              child: Text(StringManager.personalCar.tr(context),
                  style: TextStyle(fontSize: 12.sp)))
        ]));
  }
}