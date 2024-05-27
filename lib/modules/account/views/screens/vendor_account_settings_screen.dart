import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/modules/account/views/widgets/vendor_upload_profile_image.dart';
import 'package:roadapp/shared/widgets/custom_appbar.dart';

class VendorAccountSettingsScreen extends StatelessWidget {
  const VendorAccountSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 76.h),
        child: const CustomAppBar(text: 'الملف الشخصي'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: const SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VendorUploadImageProfile(),

            ],
          ),
        ),
      ),
    );
  }
}
