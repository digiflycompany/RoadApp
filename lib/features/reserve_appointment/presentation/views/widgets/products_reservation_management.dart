import 'package:flutter/material.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_data_table.dart';

class ProductsReservationManagement extends StatelessWidget {
  const ProductsReservationManagement({super.key, required this.cells2});

  final List<List<String>> cells2;

  @override
  Widget build(BuildContext context) {
    final columns2 = [
      StringManager.centerName.tr(context),
      StringManager.procedureType.tr(context),
      StringManager.date.tr(context),
      StringManager.time.tr(context)
    ];
    return CustomMultiRowsTable(
        columns: columns2,
        rows: cells2,
        withDeleteIcon: false,
    );
  }
}