import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/features/vehicles/presentation/cubit/vehicles_cubit.dart';
import 'package:roadapp/features/vehicles/presentation/cubit/vehicles_state.dart';
import 'package:roadapp/features/vehicles/presentation/views/widgets/add_vehicle_text_field.dart';

class SingleAddVehicleTextField extends StatelessWidget {
  const SingleAddVehicleTextField({super.key, required this.title, required this.controller, this.keyboardType, this.validator, required this.hintText});
  final String title;
  final String hintText;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      SizedBox(height: 8.h),
      Text(title,
          style: TextStyle(
              color: Colors.black,
              fontSize: 11.sp,
              fontWeight: FontWeight.w600)),
      SizedBox(
          height: 8.h
      ),
      BlocBuilder<VehiclesCubit, VehiclesState>(
        builder: (context, state) {
          return AddVehicleTextField(
            width: double.infinity,
            hintText: hintText,
            controller: controller, keyboardType: keyboardType,validator: validator,);
        }
      ),
      SizedBox(height: 20.h)
    ]);
  }
}