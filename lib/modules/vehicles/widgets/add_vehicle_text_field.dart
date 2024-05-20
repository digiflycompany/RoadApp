import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/shared/resources/colors.dart';

class AddVehicleTextField extends StatelessWidget {
  const AddVehicleTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      height: 33.h,
      child: TextFormField(
        cursorColor: AppColors.primaryColor,
        cursorHeight: 20.h,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(7.r),
          ),
          filled: true,
          fillColor: Colors.grey[100],
          contentPadding:  EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
        ),
      ),
    );
  }
}
