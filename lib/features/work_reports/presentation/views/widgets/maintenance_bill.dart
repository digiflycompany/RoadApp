import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';

class MaintenanceBill extends StatelessWidget {
  const MaintenanceBill({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.r)),
          child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.r),
                  topRight: Radius.circular(15.r)),
              child: DataTable(
                  columnSpacing: 13.w,
                  headingRowHeight: 40.h,
                  dataRowMinHeight: 40.h,
                  headingRowColor:
                      WidgetStateColor.resolveWith((states) => Colors.black),
                  headingTextStyle: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  columns: [
                    DataColumn(
                        label: Text(StringManager.s.tr(context),
                            style: TextStyle(fontSize: 8.sp))),
                    DataColumn(
                        label: Text(StringManager.bondNumber.tr(context),
                            style: TextStyle(fontSize: 8.sp))),
                    DataColumn(
                        label: Text(StringManager.bondDate.tr(context),
                            style: TextStyle(fontSize: 8.sp))),
                    DataColumn(
                        label: Text(StringManager.value.tr(context),
                            style: TextStyle(fontSize: 8.sp)))
                  ],
                  rows: [
                    DataRow(
                        cells: [
                          DataCell(
                              Text('1', style: TextStyle(fontSize: 12.sp))),
                          DataCell(
                              Text('5467', style: TextStyle(fontSize: 11.sp))),
                          DataCell(Text('24-2-2014',
                              style: TextStyle(fontSize: 12.sp))),
                          DataCell(
                              Text('3223', style: TextStyle(fontSize: 12.sp)))
                        ],
                        color: WidgetStateProperty.resolveWith<Color?>(
                            (Set<WidgetState> states) {
                          return Colors.amber[100]; // Use the color you need
                        }))
                  ]))),
      Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.amber[100],
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.r),
                  bottomRight: Radius.circular(15.r))),
          padding: const EdgeInsets.all(8.0),
          child: Text(StringManager.total.tr(context),
              textAlign: TextAlign.right,
              style: const TextStyle(fontWeight: FontWeight.bold)))
    ]);
  }
}