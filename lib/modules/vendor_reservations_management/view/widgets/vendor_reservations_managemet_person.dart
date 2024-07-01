import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/shared/const/app_images.dart';
import 'package:roadapp/shared/resources/colors.dart';
import 'package:roadapp/shared/widgets/calendar_custom_alert_dialog.dart';
import 'package:roadapp/shared/widgets/calendar_dialog.dart';

class VendorReservationManagementsPerson extends StatelessWidget {
  const VendorReservationManagementsPerson({super.key});

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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "الاسم: أحمد",
                      style: TextStyle(
                          fontSize: 9.sp, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "السيارة: نيسان صني",
                      style: TextStyle(
                          fontSize: 9.sp, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "رقم الهاتف: 0123456789",
                      style: TextStyle(
                          fontSize: 9.sp, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Spacer(),
                    Text(
                      "التاريخ : 15/9/2023",
                      style: TextStyle(
                          fontSize: 9.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 30.w,
                    ),
                    Text(
                      "الوقت : 04:00",
                      style: TextStyle(
                          fontSize: 9.sp, fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
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
                  AppImages.closeIcon,
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
                    AppImages.scheduleIcon,
                    height: 35.h,
                  ),
                ),
                SvgPicture.asset(
                  AppImages.checkIcon,
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
