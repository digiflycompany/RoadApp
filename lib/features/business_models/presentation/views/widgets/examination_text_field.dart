import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Theming/styles.dart';

class ExaminationTextField extends StatelessWidget {
  const ExaminationTextField({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(label, style: Styles.textStyle12),
      SizedBox(height: 8.h),
      SizedBox(
          width: double.infinity,
          height: 34.h,
          child: TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(5.r)),
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 2.h, horizontal: 10.w))))
    ]);
  }
}