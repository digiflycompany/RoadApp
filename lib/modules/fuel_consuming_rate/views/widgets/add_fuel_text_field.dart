import 'package:flutter/material.dart';
import 'package:roadapp/modules/vehicles/widgets/add_vehicle_text_field.dart';

class AddFuelTextFieldsRow extends StatelessWidget {
  const AddFuelTextFieldsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        AddVehicleTextField(),
      ],
    );
  }
}
