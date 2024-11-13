import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/Theming/styles.dart';
import 'package:roadapp/core/helpers/string_manager.dart';

class AddVehicleTextField extends StatelessWidget {
  const AddVehicleTextField(
      {super.key, this.width, required this.controller, this.keyboardType, this.maxLength});
  final double? width;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width ?? 90,
        height: 33,
        child: TextFormField(
            keyboardType: keyboardType ??
                const TextInputType.numberWithOptions(
                    decimal: true, signed: true),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return StringManager.thisFieldIsRequired.tr(context);
              }
              return null;
            },
            style: Styles.textStyle12,
            maxLines: 1,
            maxLength: maxLength,
            controller: controller,
            cursorColor: AppColors.primaryColor,
            cursorHeight: 20.h,
            decoration: InputDecoration(
                errorStyle: Styles.textStyle12
                    .copyWith(color: AppColors.red, fontSize: 8),
                counterText: '',
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(7.r)),
                filled: true,
                fillColor: Colors.grey[100],
                contentPadding:
                EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w))));
  }
}