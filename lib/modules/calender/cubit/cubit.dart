import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/core/widgets/calendar_custom_alert_dialog.dart';
import 'package:roadapp/core/widgets/calendar_dialog.dart';
import 'package:roadapp/modules/calender/cubit/states.dart';

class CalenderCubit extends Cubit<CalenderState> {
  CalenderCubit() : super(CalenderInitState());


  CalenderCubit get(context) => BlocProvider.of(context);

  bool myCarNumber = false;

  bool importanceDegree = false;

  bool checkBoxDate = false;

  bool one = false;
  bool two = false;
  bool three = false;
  bool four = false;

  DateTime selectedDay = DateTime.now().add(const Duration(days: 1));

  DateTime? focusedDay = DateTime.now().add(const Duration(days: 1));

  String? selectedHour;

  void showCalendarDialog(BuildContext context) {
    calendarCustomAlertDialog(
      context: context,
      title: "تحديد اليوم",
      content: const CalendarDialogContent()
    );
  }
}




