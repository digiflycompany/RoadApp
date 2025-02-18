import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/functions/general_functions.dart';
import 'input_decoration.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Icon? prefixIcon;
  final double? height;
  final Widget? suffixIcon;
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
  final TextStyle? errorStyle;

  const CustomTextField({
    Key? key,
    required this.hintText,
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
    this.suffixIcon, this.errorStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 48.h,
      width: width ?? double.infinity,
      child: TextFormField(
        controller: controller,
        obscureText: isPassword ?? false,
        maxLines: maxLines,
        decoration: customInputDecoration(
          errorStyle: errorStyle,
          fontSize: fontSize,
          fontWeight: fontWeight,
          hintText: hintText,
          contentHorizontalPadding: contentHorizontalPadding,
          contentVerticalPadding: contentVerticalPadding,
          borderRadius: borderRadius,
          borderColor: borderColor,
          prefixIconColor: prefixIconColor,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          enabled: enabled,
          hintColor: hintColor,
          fillColor: fillColor,
        ),

        validator: validationFunc,
        onSaved: (val) {
          controller.text = val!;
        },
        onTap: () => GeneralFunctions.unFocusCursorRTL(controller),
        cursorWidth: 1,
        onTapOutside: (_) => GeneralFunctions.hideKeyboard(),
        textInputAction: textInputAction ?? TextInputAction.next,
        keyboardType: textInputType,
      ),
    );
  }
}
