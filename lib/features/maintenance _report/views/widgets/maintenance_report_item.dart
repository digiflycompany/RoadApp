import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/utils/string_manager.dart';

class MaintenanceReportItem extends StatelessWidget {
  const MaintenanceReportItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r)
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            color: AppColors.primaryColor.withOpacity(0.27),
            child: Column(
              children: [
                SizedBox(height: 6.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(StringManager.serviceCenter.tr(context),
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600
                        )),
                        Text(" أحمد حسني",
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600
                        ))
                      ]
                    ),
                    SizedBox(width: 14.w),
                    Row(
                      children: [
                        Text(StringManager.phoneNumber.tr(context),
                          style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600
                          )),
                        Text(": 0123456789",
                          style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600
                          ))
                      ]
                    )
                  ]
                ),
                Row(
                  children: [
                    Text(StringManager.date.tr(context),
                      style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600
                      )),
                    Text(": 15/9/2023",
                      style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600
                      ))
                  ]
                ),
                SizedBox(height: 6.h)

              ]
            )
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(StringManager.serviceType.tr(context),
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600
                        )
                        ),
                        Text(": غيار زيت",
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600
                        )
                        )
                      ]
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Text(StringManager.productType.tr(context),
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600
                          )
                        ),
                        Text(": زيت شيل 05W40",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600
                          )
                        )
                      ]
                    )
                  ]
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(StringManager.price.tr(context),
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600
                          )),
                        Text(": 50",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600
                          ))
                      ]
                    ),
                    SizedBox(height: 20.h),
                    Row(
                        children: [
                          Text(StringManager.price.tr(context),
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600
                              )),
                          Text(": 1200",
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600
                              ))
                        ]
                    )
                  ]
                )
              ]
            )
          ),
          Container(
            width: double.infinity,
            color: Colors.grey[300],
            height: 1
          ),
          SizedBox(
            height: 15.h
          ),
          Padding(
            padding:  EdgeInsets.only(left: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Text(StringManager.total.tr(context),
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600
                      )),
                    Text(": 1250",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600
                      ))
                  ]
                )
              ]
            )
          ),
          SizedBox(height: 15.h)
        ]
      )
    );
  }
}
