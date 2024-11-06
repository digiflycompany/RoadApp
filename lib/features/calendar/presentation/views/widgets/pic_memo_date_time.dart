import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:roadapp/core/helpers/app_assets.dart';
import 'package:roadapp/features/calendar/presentation/cubit/add_memo/add_memo_cubit.dart';
import 'package:roadapp/features/calendar/presentation/cubit/add_memo/add_memo_state.dart';

class PicMemoDateTime extends StatelessWidget {
  const PicMemoDateTime({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddMemoCubit, AddMemoState>(builder: (context, state) {
      var cubit = AddMemoCubit.get(context);
      return Row(
        children: [
          Expanded(
              child: GestureDetector(
                  onTap: () {
                    cubit.pickupDate(context);
                  },
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 6.w),
                      height: 22.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: const Color(0xFFF9F9F9)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                "${cubit.dateTime.year} / ${cubit.dateTime.month} / ${cubit.dateTime.day}",
                                style: TextStyle(
                                    fontSize: 8.sp,
                                    color: const Color(0xFFAAAAAA))),
                            Gap(4.w),
                            SvgPicture.asset(AppAssets.calenderIcon,
                                width: 10.w, height: 10.h)
                          ])))),
          SizedBox(width: 10.w),
          GestureDetector(
              onTap: () {
                cubit.pickupTime(context);
              },
              child: Container(
                  width: 40.w,
                  height: 22.h,
                  
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: const Color(0xFFF9F9F9)),
                  child: Center(
                      child: Text(
                          cubit.timeOfDay.minute.toString().padLeft(2, '0'),
                          style: TextStyle(
                              fontSize: 8.sp,
                              color: const Color(0xFFAAAAAA)))))),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: const Text(":", style: TextStyle(fontWeight: FontWeight.bold))),
          GestureDetector(
              onTap: () {
                cubit.pickupTime(context);
              },
              child: Container(
                  width: 40.w,
                  height: 22.h,
                  
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: const Color(0xFFF9F9F9)),
                  child: Center(
                      child: Text(
                          cubit.timeOfDay.hourOfPeriod.toString().padLeft(2, '0'),
                          style: TextStyle(
                              fontSize: 8.sp,
                              color: const Color(0xFFAAAAAA)))))),
          SizedBox(width: 10.w),
          GestureDetector(
              onTap: () {
                cubit.pickupTime(context);
              },
              child: Container(
                  width: 40.w,
                  height: 22.h,
                  
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: const Color(0xFFF9F9F9)),
                  child: Center(
                      child: Text(cubit.timeOfDay.period.name,
                          style: TextStyle(
                              fontSize: 8.sp, color: const Color(0xFFAAAAAA)))))),
        ],
      );
    });
  }
}
