import 'package:intl/intl.dart';

String formatDate(DateTime dateTime) {
  // Create a DateFormat instance with the desired format
  final DateFormat formatter = DateFormat('dd/MM/yyyy');

  // Format the DateTime object into a string
  return formatter.format(dateTime);
}