import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/features/vehicles/widgets/add_vehicle_text_field.dart';

class AddVehiclesTextFieldsRow extends StatelessWidget {
  const AddVehiclesTextFieldsRow(
      {super.key,
      required this.firstController,
      required this.secondController,
      this.firstKeyboardType,
      this.secondKeyboardType});
  final TextEditingController firstController;
  final TextEditingController secondController;
  final TextInputType? firstKeyboardType, secondKeyboardType;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      AddVehicleTextField(
          controller: firstController, keyboardType: firstKeyboardType),
      SizedBox(width: 22.w),
      AddVehicleTextField(
          controller: secondController, keyboardType: secondKeyboardType)
    ]);
  }
}