import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/modules/notification/views/widgets/notification_icon.dart';
import 'package:roadapp/shared/resources/colors.dart';

class NotificationBox extends StatelessWidget {
  const NotificationBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 75.h,
      decoration: BoxDecoration(
        color: AppColors.greyColor3,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          const NotificationIcon(),
          SizedBox(width: 16.w,),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 14.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء',
                  style: TextStyle(
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w600
                  ),),
                Text('منذ دقيقة',
                  style: TextStyle(
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w600
                  ),),
              ],
            ),
          )
        ],
      ),
    );
  }
}
