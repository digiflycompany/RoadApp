import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/shared/resources/colors.dart';

class AccountDetailsButton extends StatelessWidget {
  const AccountDetailsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 230.w,
        height: 60.h,
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(10.r)
        ),
        child: const Center(
          child: Text(
              'حفظ'
          ),
        ),
      ),
    );
  }
}
