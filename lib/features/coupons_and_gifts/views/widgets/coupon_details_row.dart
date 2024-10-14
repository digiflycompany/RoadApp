import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CouponDetailsColumn extends StatelessWidget {
  final String firstText;
  final String secondText;
  const CouponDetailsColumn(
      {super.key, required this.firstText, required this.secondText});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(firstText,
          style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w600)),
      SizedBox(height: 45.h),
      Text(secondText,
          style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w600))
    ]);
  }
}