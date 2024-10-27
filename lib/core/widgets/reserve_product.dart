import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/helpers/app_assets.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/features/maintenance_center_details/cubit/maintenance_center_details_cubit.dart';
import 'package:roadapp/features/maintenance_center_details/cubit/maintenance_center_details_states.dart';

class ReserveProduct extends StatelessWidget {
  const ReserveProduct({super.key});

  @override
  Widget build(BuildContext context) {
    bool isArabic = Localizations.localeOf(context).languageCode == 'ar';
    return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration:
            BoxDecoration(border: Border.all(color: const Color(0xFFE5E5E5))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(StringManager.reserveProduct.tr(context),
              style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold)),
          BlocBuilder<MaintenanceCenterDetailsCubit,
              MaintenanceCenterDetailsStates>(builder: (context, state) {
            var cubit = context.read<MaintenanceCenterDetailsCubit>();
            return Row(children: [
              Expanded(
                  child: GestureDetector(
                      onTap: () {
                        cubit.pickupDate();
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 10.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: const Color(0xFFF9F9F9)),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    "${cubit.dateTime.year} / ${cubit.dateTime.month} / ${cubit.dateTime.day}",
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        color: const Color(0xFFAAAAAA))),
                                SvgPicture.asset(AppAssets.calenderIcon,
                                    width: 15.w, height: 15.h)
                              ])))),
              SizedBox(width: 10.w),
              GestureDetector(
                  onTap: () {
                    cubit.pickupTime();
                  },
                  child: Container(
                      width: 40.w,
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 10.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: const Color(0xFFF9F9F9)),
                      child: Center(
                          child: Text(
                              cubit.timeOfDay.minute.toString().padLeft(2, '0'),
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  color: const Color(0xFFAAAAAA)))))),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: const Text(":",
                      style: TextStyle(fontWeight: FontWeight.bold))),
              GestureDetector(
                  onTap: () {
                    cubit.pickupTime();
                  },
                  child: Container(
                      width: 40.w,
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 10.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: const Color(0xFFF9F9F9)),
                      child: Center(
                          child: Text(
                              cubit.timeOfDay.hourOfPeriod
                                  .toString()
                                  .padLeft(2, '0'),
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  color: const Color(0xFFAAAAAA)))))),
              SizedBox(width: 10.w),
              GestureDetector(
                  onTap: () {
                    cubit.pickupTime();
                  },
                  child: Container(
                      width: 40.w,
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 10.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: const Color(0xFFF9F9F9)),
                      child: Center(
                          child: Text(cubit.timeOfDay.period.name,
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  color: const Color(0xFFAAAAAA))))))
            ]);
          }),
          SizedBox(height: 10.h),
          Container(
              height: 100.h,
              width: double.infinity,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20.r)),
              child: TextFormField(
                  maxLines: 10,
                  decoration: InputDecoration(
                      suffixIcon: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                                padding: EdgeInsets.all(5.r),
                                margin: EdgeInsets.all(10.r),
                                decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: isArabic
                                    ? SvgPicture.asset(AppAssets.sendIcon,
                                        width: 20.w)
                                    : Transform(
                                        alignment: Alignment.center,
                                        transform: Matrix4.identity()
                                          ..scale(-1.0, 1.0),
                                        child: SvgPicture.asset(
                                            AppAssets.sendIcon,
                                            width: 20.w),
                                      ))
                          ]),
                      filled: true,
                      fillColor: const Color(0xFF707070).withOpacity(0.05),
                      contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      border: InputBorder.none),
                  controller: TextEditingController()))
        ]));
  }
}