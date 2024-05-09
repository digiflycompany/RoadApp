import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddVehiclesRow extends StatelessWidget {
  final String? firstText;
  final String? secondText;
  const AddVehiclesRow({super.key, required this.firstText, required this.secondText});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          firstText!,
          style: TextStyle(
              color: Colors.black,
              fontSize: 11.sp,
              fontWeight: FontWeight.w600
          ),
        ),
        Text(
          ' *',
          style: TextStyle(
              color: Colors.red,
              fontSize: 11.sp,
              fontWeight: FontWeight.w600
          ),
        ),
        SizedBox(width: 80.w,),
        Text(
          secondText!,
          style: TextStyle(
              color: Colors.black,
              fontSize: 11.sp,
              fontWeight: FontWeight.w600
          ),
        ),
        Text(
          ' *',
          style: TextStyle(
              color: Colors.red,
              fontSize: 11.sp,
              fontWeight: FontWeight.w600
          ),
        ),
      ],
    );
  }
}
