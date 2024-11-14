import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/widgets/custom_loading_indicator.dart';

class CountriesShimmer extends StatelessWidget {
  const CountriesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width, height = MediaQuery.of(context).size.height;
    return GridView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: const ScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: .845,
            crossAxisCount: 2,
            crossAxisSpacing: 25.w,
            mainAxisSpacing: 25.h),
        itemBuilder: (context, index) => CustomLoadingIndicator(height: (width >= 500 ? height * .3 : 110.h) + 32.h),
        itemCount: 6);
  }
}
