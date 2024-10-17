import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/utils/app_assets.dart';

class ContactUsImage extends StatelessWidget {
  const ContactUsImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 24.h),
      child: Image.asset(AppAssets.contactUsImg),
    );
  }
}