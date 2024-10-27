import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/helpers/functions/general_functions.dart';

Widget defaultFormField(
        {required TextEditingController textController,
        required TextInputType type,
        Function? onSubmit,
        Function? onChanged,
        Function? onTap,
        required Function validate,
        required String labelText,
        String? hint,
        IconData? prefix,
        Widget? suffix,
        Widget? suffixIcon,
        bool isPassword = false,
        Function? suffixPressed,
        TextInputAction? inputAction,
        int? maxLength}) =>
    TextFormField(
        maxLength: maxLength,
        onTap: () => GeneralFunctions.unFocusCursorRTL(textController),
        onTapOutside: (v) => GeneralFunctions.hideKeyboard(),
        controller: textController,
        keyboardType: type,
        obscureText: isPassword,
        onFieldSubmitted: (value) {
          onSubmit!(value);
        },
        textInputAction: inputAction,
        validator: (value) => validate(value),
        cursorWidth: 1.w,
        decoration: InputDecoration(
            labelStyle: TextStyle(fontSize: 10.sp),
            hintText: hint,
            labelText: labelText,
            prefixIcon: prefix != null ? Icon(prefix) : null,
            suffix: suffix,
            suffixIcon: suffixIcon));

Widget showAllButton({
  Color? backgroundColor,
  Color? foregroundColor,
  Decoration? decoration,
  double? width,
  double? height,
}) =>
    Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      decoration: decoration,
      color: backgroundColor,
      child: const Row(
        children: [
          Text(
            "عرض الكل",
            style: TextStyle(color: AppColors.tertiary),
          ),
          Icon(
            Icons.keyboard_arrow_left,
            color: AppColors.tertiary,
          ),
        ],
      ),
    );

Widget divider() {
  return Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[200],
  );
}
