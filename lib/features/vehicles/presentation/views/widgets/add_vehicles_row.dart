import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddVehiclesRow extends StatelessWidget {
  final String? firstText;
  final String? secondText;
  final bool? required;
  const AddVehiclesRow(
      {super.key,
      required this.firstText,
      required this.secondText,
      this.required = true});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      SizedBox(
          width: 80.w,
          child: Row(children: [
            Expanded(
                child: Text(firstText ?? '',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1))/*,
            if (required == true) ...[
              Text(' *',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w600))
            ]*/
          ])),
      SizedBox(width: 35.w),
      SizedBox(
          width: 80.w,
          child: Text(secondText ?? '',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w600),
              overflow: TextOverflow.ellipsis,
              maxLines: 1))
    ]);
  }
}