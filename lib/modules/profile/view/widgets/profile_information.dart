import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp2/shared/const/app_images.dart';
import 'package:roadapp2/shared/resources/colors.dart';

class ProfileInformation extends StatelessWidget {
  const ProfileInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Center(
              child: Image.asset(
                width: 116.w,
                height: 116.h,
                  AppImages.person,
              ),
            ),
            Align(
              alignment: AlignmentDirectional.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 75,left: 78),
                child: Container(
                  width: 25.w,
                  height: 25.h,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Transform.scale(
                      scale: 0.55,
                      child: SvgPicture.asset(AppImages.editIcon)),
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 10.h),
        Text(
          "أحمد جلال الدين",
          style: TextStyle(fontSize: 13.sp, color: AppColors.tertiary,fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}