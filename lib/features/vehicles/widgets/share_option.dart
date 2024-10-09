import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShareOption extends StatelessWidget {
  const ShareOption({super.key, required this.icon, required this.label});
  final String icon, label;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      SvgPicture.asset(icon),
      SizedBox(width: 5.w),
      Text(label,
          style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600))
    ]);
  }
}