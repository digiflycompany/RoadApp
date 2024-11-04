import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:roadapp/core/widgets/custom_loading_indicator.dart';

class AccountLoadingShimmer extends StatelessWidget {
  const AccountLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Gap(20.h),
      CustomLoadingIndicator(height: 100.h, circular: true),
      Gap(40.h),
      CustomLoadingIndicator(height: 50.h),
      Gap(40.h),
      CustomLoadingIndicator(height: 50.h),
      Gap(40.h),
      CustomLoadingIndicator(height: 50.h),
      Gap(40.h),
      CustomLoadingIndicator(height: 50.h),
      Gap(40.h),
      CustomLoadingIndicator(height: 50.h)
    ]);
  }
}