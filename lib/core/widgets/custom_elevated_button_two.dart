import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Theming/colors.dart';

class CustomElevatedButtonTwo extends StatelessWidget {
  final Widget widget;
  final void Function()? onTap;
  final double? borderRadius;
  final Color? fontColor;
  final double? fontSize;
  final Color? color;
  final double? width;
  final double? height;

  const CustomElevatedButtonTwo({
    super.key,
    this.onTap,
    this.borderRadius,
    this.fontColor,
    required this.widget,
    this.fontSize,
    this.color,
    this.width = 50,
    this.height = 48,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(width!.w, height!.h),
          elevation: 0,
          backgroundColor: color ?? AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 7.r),
          ),
        ),
        child: widget);
  }
}
