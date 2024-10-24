import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/utils/string_manager.dart';

class VehicleData extends StatelessWidget {
  const VehicleData({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
        width: 230.w,
        padding: const EdgeInsets.symmetric(
            vertical: 8),
        decoration: BoxDecoration(
            borderRadius:
            BorderRadius.circular(5),
            color: Colors.black),
        child: Row(
            mainAxisAlignment:
            MainAxisAlignment.center,
            children: [
              Text("1",
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.tertiary)),
              SizedBox(width: 10.w),
              Text(
                  StringManager.toyota
                      .tr(context),
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.tertiary)),
              SizedBox(width: 10.w),
              Text(
                  StringManager.corolla
                      .tr(context),
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.tertiary)),
              SizedBox(width: 10.w),
              Text("2015",
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.tertiary)),
              SizedBox(width: 10.w),
              Text(StringManager.abh.tr(context),
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.tertiary)),
              const Gap(3),
              Text(
                  StringManager.licensePlate
                      .tr(context),
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.tertiary))
            ]));
  }
}
