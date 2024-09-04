import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountTextField extends StatelessWidget {
  final String text;
  final double width;
  final Color? textColor;
  final double verticalPadding;
  final double horizontalContentPadding;
  final TextInputType inputType;
  const AccountTextField({
    super.key,
    required this.text,
    this.width=double.infinity,
    this.verticalPadding=10,
    this.horizontalContentPadding=20,
    this.textColor=Colors.black,
    this.inputType=TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:  EdgeInsetsDirectional.only(start: 4.w),
          child: Text(text,style: TextStyle(
            color:textColor,
            fontSize: 15.sp,
            fontWeight: FontWeight.w500
          ),),
        ),
        SizedBox(height: 12.h,),
        SizedBox(
          width: width,
          child: TextFormField(
            keyboardType: inputType,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              filled: true,
              fillColor: Colors.grey[200],
              contentPadding:  EdgeInsets.symmetric(vertical: verticalPadding.h, horizontal: horizontalContentPadding.w),
            ),
          ),
        ),
        SizedBox(height: 26.h,),
      ],
    );
  }
}
