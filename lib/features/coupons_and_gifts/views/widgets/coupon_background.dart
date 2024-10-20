import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/utils/app_assets.dart';

class CouponBackground extends StatelessWidget {
  const CouponBackground({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SvgPicture.asset(AppAssets.couponsIcon, color: AppColors.greyColor3, width: 350);
  }
}