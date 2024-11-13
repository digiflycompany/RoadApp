import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:roadapp/core/widgets/custom_loading_indicator.dart';

class FavAdsShimmer extends StatelessWidget {
  const FavAdsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CustomLoadingIndicator(height: 120.h),
      Gap(20.h),
      CustomLoadingIndicator(height: 120.h),
      Gap(20.h),
      CustomLoadingIndicator(height: 120.h),
      Gap(20.h),
      CustomLoadingIndicator(height: 120.h)
    ]);
  }
}