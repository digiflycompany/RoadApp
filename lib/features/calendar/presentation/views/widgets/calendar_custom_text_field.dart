import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/Theming/styles.dart';
import 'package:roadapp/core/functions/general_functions.dart';
import 'package:roadapp/core/widgets/calendar_custom_decoration.dart';

class CalendarCustomTextField extends StatefulWidget {
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
  _CalendarCustomTextFieldState createState() =>
      _CalendarCustomTextFieldState();
}

class _CalendarCustomTextFieldState extends State<CalendarCustomTextField> {
  bool _hasError = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: widget.height ?? (_hasError ? 52.h : 22.h),
        child: TextFormField(
            style: Styles.textStyle12.copyWith(fontSize: 8),
            controller: widget.controller,
            obscureText: widget.isPassword ?? false,
            maxLines: widget.maxLines,
            decoration: calendarCustomInputDecoration(
                fontSize: widget.fontSize,
                fontWeight: widget.fontWeight,
                hintText: widget.hintText,
                contentHorizontalPadding: widget.contentHorizontalPadding,
                contentVerticalPadding: widget.contentVerticalPadding,
                borderRadius: widget.borderRadius,
                borderColor: widget.borderColor ?? AppColors.greyColor3,
                prefixIconColor: widget.prefixIconColor,
                prefixIcon: widget.prefixIcon,
                suffixIcon: widget.suffixIcon,
                enabled: widget.enabled,
                hintColor: widget.hintColor,
                fillColor: widget.fillColor ?? AppColors.greyColor3),
            validator: (value) {
              final validationResult = widget.validationFunc?.call(value);
              setState(() {
                _hasError = validationResult != null;
              });
              return validationResult;
            },
            onSaved: (val) {
              widget.controller.text = val!;
            },
            onTap: () => GeneralFunctions.unFocusCursorRTL(widget.controller),
            cursorWidth: 1,
            onTapOutside: (_) => GeneralFunctions.hideKeyboard(),
            textInputAction: widget.textInputAction ?? TextInputAction.next,
            keyboardType: widget.textInputType));
  }
}