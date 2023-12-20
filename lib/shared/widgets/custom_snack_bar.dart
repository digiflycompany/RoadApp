import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomSnackBars {
  //font
  static final double fontSize = 14.sp;
  static const FontWeight fontWeight = FontWeight.w400;

  // colors
  static const Color errorColor = Colors.red;
  static const Color successColor = Colors.green;
  static const Color infoColor = Colors.blue;

  //functions

  static void showErrorSnackBar({
    required BuildContext context,
    required String title,
    Color? textColor,
  }) {
    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(
          title.tr(),
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: textColor ?? Colors.black,
          ),
        ),
        backgroundColor: errorColor,
      ),
    );
  }

  static void showSuccessToast({required String title}) {
    Fluttertoast.showToast(
        msg: title.tr(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static void showErrorToast({required String title}) {
    Fluttertoast.showToast(
        msg: title.tr(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static void showSuccessSnackBar({
    required BuildContext context,
    required String title,
    Color? textColor,
  }) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          title.tr(),
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: textColor ?? Colors.white,
          ),
        ),
        backgroundColor: successColor,
      ),
    );
  }

  static void showInfoSnackBar({
    required BuildContext context,
    required String title,
    Color? textColor,
  }) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          title.tr(),
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: textColor ?? Colors.white,
          ),
        ),
        backgroundColor: infoColor,
      ),
    );
  }
}
