import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/widgets/custom_cached_network_image.dart';
import 'package:roadapp/features/search/data/models/countries_model.dart';

class AvailableCountry extends StatelessWidget {
  const AvailableCountry({super.key, required this.country, required this.selected});
  final bool selected;
  final Country country;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width,
        height = MediaQuery.of(context).size.height;
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(
            color: selected? AppColors.greyColor: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(7.r),
            boxShadow: const [
              BoxShadow(
                  color: Color(0xFFD7D7D7), blurRadius: 4, offset: Offset(0, 2))
            ]),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(height: 8.h),
          Container(
              height: width >= 500 ? height * .3 : 110.h,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: width >= 500 ? 50: 20.w, vertical: width >= 500 ? 150: 30.h),
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(15.r)),
              child: CustomCachedNetworkImage(url: country.flag!, radius: 0)),
          SizedBox(height: 8.h),
          Expanded(child: Text(country.name, style: TextStyle(fontSize:  width >= 500 ? 24: 12)))
        ]));
  }
}