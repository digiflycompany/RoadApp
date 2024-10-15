import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/app_assets.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/utils/string_manager.dart';

class AvailableCountry extends StatelessWidget {
  const AvailableCountry({super.key});

  @override
  Widget build(BuildContext context) {double width = MediaQuery.of(context).size.width, height = MediaQuery.of(context).size.height;
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(7.r),
            boxShadow: const [
              BoxShadow(
                  color: Color(0xFFD7D7D7), blurRadius: 4, offset: Offset(0, 2))
            ]),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(height: 8.h),
          Container(
              height: width >= 500? height * .3: 110.h,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(15.r)),
              child: Image.asset(AppAssets.flag, height: 30.h, width: 40.w)),
          SizedBox(height: 8.h),
          Expanded(
              child: Text(StringManager.egypt.tr(context),
                  style: TextStyle(fontSize: 12.sp)))
        ]));
  }
}
