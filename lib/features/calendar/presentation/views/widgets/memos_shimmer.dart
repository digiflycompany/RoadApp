import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:roadapp/core/widgets/custom_loading_indicator.dart';

class MemosShimmer extends StatelessWidget {
  const MemosShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Column(
          children: [
            CustomLoadingIndicator(height: 10.h, width: width * .15),
            Gap(2.h),
            CustomLoadingIndicator(height: 10.h, width: width * .15)
          ]
        ),
        Gap(width * .07),
        CustomLoadingIndicator(height: 70.h, width: width * .65)
      ]
    );
  }
}
