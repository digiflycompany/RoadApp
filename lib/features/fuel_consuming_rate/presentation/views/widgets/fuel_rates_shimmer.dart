import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:roadapp/core/widgets/custom_loading_indicator.dart';

class FuelRatesShimmer extends StatelessWidget {
  const FuelRatesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Gap(80.h),
      CustomLoadingIndicator(height: 120.h),
      Gap(22.h),
      CustomLoadingIndicator(height: 120.h),
      Gap(22.h),
      CustomLoadingIndicator(height: 120.h)
    ]);
  }
}