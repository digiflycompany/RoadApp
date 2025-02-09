import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/Theming/colors.dart';
import '../../../../core/widgets/custom_text_field.dart';

class TextFieldContactUs extends StatelessWidget {
  const TextFieldContactUs({
    super.key,
    required this.title,
    required this.hint,
    required this.controller,
    this.height,
    this.maxLines, this.validationFunc, this.textInputType,
  });

  final String title;
  final String hint;
  final double? height;
  final int? maxLines;
  final TextEditingController controller;
  final String? Function(String?)? validationFunc;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
        ),
        SizedBox(
          height: 5.h,
        ),
        CustomTextField(
          textInputType: textInputType,
          hintText: hint,
          controller: controller,
          fillColor: AppColors.greyColor4,
          borderColor: AppColors.greyColor4,
          hintColor: AppColors.greyColor2,
          borderRadius: 0,
          height: height ?? 70,
          maxLines: maxLines,
          validationFunc: validationFunc,
          errorStyle: const TextStyle(height: 0,fontSize: 10),
        ),


      ],
    );
  }
}
