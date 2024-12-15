import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Theming/styles.dart';
import 'package:roadapp/features/business_models/presentation/manager/business_models_cubit.dart';
import 'package:roadapp/features/business_models/presentation/manager/business_models_state.dart';

class ExaminationTextField extends StatelessWidget {
  const ExaminationTextField({super.key, required this.label, this.controller, this.keyboardType});

  final String label;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BusinessModelsCubit, BusinessModelsState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: Styles.textStyle12,
            ),
            SizedBox(height: 8.h),
            SizedBox(
              width: double.infinity,
              //height: 100.h,
              child: TextFormField(
                keyboardType: keyboardType ?? TextInputType.text,
                controller: controller,
                validator: (value) {
                  if (value == null ||
                      value.isEmpty) {
                    return 'please enter valid Data';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 2.h,
                    horizontal: 10.w,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
