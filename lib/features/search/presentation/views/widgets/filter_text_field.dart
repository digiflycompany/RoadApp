import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterTextField extends StatelessWidget {
  const FilterTextField({super.key, required this.label, required this.hint});
  final String label, hint;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      Text(label, style: TextStyle(fontSize: 10.sp)),
      SizedBox(
          height: 31.285,
          child: TextFormField(
              style: TextStyle(fontSize: 13.sp),
              decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: TextStyle(
                      fontSize: 10.sp, color: const Color(0xffAAAAAA)),
                  filled: true,
                  fillColor: const Color(0xFFECECEC),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(6.r)))))
    ]);
  }
}