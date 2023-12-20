import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp2/shared/const/app_images.dart';
import 'package:roadapp2/shared/resources/colors.dart';

class ProfileInformation extends StatelessWidget {
  const ProfileInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          width: 100.w,
          height: 100.h,
          AppImages.person3,
        ),
        SizedBox(height: 10.h),
        Text(
          "أحمد جلال الدين",
          style: TextStyle(fontSize: 13.sp, color: AppColors.tertiary),
        ),
      ],
    );
  }
}