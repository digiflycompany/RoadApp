import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/features/notification/views/widgets/notification_box.dart';

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
               const NotificationBox(),
                SizedBox(height: 14.h,),
                const NotificationBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
