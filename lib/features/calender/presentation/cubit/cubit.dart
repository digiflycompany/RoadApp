import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/core/widgets/calendar_custom_alert_dialog.dart';
import 'package:roadapp/core/widgets/calendar_dialog.dart';
import 'package:roadapp/features/calender/presentation/cubit/states.dart';

class CalendarCubit extends Cubit<CalendarState> {
  CalendarCubit() : super(CalenderInitState());

  static CalendarCubit get(context) => BlocProvider.of(context);

  bool myCarNumber = false;
  bool importanceDegree = false;
  bool checkBoxDate = false;

  DateTime selectedDay = DateTime.now().add(const Duration(days: 1));
  DateTime? focusedDay = DateTime.now().add(const Duration(days: 1));
  String? selectedHour;

  void showCalendarDialog(BuildContext context) {
    calendarCustomAlertDialog(
        context: context,
        title: StringManager.daySelection.tr(context),
        content: const CalendarDialogContent());
  }

  void changeCheckBox(bool value, String box) {
    switch (box) {
      case 'date':
        checkBoxDate = value;
        break;
      case 'degree':
        importanceDegree = value;
        break;
      case 'carNumber':
        myCarNumber = value;
        break;
    }
    emit(BoxUpdatedState());
  }
}