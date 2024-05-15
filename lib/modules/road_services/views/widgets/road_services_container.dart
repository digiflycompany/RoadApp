import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp2/shared/resources/colors.dart';

class RoadServicesContainer extends StatelessWidget {
  final String icon;
  final String title;
  const RoadServicesContainer({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 14.h),
      child: Container(
        width: double.infinity,
        height: 90.h,
        decoration: BoxDecoration(
          color: AppColors.greyColor3,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 22.w),
          child: Row(
            children: [
              SvgPicture.asset(icon),
              SizedBox(width: 35.w,),
              Text(title,
                style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
