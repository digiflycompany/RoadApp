import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/string_manager.dart';

class ProductBill extends StatelessWidget {
  const ProductBill({super.key});

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
                        label: Text(StringManager.t.tr(context),
                            style: TextStyle(fontSize: 8.sp))),
                    DataColumn(
                        label: Text(StringManager.itemCode.tr(context),
                            style: TextStyle(fontSize: 8.sp))),
                    DataColumn(
                        label: Text(StringManager.itemName.tr(context),
                            style: TextStyle(fontSize: 8.sp))),
                    DataColumn(
                        label: Text(StringManager.unit.tr(context),
                            style: TextStyle(fontSize: 8.sp))),
                    DataColumn(
                        label: Text(StringManager.quantity,
                            style: TextStyle(fontSize: 8.sp))),
                    DataColumn(
                        label: Text(StringManager.price.tr(context),
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
                          DataCell(Text('أحمد نبيل',
                              style: TextStyle(fontSize: 11.sp))),
                          DataCell(
                              Text('100', style: TextStyle(fontSize: 12.sp))),
                          DataCell(
                              Text('100', style: TextStyle(fontSize: 12.sp))),
                          DataCell(
                              Text('100', style: TextStyle(fontSize: 12.sp))),
                          DataCell(
                              Text('100', style: TextStyle(fontSize: 12.sp))),
                          DataCell(
                              Text('100', style: TextStyle(fontSize: 12.sp)))
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