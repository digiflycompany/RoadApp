import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactUsDetailsRow extends StatelessWidget {
  final String detail;
  final String value;
  const ContactUsDetailsRow({super.key, required this.detail, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 36.h),
      child: Row(
        children: [
          Text(detail,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 11.sp,
          ),
            ),
          SizedBox(width: 8.w,),
          Text(value,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 11.sp,
            ),
          ),
        ],
      ),
    );
  }
}
