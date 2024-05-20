import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/modules/vehicles/widgets/add_vehicles_row.dart';
import 'package:roadapp/modules/vehicles/widgets/add_vehicles_text_fields_row.dart';

class AddVehicleComponent extends StatelessWidget {
  final String? firstText;
  final String? secondText;
  final bool? required;
  const AddVehicleComponent({super.key, required this.firstText, required this.secondText, this.required=true});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AddVehiclesRow(firstText: firstText, secondText: secondText,required: required,),
        SizedBox(height: 8.h,),
        const AddVehiclesTextFieldsRow(),
        SizedBox(height: 8.h,),
      ],
    );
  }
}
