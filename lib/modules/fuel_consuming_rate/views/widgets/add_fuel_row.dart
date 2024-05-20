import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/modules/fuel_consuming_rate/views/widgets/add_fuel_text_field.dart';

class AddFuelColumn extends StatelessWidget {
  final String? firstText;
  final bool? required;
  const AddFuelColumn({super.key, required this.firstText, this.required=true});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          firstText!,
          style: TextStyle(
              color: Colors.black,
              fontSize: 9.sp,
              fontWeight: FontWeight.w600
          ),
        ),
        if(required==true)...[
          Text(
            ' *',
            style: TextStyle(
                color: Colors.red,
                fontSize: 9.sp,
                fontWeight: FontWeight.w600
            ),
          ),
        ],
        SizedBox(height: 8.h,),
        const AddFuelTextFieldsRow(),
        // SizedBox(width: 20.w,),
        // Text(
        //   secondText!,
        //   style: TextStyle(
        //       color: Colors.black,
        //       fontSize: 9.sp,
        //       fontWeight: FontWeight.w600
        //   ),
        // ),
        // if(required==true)...[
        //   Text(
        //     ' *',
        //     style: TextStyle(
        //         color: Colors.red,
        //         fontSize: 9.sp,
        //         fontWeight: FontWeight.w600
        //     ),
        //   ),
        //],
      ],
    );
  }
}
