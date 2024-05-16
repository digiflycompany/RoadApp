import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp2/modules/maintenance_center_details/cubit/maintenance_center_details_states.dart';

class MaintenanceCenterDetailsCubit
    extends Cubit<MaintenanceCenterDetailsStates> {
  MaintenanceCenterDetailsCubit(this.context)
      : super(MaintenanceCenterDetailsInitStates());

  final BuildContext context;
  DateTime? dateTime = DateTime.now();

  TimeOfDay timeOfDay = TimeOfDay.now();

  void pickupDate() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2024),
        lastDate: DateTime(2025),
        builder: (_, child) {
          return Theme(
              data: Theme.of(context).copyWith(
                textTheme: TextTheme(bodyMedium: TextStyle(fontSize: 12.sp)),
              ),
              child: child!);
        }).then((value) {
      dateTime = value!;
      emit(MaintenanceCenterDetailsPickupDateStates());
    });
  }

  void pickupTime() {
    showTimePicker(
      context: context,
      initialTime: timeOfDay,
    ).then((value) {
      timeOfDay = value!;
      emit(MaintenanceCenterDetailsPickupDateStates());
    });
  }
}
