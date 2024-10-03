import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Theming/colors.dart';

class SectionPoint extends StatelessWidget {
  const SectionPoint({super.key, required this.point});
  final String point;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      CircleAvatar(backgroundColor: AppColors.black, radius: 4.w),
      SizedBox(width: 6.w),
      Text(point, style: TextStyle(fontSize: 13.sp), maxLines: 2)
    ]);
  }
}