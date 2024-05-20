import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/shared/const/app_images.dart';
import 'package:roadapp/shared/resources/colors.dart';

class CouponIcon extends StatelessWidget {
  const CouponIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(AppImages.couponsIcon,color: AppColors.greyColor3,);
  }
}
