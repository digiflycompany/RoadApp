import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showCustomAlertDialog(
    {required BuildContext context,
    required String title,
    required Widget content,
    bool? scrollable}) {
  showDialog(
    context: context,
    builder: (ctx) {
      return AlertDialog(
        scrollable: scrollable ?? false,
        titlePadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(17.r),
        ),
        elevation: 0,
        title: Container(
          height: 50.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(17.r),
              topRight: Radius.circular(17.r),
            ),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 11.sp,
              ),
            ),
          ),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
        content: SizedBox(
          width: 300.w, // Set a fixed width
          child: content,
        ),
      );
    },
  );
}
