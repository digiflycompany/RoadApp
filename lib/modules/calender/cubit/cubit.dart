import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp2/modules/calender/cubit/states.dart';
import 'package:roadapp2/shared/widgets/calendar_dialog.dart';

class CalenderCubit extends Cubit<CalenderState> {
  CalenderCubit() : super(CalenderInitState());


  CalenderCubit get(context) => BlocProvider.of(context);

  bool myCarNumber = false;

  bool importanceDegree = false;

  bool checkBoxDate = false;

  DateTime selectedDay = DateTime.now().add(const Duration(days: 1));

  DateTime? focusedDay = DateTime.now().add(const Duration(days: 1));

  String? selectedHour;

  void showCalendarDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(0),
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.6,
            child: const CalendarDialogContent(),
          ),
        );
      },
    );
  }
}




