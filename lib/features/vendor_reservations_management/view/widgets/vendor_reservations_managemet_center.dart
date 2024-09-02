import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/widgets/calendar_custom_alert_dialog.dart';
import 'package:roadapp/core/widgets/calendar_dialog.dart';
import 'package:roadapp/core/utils/app_assets.dart';
import 'package:roadapp/core/Theming/colors.dart';

class VendorReservationManagementsCenter extends StatelessWidget {
  const VendorReservationManagementsCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Color(0xFFFFFFFF), boxShadow: [
        BoxShadow(
            color: Color(0xFFD7D7D7), blurRadius: 10, offset: Offset(0, 2)),
      ]),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            color: AppColors.primaryColor.withOpacity(0.27),
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              children: [
                SizedBox(
                  height: 6.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "مركز الخدمة: السلام",
                      style: TextStyle(
                          fontSize: 10.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 40.w,
                    ),
                    Text(
                      "رقم الهاتف: 0123456789",
                      style: TextStyle(
                          fontSize: 10.sp, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "التاريخ : 15/9/2023",
                      style: TextStyle(
                          fontSize: 10.sp, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "نوع الخدمة: غيار زيت",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      "نوع المنتج: زيت شيل 05W40",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "السعر: 50",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      "السعر: 1200",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  AppAssets.closeIcon,
                  height: 35.h,
                ),
                GestureDetector(
                  onTap: (){
                      calendarCustomAlertDialog(
                          context: context,
                          title: "تحديد اليوم",
                          content: const CalendarDialogContent()
                      );
                  },
                  child: SvgPicture.asset(
                    AppAssets.scheduleIcon,
                    height: 35.h,
                  ),
                ),
                SvgPicture.asset(
                  AppAssets.checkIcon,
                  height: 35.h,
                ),
              ],
            ),
          ),
          SizedBox(height: 15.h),
        ],
      ),
    );
  }
}