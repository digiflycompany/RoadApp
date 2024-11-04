import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/helpers/app_assets.dart';

void showDefaultLoadingIndicator(BuildContext context, {bool? cancelable}) {
  showDialog(
      barrierColor: AppColors.whiteColor.withOpacity(.3),
      context: context,
      builder: (BuildContext context) {
        return Center(
            child: SizedBox(
                width: 150.w,
                height: 150.w,
                child: LottieBuilder.asset(AppAssets.loading,
                    frameRate: const FrameRate(900))));
      },
      barrierDismissible: cancelable ?? true);
}