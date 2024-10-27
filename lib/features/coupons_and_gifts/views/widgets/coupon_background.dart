import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/helpers/app_assets.dart';

class CouponBackground extends StatelessWidget {
  const CouponBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(AppAssets.couponsIcon,
        width: 350,
        colorFilter:
            const ColorFilter.mode(AppColors.greyColor3, BlendMode.srcIn));
  }
}