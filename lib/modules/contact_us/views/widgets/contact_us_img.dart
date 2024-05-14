import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp2/shared/const/app_images.dart';

class ContactUsImage extends StatelessWidget {
  const ContactUsImage({super.key});

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: EdgeInsets.only(top: 24.h),
      child: Image.asset(AppImages.contactUsImg),
    );
  }
}
