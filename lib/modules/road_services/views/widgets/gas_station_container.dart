import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp2/shared/const/app_images.dart';
import 'package:roadapp2/shared/resources/colors.dart';

class GasStationContainer extends StatelessWidget {
  const GasStationContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 14.h),
      child: Row(
        children: [
          Container(
            width: 280.w,
            height: 90.h,
            decoration: BoxDecoration(
              color: AppColors.greyColor3,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: AppColors.primaryColor,width: 1.w),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w,vertical: 9.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppImages.gasIcon),
                  SizedBox(width: 14.w,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('محطة توتال',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),),
                      Text('شارع الميرغني - مصر الجديدة',
                        style: TextStyle(
                          fontSize: 9.sp,
                          fontWeight: FontWeight.w600,
                        ),),
                      Text('0123456789',
                        style: TextStyle(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w600,
                        ),)
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(width: 3.w,),
          Expanded(
            child: Container(
              height: 90.h,
              decoration: BoxDecoration(
                color: AppColors.greyColor3,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: AppColors.primaryColor,width: 1.w),
              ),
              child: Padding(
                padding:  EdgeInsets.symmetric(vertical: 8.h,horizontal: 4.w),
                child: Column(
                  children: [
                    SvgPicture.asset(AppImages.locationIcon,width: 20.w,),
                    const Spacer(),
                    Text('قائمة الخدمات',textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w600
                    ),),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
