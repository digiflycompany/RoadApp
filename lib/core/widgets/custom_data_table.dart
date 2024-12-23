import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/helpers/app_assets.dart';
import 'package:roadapp/features/general_inventory/data/models/get_general_stock_response.dart';

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
      this.footer,
      this.dataRowMinHeight});

  final List<String> columns;
  final DataRow rows;
  final double? radius,
      columnSpacing,
      headingRowHeight,
      dataRowMaxHeight,
      dataRowMinHeight;
  final Color? headingRowColor;
  final TextStyle? headingTextStyle, footerStyle;
  final String? footer;

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
                          label: Text(text,
                              style: TextStyle(fontSize: 8.sp),
                              overflow: TextOverflow.ellipsis)))
                      .toList(),
                  rows: [
                    rows
                  ]))),
      if (footer != null)
        Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.amber[100],
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(radius ?? 15.r),
                    bottomRight: Radius.circular(radius ?? 15.r))),
            padding: const EdgeInsets.all(8.0),
            child: Text(footer!,
                textAlign: TextAlign.right,
                style: footerStyle ??
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp)))
    ]);
  }
}

class CustomMultiRowsTable extends StatelessWidget {
  const CustomMultiRowsTable({
    super.key,
    required this.columns,
    required this.rows,
    this.icon,
    this.onIconPressed,
    this.withEditIcon,
    this.withDeleteIcon,
  });

  final List<String> columns;
  final List<List<String>> rows;
  final IconData? icon;
  final void Function(int index)? onIconPressed;
  final bool? withEditIcon, withDeleteIcon;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return width > 500
        ? Padding(
            padding: EdgeInsets.only(top: 10.h, bottom: 30.h),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: SizedBox(
                    width: double.infinity,
                    child: DataTable(
                        headingRowColor: WidgetStateProperty.all(Colors.black),
                        columnSpacing: 18.w,
                        columns: [
                          ...columns.map((column) => DataColumn(
                                label: Text(column,
                                    style: const TextStyle(
                                        color: AppColors.tertiary)),
                              )),
                          if (icon != null) const DataColumn(label: Text('')),
                          if (withEditIcon == true)
                            const DataColumn(label: Text('')),
                          if (withDeleteIcon == true)
                            const DataColumn(label: Text(''))
                        ],
                        rows: rows.asMap().entries.map((entry) {
                          int index = entry.key;
                          List<String> row = entry.value;

                          List<DataCell> cells =
                              row.map((cell) => DataCell(Text(cell))).toList();

                          if (icon != null) {
                            cells.add(DataCell(InkWell(
                                onTap: () => onIconPressed?.call(index),
                                child: Icon(icon))));
                          }
                          if (withEditIcon == true) {
                            cells.add(DataCell(SizedBox(
                                width: 30.w,
                                height: 30.h,
                                child: Transform.scale(
                                    scale: 0.55,
                                    child: SvgPicture.asset(
                                        AppAssets.editReservationIcon)))));
                          }
                          if (withDeleteIcon == true) {
                            cells.add(DataCell(SizedBox(
                                width: 30.w,
                                height: 30.h,
                                child: Transform.scale(
                                    scale: 0.55,
                                    child: SvgPicture.asset(
                                        AppAssets.deleteIcon)))));
                          }

                          return DataRow(
                              color: WidgetStateProperty.resolveWith<Color?>(
                                  (Set<WidgetState> states) {
                                return index % 2 == 0
                                    ? AppColors.primaryColor.withOpacity(0.27)
                                    : Colors.transparent;
                              }),
                              cells: cells);
                        }).toList()))))
        : FittedBox(
            child: Padding(
                padding: EdgeInsets.only(top: 10.h, bottom: 30.h),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: DataTable(
                        headingRowColor: WidgetStateProperty.all(Colors.black),
                        columnSpacing: 18.w,
                        columns: [
                          ...columns.map((column) => DataColumn(
                                label: Text(column,
                                    style: const TextStyle(
                                        color: AppColors.tertiary)),
                              )),
                          if (icon != null) const DataColumn(label: Text('')),
                          if (withEditIcon == true)
                            const DataColumn(label: Text('')),
                          if (withDeleteIcon == true)
                            const DataColumn(label: Text('')),
                        ],
                        rows: rows.asMap().entries.map((entry) {
                          int index = entry.key;
                          List<String> row = entry.value;

                          List<DataCell> cells =
                              row.map((cell) => DataCell(Text(cell))).toList();
                          if (icon != null) {
                            cells.add(DataCell(InkWell(
                                onTap: () => onIconPressed?.call(index),
                                child: Icon(icon))));
                          }
                          if (withEditIcon == true) {
                            cells.add(DataCell(SizedBox(
                                width: 30.w,
                                height: 30.h,
                                child: Transform.scale(
                                    scale: 0.55,
                                    child: SvgPicture.asset(
                                        AppAssets.editReservationIcon)))));
                          }
                          if (withDeleteIcon == true) {
                            cells.add(DataCell(SizedBox(
                                width: 30.w,
                                height: 30.h,
                                child: Transform.scale(
                                    scale: 0.55,
                                    child: SvgPicture.asset(
                                        AppAssets.deleteIcon)))));
                          }
                          return DataRow(
                              color: WidgetStateProperty.resolveWith<Color?>(
                                  (Set<WidgetState> states) {
                                return index % 2 == 0
                                    ? AppColors.primaryColor.withOpacity(0.27)
                                    : Colors.transparent;
                              }),
                              cells: cells);
                        }).toList()))));
  }
}
