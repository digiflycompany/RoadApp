import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/features/vehicles/widgets/add_vehicle_text_field.dart';

class AddVehiclesTextFieldsRow extends StatelessWidget {
  const AddVehiclesTextFieldsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const AddVehicleTextField(),
        SizedBox(width: 22.w,),
        const AddVehicleTextField(),
      ],
    );
  }
}