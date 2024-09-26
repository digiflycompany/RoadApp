import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/features/vehicles/widgets/add_vehicle_text_field.dart';

class SingleAddFuelTextField extends StatelessWidget {
  const SingleAddFuelTextField({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(height: 8.h),
      Text(StringManager.fullTankPrice.tr(context),
          style: TextStyle(
              color: Colors.black,
              fontSize: 9.sp,
              fontWeight: FontWeight.w600)),
      SizedBox(height: 8.h),
      AddVehicleTextField(width: double.infinity, controller: controller),
      SizedBox(height: 20.h)
    ]);
  }
}
