import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/features/vehicles/presentation/widgets/add_vehicle_text_field.dart';

class SingleAddVehicleTextField extends StatelessWidget {
  const SingleAddVehicleTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: 8.h),
      Text(StringManager.tankCapacity.tr(context),
          style: TextStyle(
              color: Colors.black,
              fontSize: 11.sp,
              fontWeight: FontWeight.w600)),
      SizedBox(
        height: 8.h,
      ),
      AddVehicleTextField(controller: TextEditingController()),
      SizedBox(height: 20.h)
    ]);
  }
}