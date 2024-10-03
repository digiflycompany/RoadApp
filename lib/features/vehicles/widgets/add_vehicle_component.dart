import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/features/vehicles/widgets/add_vehicles_row.dart';
import 'package:roadapp/features/vehicles/widgets/add_vehicles_text_fields_row.dart';

class AddVehicleComponent extends StatelessWidget {
  final String? firstText;
  final String? secondText;
  final bool? required;
  final TextEditingController firstController;
  final TextEditingController secondController;
  const AddVehicleComponent(
      {super.key,
      required this.firstText,
      required this.secondText,
      this.required = true, required this.firstController, required this.secondController});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      AddVehiclesRow(
          firstText: firstText, secondText: secondText, required: required),
      SizedBox(height: 8.h),
      AddVehiclesTextFieldsRow(firstController: firstController, secondController: secondController),
      SizedBox(height: 8.h)
    ]);
  }
}