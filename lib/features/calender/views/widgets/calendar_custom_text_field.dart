import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/Theming/styles.dart';
import 'package:roadapp/core/functions/general_functions.dart';
import 'package:roadapp/core/widgets/calendar_custom_decoration.dart';

class CalendarCustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Widget? prefixIcon;
  final double? height;
  final IconButton? suffixIcon;
  final bool? enabled;
  final int? maxLines;
  final bool? isPassword;
  final double? borderRadius;
  final double? width;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String? validationMessage;
  final Color? hintColor;
  final Color? prefixIconColor;
  final double? contentHorizontalPadding;
  final double? contentVerticalPadding;
  final Color? fillColor;
  final Color? borderColor;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final String? Function(String?)? validationFunc;

  const CalendarCustomTextField({
    Key? key,
    this.hintText = '',
    required this.controller,
    this.prefixIcon,
    this.prefixIconColor,
    this.fillColor,
    this.contentHorizontalPadding,
    this.contentVerticalPadding,
    this.maxLines,
    this.validationMessage,
    this.isPassword,
    this.borderColor,
    this.fontWeight,
    this.width,
    this.fontSize,
    this.borderRadius,
    this.enabled,
    this.textInputType,
    this.textInputAction,
    this.validationFunc,
    this.hintColor,
    this.height,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height ?? 22.h,
        width: width ?? double.infinity,
        child: TextFormField(
            style: Styles.textStyle12.copyWith(fontSize: 8),
            controller: controller,
            obscureText: isPassword ?? false,
            maxLines: maxLines,
            decoration: calendarCustomInputDecoration(
                fontSize: fontSize,
                fontWeight: fontWeight,
                hintText: hintText,
                contentHorizontalPadding: contentHorizontalPadding,
                contentVerticalPadding: contentVerticalPadding,
                borderRadius: borderRadius,
                borderColor: borderColor ?? AppColors.greyColor3,
                prefixIconColor: prefixIconColor,
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
                enabled: enabled,
                hintColor: hintColor,
                fillColor: fillColor ?? AppColors.greyColor3),
            validator: validationFunc,
            onSaved: (val) {
              controller.text = val!;
            },
            onTap: () => GeneralFunctions.unFocusCursorRTL(controller),
            cursorWidth: 1,
            onTapOutside: (_) => GeneralFunctions.hideKeyboard(),
            textInputAction: textInputAction ?? TextInputAction.next,
            keyboardType: textInputType));
  }
}
