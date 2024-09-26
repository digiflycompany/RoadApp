import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/utils/app_assets.dart';
import 'package:roadapp/core/Theming/colors.dart';

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
                AppAssets.person
              )
            ),
            Align(
              alignment: AlignmentDirectional.center,
              child: Padding(
                padding: EdgeInsets.only(top: 79.h, left: 78.w),
                child: Container(
                  width: 25.w,
                  height: 25.h,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Transform.scale(
                      scale: 0.55, child: SvgPicture.asset(AppAssets.editIcon)),
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 10.h),
        Text(
          "أحمد جلال الدين",
          style: TextStyle(
              fontSize: 13.sp,
              color: AppColors.tertiary,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
