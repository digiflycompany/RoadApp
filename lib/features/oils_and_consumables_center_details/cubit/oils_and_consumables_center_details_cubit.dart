import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/features/oils_and_consumables_center_details/cubit/oils_and_consumables_center_details_states.dart';

class OilsAndConsumablesCenterDetailsCubit
    extends Cubit<OilsAndConsumablesCenterDetailsStates> {
  OilsAndConsumablesCenterDetailsCubit(this.context)
      : super(OilsAndConsumablesCenterDetailsInitStates());

  final BuildContext context;
  DateTime dateTime = DateTime.now();

  TimeOfDay timeOfDay = TimeOfDay.now();

  void pickupDate() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2024),
        lastDate: DateTime(2050),
        builder: (_, child) {
          return Theme(
              data: Theme.of(context).copyWith(
                textTheme: TextTheme(bodyMedium: TextStyle(fontSize: 12.sp)),
              ),
              child: child!);
        }).then((value) {
      if (value != null) {
        dateTime = value;
      }
      emit(OilsAndConsumablesCenterDetailsPickupDateStates());
    });
  }

  void pickupTime() {
    showTimePicker(
      context: context,
      initialTime: timeOfDay,
    ).then((value) {
      if (value != null) {
        timeOfDay = value;
      }
      emit(OilsAndConsumablesCenterDetailsPickupDateStates());
    });
  }
}