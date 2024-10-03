import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionRow extends StatelessWidget {
  const SectionRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
              backgroundColor: Colors.red,
              radius: 10.w,
              child: Center(
                  child: Icon(Icons.check, color: Colors.white, size: 13.w))),
          SizedBox(
            width: 8.w,
          ),
          CircleAvatar(backgroundColor: Colors.yellowAccent, radius: 10.w),
          SizedBox(width: 8.w),
          CircleAvatar(backgroundColor: Colors.greenAccent, radius: 10.w),
          SizedBox(width: 8.w)
        ]);
  }
}