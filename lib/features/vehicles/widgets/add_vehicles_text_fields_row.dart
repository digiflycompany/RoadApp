import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/features/vehicles/widgets/add_vehicle_text_field.dart';

class AddVehiclesTextFieldsRow extends StatelessWidget {
  const AddVehiclesTextFieldsRow({super.key, required this.firstController, required this.secondController});
  final TextEditingController firstController;
  final TextEditingController secondController;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      AddVehicleTextField(controller: firstController),
      SizedBox(width: 22.w),
      AddVehicleTextField(controller: secondController)
    ]);
  }
}