import 'package:flutter/material.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_data_table.dart';

class ServiceAppointmentManagement extends StatelessWidget {
  const ServiceAppointmentManagement({super.key, required this.cells1});

  final List<List<String>> cells1;

  @override
  Widget build(BuildContext context) {
    final columns1 = [
      StringManager.centerName.tr(context),
      StringManager.procedureType.tr(context),
      StringManager.date.tr(context),
      StringManager.time.tr(context)
    ];

    return CustomMultiRowsTable(
        columns: columns1,
        rows: cells1,
        withEditIcon: true,
        withDeleteIcon: true);
  }
}