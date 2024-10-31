import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/features/vehicles/presentation/cubit/vehicles_cubit.dart';
import 'package:roadapp/features/vehicles/presentation/cubit/vehicles_state.dart';
import 'package:roadapp/features/vehicles/presentation/views/widgets/add_vehicle_text_field.dart';

class SingleAddVehicleTextField extends StatelessWidget {
  const SingleAddVehicleTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: 8.h),
      Text(StringManager.tankCapacity.tr(context),
          style: TextStyle(
              color: Colors.black,
              fontSize: 11.sp,
              fontWeight: FontWeight.w600)),
      SizedBox(
          height: 8.h
      ),
      BlocBuilder<VehiclesCubit, VehiclesState>(
        builder: (context, state) {
          return AddVehicleTextField(controller: VehiclesCubit.get(context).tankCapacityController);
        }
      ),
      SizedBox(height: 20.h)
    ]);
  }
}