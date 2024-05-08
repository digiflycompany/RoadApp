import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp2/shared/const/app_images.dart';
import 'package:roadapp2/shared/resources/colors.dart';

class AvailableCard extends StatelessWidget {
  const AvailableCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(7.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFFD7D7D7),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            height: 8.h,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
            decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(15.r)),
            child: SvgPicture.asset(
              AppImages.carIcon,
              height: 50.h,
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            "سيارات ملاكي",
            style: TextStyle(fontSize: 12.sp),
          ),
          SizedBox(
            height: 15.h,
          ),
        ],
      ),
    );
  }
}
