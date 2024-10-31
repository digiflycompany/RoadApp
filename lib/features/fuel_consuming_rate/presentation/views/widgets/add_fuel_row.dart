import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/features/vehicles/presentation/views/widgets/add_vehicle_text_field.dart';

class AddFuelColumn extends StatelessWidget {
  final String? firstText;
  final bool? required;
  final TextEditingController controller;
  const AddFuelColumn(
      {super.key,
      required this.firstText,
      this.required = true,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        width: 90,
        child: Text(firstText!,
            style: TextStyle(
                color: Colors.black,
                fontSize: 9.sp,
                fontWeight: FontWeight.w600)),
      ),
      if (required == true) ...[
        Text(' *',
            style: TextStyle(
                color: Colors.red, fontSize: 9.sp, fontWeight: FontWeight.w600))
      ],
      SizedBox(height: 8.h),
      AddVehicleTextField(controller: controller)
    ]);
  }
}