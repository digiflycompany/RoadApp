import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/features/notification/views/widgets/notification_icon.dart';
import 'package:roadapp/core/Theming/colors.dart';

class NotificationBox extends StatelessWidget {
  const NotificationBox({super.key, required this.title, required this.date});
  final String title ;
  final String date ;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 65.h,
        decoration: BoxDecoration(
            color: AppColors.greyColor3,
            borderRadius: BorderRadius.circular(10.r)),
        padding: const EdgeInsets.all(14),
        child: Row(children: [
          const NotificationIcon(),
          SizedBox(width: 16.w),
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                Text(title,
                    style:
                        TextStyle(fontSize: 9.sp, fontWeight: FontWeight.w600),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1),
                Text( date,
                    style:
                        TextStyle(fontSize: 9.sp, fontWeight: FontWeight.w600))
              ]))
        ]));
  }
}