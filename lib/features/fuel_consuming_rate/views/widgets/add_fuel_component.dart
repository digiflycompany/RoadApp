import 'package:flutter/material.dart';
import 'package:roadapp/features/fuel_consuming_rate/views/widgets/add_fuel_row.dart';

class AddFuelComponent extends StatelessWidget {
  final String? firstText;
  final String? secondText;
  final bool? required;
  final TextEditingController controller1, controller2;
  const AddFuelComponent(
      {super.key,
      required this.firstText,
      required this.secondText,
      this.required = true, required this.controller1, required this.controller2});

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
      AddFuelColumn(firstText: firstText, required: required, controller: controller1),
      const Spacer(),
      AddFuelColumn(firstText: secondText, required: required, controller: controller2)
    ]);
  }
}