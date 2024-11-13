import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Theming/colors.dart';

class SearchSectionButton extends StatelessWidget {
  const SearchSectionButton(
      {super.key, required this.text, this.voidCallback, this.context});

  final String text;
  final VoidCallback? voidCallback;
  final BuildContext? context;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.r),
          ),
        ),
        onPressed: voidCallback,
        child: Text(
          text,
          style: TextStyle(
            color: AppColors.secondColor,
            fontSize: 10.sp,
          ),
        ),
      ),
    );
  }
}
