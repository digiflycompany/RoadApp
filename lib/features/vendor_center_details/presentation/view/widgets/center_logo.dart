import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/utils/app_assets.dart';

class CenterLogo extends StatelessWidget {
  const CenterLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 150.h,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Stack(alignment: Alignment.bottomCenter, children: [
              Image.asset(
                  width: double.infinity,
                  fit: BoxFit.cover,
                  AppAssets.carServiceWorker),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(4.r)),
                        margin: EdgeInsets.all(5.r),
                        padding: EdgeInsets.all(5.r),
                        child: SvgPicture.asset(AppAssets.editReservationIcon,
                            height: 15.h,
                            colorFilter: const ColorFilter.mode(
                                Colors.black, BlendMode.srcIn))),
                    Container(
                        height: 30.h,
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        color: AppColors.secondColor.withOpacity(0.56),
                        child: Row(children: [
                          Text("مركز الوكيل",
                              style: TextStyle(
                                  fontSize: 9.sp, color: AppColors.tertiary)),
                          const Spacer(),
                          SvgPicture.asset(AppAssets.pinIcon,
                              height: 7.h,
                              width: 7.w,
                              colorFilter: const ColorFilter.mode(
                                  Colors.red, BlendMode.srcIn)),
                          SizedBox(width: 5.w),
                          Container(
                              height: 10.h, width: .7.w, color: Colors.white),
                          SizedBox(width: 5.w),
                          Text("عباس العقاد - مدينة نصر",
                              style: TextStyle(
                                  fontSize: 9.sp, color: AppColors.tertiary))
                        ]))
                  ])
            ])));
  }
}