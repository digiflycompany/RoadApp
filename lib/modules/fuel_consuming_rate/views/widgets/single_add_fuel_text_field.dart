import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp2/modules/vehicles/widgets/add_vehicle_text_field.dart';

class SingleAddFuelTextField extends StatelessWidget {
  const SingleAddFuelTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8.h,),
        Text(
          'سعر التفويله',
          style: TextStyle(
              color: Colors.black,
              fontSize: 9.sp,
              fontWeight: FontWeight.w600
          ),
        ),
        SizedBox(height: 8.h,),
        const AddVehicleTextField(),
        SizedBox(height: 20.h,),
      ],
    );
  }
}
