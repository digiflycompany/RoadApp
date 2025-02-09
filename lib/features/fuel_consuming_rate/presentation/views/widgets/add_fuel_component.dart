import 'package:flutter/material.dart';
import 'package:roadapp/features/fuel_consuming_rate/presentation/views/widgets/add_fuel_row.dart';

class AddFuelComponent extends StatelessWidget {
  final String? firstText;
  final String? secondText;
  final bool? required;
  final bool readOnlyOne ;
  final bool readOnlyTwo;
  final TextEditingController controller1, controller2;
  final void Function(String)? onChanged;
  const AddFuelComponent(
      {super.key,
      required this.firstText,
      required this.secondText,
      this.required = true,
      required this.controller1,
      required this.controller2, this.onChanged,this.readOnlyOne = false,this.readOnlyTwo = false});

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
      AddFuelColumn(
        readOnly: readOnlyOne,
          firstText: firstText, required: required, controller: controller1,onChanged: onChanged,),
      const Spacer(),
      AddFuelColumn(
        readOnly: readOnlyTwo,
          firstText: secondText, required: required, controller: controller2,onChanged: onChanged,)
    ]);
  }
}