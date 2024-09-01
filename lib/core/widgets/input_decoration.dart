import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Theming/colors.dart';

InputDecoration customInputDecoration({
  required String hintText,
  IconButton? suffixIcon,
  double? borderRadius,
  Icon? prefixIcon,
  Color? hintColor,
  Color? borderColor,
  double? contentVerticalPadding,
  double? contentHorizontalPadding,
  FontWeight? fontWeight,
  double? fontSize,
  Color? fillColor,
  Color? prefixIconColor,
  bool? enabled,
}) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: TextStyle(
      color: hintColor ?? AppColors.greyColor,
      fontSize: fontSize ?? 12.sp,
      fontWeight: fontWeight ?? FontWeight.w400,
    ),
    enabled: enabled ?? true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
      borderSide: BorderSide(color: borderColor ?? AppColors.greyColor),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
      borderSide: BorderSide(color: borderColor ?? AppColors.greyColor),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
      borderSide: BorderSide(color: borderColor ?? AppColors.greyColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
      borderSide: BorderSide(color: borderColor ?? AppColors.greyColor),
    ),
    focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 8.r)),
    fillColor: fillColor ?? AppColors.whiteColor,
    filled: true,
    contentPadding: EdgeInsets.symmetric(
        vertical: contentVerticalPadding ?? 5.h,
        horizontal: contentHorizontalPadding ?? 8.w),
    suffixIcon: suffixIcon != null
        ? Padding(
            padding: EdgeInsets.only(left: 12.w, right: 12.w),
            child: (suffixIcon),
          )
        : null,
    prefixIcon: prefixIcon != null
        ? Padding(
            padding: EdgeInsets.only(left: 12.w, right: 12.w),
            child: prefixIcon,
          )
        : null,
  );
}