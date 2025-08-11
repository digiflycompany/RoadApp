import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:roadapp/core/Theming/colors.dart';

void showToast({required String message, required ToastStates state, ToastGravity? gravity}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT, // أقصر مدة
    gravity: gravity ?? ToastGravity.CENTER,
    timeInSecForIosWeb: 1, // ثانية واحدة
    backgroundColor: getState(state),
    textColor: Colors.white,
    fontSize: 16.0.w,
  );
}

enum ToastStates { error, success, warning }

Color getState(ToastStates state) {
  switch (state) {
    case ToastStates.error:
      return AppColors.red;
    case ToastStates.success:
      return AppColors.primaryColor;
    case ToastStates.warning:
      return AppColors.blue;
  }
}