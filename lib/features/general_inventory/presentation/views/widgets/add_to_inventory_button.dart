import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';

class AddToInventoryButton extends StatelessWidget {
  const AddToInventoryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, // Background color
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r)),
                padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 7.h)),
            onPressed: () {},
            child: Text(StringManager.add.tr(context),
                style: TextStyle(
                    color: Colors.white, // Text color
                    fontSize: 13.sp))));
  }
}