import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/features/vehicles/presentation/views/widgets/add_vehicle_text_field.dart';

class AddVehiclesTextFieldsRow extends StatelessWidget {
  const AddVehiclesTextFieldsRow(
      {super.key,
      required this.firstController,
      required this.secondController,
      this.firstKeyboardType,
      this.secondKeyboardType, this.hintText});
  final TextEditingController firstController;
  final TextEditingController secondController;
  final TextInputType? firstKeyboardType, secondKeyboardType;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
      AddVehicleTextField(
          controller: firstController, keyboardType: firstKeyboardType,),
      const Spacer(),
      // SizedBox(width: 22.w),
      AddVehicleTextField(
        hintText: hintText,
          controller: secondController,  keyboardType: secondKeyboardType)
    ]);
  }
}