import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/utils/app_assets.dart';

class CouponIcon extends StatelessWidget {
  const CouponIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(AppAssets.couponsIcon, color: AppColors.greyColor3);
  }
}