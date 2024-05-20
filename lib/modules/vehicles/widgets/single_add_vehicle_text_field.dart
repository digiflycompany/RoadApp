import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/modules/vehicles/widgets/add_vehicle_text_field.dart';

class SingleAddVehicleTextField extends StatelessWidget {
  const SingleAddVehicleTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 8.h,),
        Text(
          'سعة التانك',
          style: TextStyle(
              color: Colors.black,
              fontSize: 11.sp,
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
