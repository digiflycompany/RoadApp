import 'package:flutter/material.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/Theming/styles.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarDialogContent extends StatefulWidget {
  const CalendarDialogContent({super.key});

  @override
  CalendarDialogContentState createState() => CalendarDialogContentState();
}

class CalendarDialogContentState extends State<CalendarDialogContent> {
  DateTime _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    String currentLang = Localizations.localeOf(context).languageCode;
    return SizedBox(
        height: 400,
        width: 300,
        child: SingleChildScrollView(
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: TableCalendar(
                  locale: currentLang,
                  focusedDay: _selectedDay,
                  firstDay: DateTime(2020),
                  lastDay: DateTime(2030),
                  calendarFormat: CalendarFormat.month,
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                    });
                  },
                  calendarStyle: const CalendarStyle(
                      cellMargin: EdgeInsets.zero,
                      cellPadding: EdgeInsets.zero,
                      todayDecoration: BoxDecoration(
                          color: Colors.orange, shape: BoxShape.circle),
                      selectedDecoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          shape: BoxShape.circle)),
                  headerStyle: HeaderStyle(
                      titleCentered: true,
                      formatButtonVisible: false,
                      titleTextStyle: Styles.textStyle12,
                      formatButtonPadding: EdgeInsets.zero,
                      headerMargin: EdgeInsets.zero,
                      rightChevronMargin: const EdgeInsets.only(left: 50),
                      leftChevronMargin: const EdgeInsets.only(right: 50)),
                  daysOfWeekStyle: DaysOfWeekStyle(
                      weekendStyle: Styles.textStyle12.copyWith(fontSize: 10),
                      weekdayStyle:
                          Styles.textStyle12.copyWith(fontSize: 10)))),
          const SizedBox(height: 10),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(StringManager.ok.tr(context))),
          const SizedBox(height: 10)
        ])));
  }
}