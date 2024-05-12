import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp2/shared/resources/colors.dart';

class MaintenanceReportItem extends StatelessWidget {
  const MaintenanceReportItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            color: AppColors.primaryColor.withOpacity(0.27),
            child: Column(
              children: [
                SizedBox(height: 6.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("مركز الخدمة: أحمد حسني",
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600
                    ),),
                    SizedBox(width: 14.w,),
                    Text("رقم الهاتف: 0123456789",
                      style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600
                      ),),
                  ],
                ),
                Text("التاريخ : 15/9/2023",
                  style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600
                  ),),
                SizedBox(height: 6.h,),

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
                    Text("نوع الخدمة: غيار زيت",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    ),
                    SizedBox(height: 20.h,),
                    Text("نوع المنتج: زيت شيل 05W40",
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
                    Text("السعر: 50",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),),
                    SizedBox(height: 20.h,),
                    Text("السعر: 1200",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.grey[300],
            height: 1,
          ),
          SizedBox(
            height: 15.h,
          ),
          Padding(
            padding:  EdgeInsets.only(left: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("الإجمالي: 1250",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),),
              ],
            ),
          ),
          SizedBox(height: 15.h),
        ],
      ),
    );
  }
}
