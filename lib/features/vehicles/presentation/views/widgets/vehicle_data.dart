import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/helpers/string_manager.dart';

class VehicleData extends StatelessWidget {
  const VehicleData({super.key,required this.model, required this.plateNumber, required this.index, required this.nameCompany, required this.nameCar});

  final String index;
  final String nameCompany;
  final String nameCar;
  final String model;
  final String plateNumber;

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
              const Spacer(),
              Text(index,
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.tertiary)),
              //SizedBox(width: 10.w),
              const Spacer(),
              Text(
                  nameCompany,
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.tertiary)),
              //SizedBox(width: 10.w),
              const Spacer(),
              Text(
                  nameCar
                      .tr(context),
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.tertiary)),
              //SizedBox(width: 10.w),
              const Spacer(),
              Text(model,
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.tertiary)),
              SizedBox(width: 10.w),
              // Text(StringManager.abh.tr(context),
              //     style: TextStyle(
              //         fontSize: 12.sp,
              //         color: AppColors.tertiary)),
              const Gap(3),
              Text(
                  plateNumber,
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.tertiary)),

              const Spacer(),
            ]));
  }
}
