import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp2/shared/const/app_images.dart';

class DrawerHeaderComponent extends StatelessWidget {
  const DrawerHeaderComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 50.h,horizontal: 26.w),
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            Image.asset(width: 70.w, height: 70.h, AppImages.person),
            SizedBox(width: 6.5.w,),
            Text(
                "يوسف حنفي",
              style: TextStyle(
                color: Colors.black,
                fontSize: 13.sp,
                fontWeight: FontWeight.w500
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
