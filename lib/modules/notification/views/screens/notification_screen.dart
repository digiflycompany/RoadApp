import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp2/modules/notification/views/widgets/notification_icon.dart';
import 'package:roadapp2/shared/resources/colors.dart';
import 'package:roadapp2/shared/widgets/custom_appbar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: preferredSize,
          child: const CustomAppBar(text: 'الاشعارات',notificationIcon: false,)),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.r),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               SizedBox(height: 16.h,),
               Container(
                  width: double.infinity,
                  height: 75.h,
                  decoration: BoxDecoration(
                    color: AppColors.greyColor3,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                 child: Row(
                   children: [
                     const NotificationIcon(),
                     Column(
                       children: [
                         Text('هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء',
                         style: TextStyle(
                           fontSize: 9.sp
                         ),),
                       ],
                     )
                   ],
                 ),
               )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
