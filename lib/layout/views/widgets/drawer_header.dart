import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp2/shared/const/app_images.dart';

class DrawerHeaderComponent extends StatelessWidget {
  const DrawerHeaderComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 50.h),
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            Image.asset(width: 64.w, height: 64.h, AppImages.person),
            const Column(
              children: [
                Text("محمد هاني"),
                Text("BMW"),
              ],
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
