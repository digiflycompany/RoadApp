import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/Theming/styles.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/calendar_custom_alert_dialog.dart';
import 'package:roadapp/core/widgets/calendar_dialog.dart';
import 'package:roadapp/core/helpers/app_assets.dart';
import 'package:roadapp/core/Theming/colors.dart';

class VendorReservationManagementsCenter extends StatelessWidget {
  const VendorReservationManagementsCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF),
            boxShadow: const [
              BoxShadow(
                  color: Color(0xFFD7D7D7),
                  blurRadius: 10,
                  offset: Offset(0, 2))
            ],
            borderRadius: BorderRadius.circular(4)),
        padding: const EdgeInsets.all(5),
        child: Column(children: [
          Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.27),
                  borderRadius: BorderRadius.circular(4)),
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(children: [
                SizedBox(height: 6.h),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text("${StringManager.serviceCenter.tr(context)} السلام",
                      style: Styles.textStyle12.copyWith(fontSize: 9)),
                  SizedBox(width: 40.w),
                  Text("${StringManager.phoneNumber.tr(context)}: 0123456789",
                      style: Styles.textStyle12.copyWith(fontSize: 9))
                ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("${StringManager.date.tr(context)}: 15/9/2023",
                          style: Styles.textStyle12.copyWith(fontSize: 9))
                    ])
              ])),
          Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "${StringManager.serviceType.tr(context)}: غيار زيت",
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600)),
                          const SizedBox(height: 20),
                          Text(
                              "${StringManager.productType.tr(context)}: زيت شيل 05W40",
                              style: TextStyle(
                                  fontSize: 12.sp, fontWeight: FontWeight.w600))
                        ]),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${StringManager.price.tr(context)}: 50",
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600)),
                          const SizedBox(height: 20),
                          Text("${StringManager.price.tr(context)}: 1200",
                              style: TextStyle(
                                  fontSize: 12.sp, fontWeight: FontWeight.w600))
                        ])
                  ])),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(AppAssets.closeIcon, height: 30),
                    GestureDetector(
                        onTap: () {
                          calendarCustomAlertDialog(
                              context: context,
                              title: StringManager.dateSelection.tr(context),
                              content: const CalendarDialogContent());
                        },
                        child: SvgPicture.asset(AppAssets.scheduleIcon,
                            height: 30)),
                    SvgPicture.asset(AppAssets.checkIcon, height: 30)
                  ])),
          const SizedBox(height: 15)
        ]));
  }
}