import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Theming/colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final Widget widget;
  final Function onTap;
  final double? radiusAllNumber;
  final Color? fontColor;
  final double? fontSize;
  final Color? color;
  final double? width;
  final double? height, padding;
  final BorderRadiusGeometry? borderRadius;

  const CustomElevatedButton(
      {super.key,
      required this.onTap,
      this.radiusAllNumber,
      this.fontColor,
      required this.widget,
      this.fontSize,
      this.color,
      this.width = 73,
      this.height = 29,
      this.padding, this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
          onPressed: () {
            onTap();
          },
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(padding ?? 0),
              minimumSize: Size(width!.w, height!.h),
              elevation: 0,
              backgroundColor: color ?? AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: borderRadius ?? BorderRadius.circular(radiusAllNumber ?? 7.r))),
          child: widget),
    );
  }
}