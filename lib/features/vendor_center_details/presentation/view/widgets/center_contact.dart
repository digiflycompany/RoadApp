import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CenterContact extends StatelessWidget {
  const CenterContact({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Row(children: [
          const Icon(Icons.phone_enabled, size: 18),
          const SizedBox(width: 3),
          Text("0123456789",
              style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold))
        ]));
  }
}