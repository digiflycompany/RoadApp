import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/modules/fuel_consuming_rate/views/widgets/add_fuel_row.dart';

class AddFuelComponent extends StatelessWidget {
  final String? firstText;
  final String? secondText;
  final bool? required;
  const AddFuelComponent({super.key, required this.firstText, required this.secondText, this.required=true});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AddFuelColumn(firstText: firstText,required: required,),
        SizedBox(width: 30.w,),
        AddFuelColumn(firstText: secondText,required: required,),
        // SizedBox(height: 8.h,),
        // const AddVehiclesTextFieldsRow(),
        // SizedBox(height: 8.h,),
      ],
    );
  }
}
