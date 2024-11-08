import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:roadapp/core/widgets/custom_loading_indicator.dart';

class ReservationsShimmer extends StatelessWidget {
  const ReservationsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomLoadingIndicator(height: 40.h),
        Gap(8.h),
        CustomLoadingIndicator(height: 30.h),
        CustomLoadingIndicator(height: 30.h),
        CustomLoadingIndicator(height: 30.h)
      ]
    );
  }
}
