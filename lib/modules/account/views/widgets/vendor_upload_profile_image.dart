import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/shared/const/app_images.dart';
import 'package:roadapp/shared/resources/colors.dart';

class VendorUploadImageProfile extends StatelessWidget {
  const VendorUploadImageProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.h,bottom: 26.h),
      child: Container(
        height: 140.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.greyColor4,
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Center(
          child: SvgPicture.asset(AppImages.emptyImageIcon,width: 36.w,),
        ),
      ),
    );
  }
}
