import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDataTable extends StatelessWidget {
  const CustomDataTable(
      {super.key,
      required this.rows,
      required this.columns,
      this.radius,
      this.columnSpacing,
      this.headingRowHeight,
      this.dataRowMaxHeight,
      this.headingRowColor,
      this.headingTextStyle,
      this.footerStyle,
      required this.footer,
      this.dataRowMinHeight});
  final List<String> columns, rows;
  final double? radius,
      columnSpacing,
      headingRowHeight,
      dataRowMaxHeight,
      dataRowMinHeight;
  final Color? headingRowColor;
  final TextStyle? headingTextStyle, footerStyle;
  final String footer;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
          width: double.infinity,
          child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(radius ?? 15.r),
                  topRight: Radius.circular(radius ?? 15.r)),
              child: DataTable(
                  columnSpacing: columnSpacing ?? 13.w,
                  headingRowHeight: headingRowHeight ?? 40.h,
                  dataRowMinHeight: dataRowMinHeight ?? 0,
                  dataRowMaxHeight: dataRowMaxHeight ?? 40.h,
                  headingRowColor: WidgetStateColor.resolveWith(
                      (states) => headingRowColor ?? Colors.black),
                  headingTextStyle: headingTextStyle ??
                      const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                  columns: columns
                      .map((text) => DataColumn(
                          label: Text(text, style: TextStyle(fontSize: 8.sp), overflow: TextOverflow.ellipsis)))
                      .toList(),
                  rows: [
                    DataRow(
                        cells: rows
                            .map((text) => DataCell(
                                Text(text, style: TextStyle(fontSize: 12.sp), overflow: TextOverflow.ellipsis)))
                            .toList())
                  ]))),
      Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.amber[100],
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(radius ?? 15.r),
                  bottomRight: Radius.circular(radius ?? 15.r))),
          padding: const EdgeInsets.all(8.0),
          child: Text(footer,
              textAlign: TextAlign.right,
              style: footerStyle ??
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp)))
    ]);
  }
}
