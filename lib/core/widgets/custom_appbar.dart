import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/helpers/navigation/navigation.dart';
import 'package:roadapp/core/helpers/app_assets.dart';
import 'package:roadapp/features/notification/views/screens/notification_screen.dart';

Size preferredSize = Size(double.infinity, 76.h);

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, required this.text, this.leading,  this.notificationIcon=true})
      : super(key: key);

  final String text;

  final bool? notificationIcon;

  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.primaryColor,
      centerTitle: true,
      title: Text(
        text,
        style: TextStyle(fontSize: 16.sp, fontFamily: 'NotoKufiArabic',fontWeight: FontWeight.w600),
      ),
      leading: leading,
      actions:   [
        if(notificationIcon==true)...[
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: ()=> AppNavigation.navigate(const NotificationScreen()),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child:   SvgPicture.asset(AppAssets.notification),
            ),
          ),
        ],
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.sp),
            bottomRight: Radius.circular(20.sp)),
      ),
    );
  }
}
