import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/utils/app_assets.dart';
import 'package:roadapp/core/Theming/colors.dart';

class SoonSector extends StatelessWidget {
  const SoonSector({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(children: [
      Stack(alignment: Alignment.center, children: [
        Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Container(
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(10.r)),
                height: width * .35,
                width: width * .35)),
        Container(
            width: double.infinity,
            height: width * .499,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.r),
                color: AppColors.black.withOpacity(0.35))),
        SvgPicture.asset(AppAssets.comingSoon, height: width * .2)
      ])
    ]);
  }
}