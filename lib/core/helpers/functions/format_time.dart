import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String extractTimeFromDateString(String dateTimeStr, BuildContext context) {
  DateTime dateTime = DateTime.parse(dateTimeStr);

  int hour = dateTime.hour;
  int minute = dateTime.minute;

  DateTime timeOnly = DateTime(0, 0, 0, hour, minute); // Setting date to '0'

  String formattedTime = DateFormat.jm().format(timeOnly); // AM/PM format

  if (Localizations.localeOf(context).languageCode == 'ar') {
    formattedTime = formattedTime.replaceAll('AM', 'ص').replaceAll('PM', 'م');
  }

  return formattedTime;
}