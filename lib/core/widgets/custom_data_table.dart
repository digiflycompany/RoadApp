import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/helpers/app_assets.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/theming/styles.dart';
import 'package:roadapp/core/widgets/custom_button.dart';
import 'package:roadapp/features/general_inventory/data/models/get_general_stock_response.dart';
import 'package:roadapp/features/vendor_reservations_management/presentation/cubit/reservations_management_cubit.dart';
import 'package:roadapp/features/vendor_reservations_management/presentation/cubit/reservations_management_state.dart';

import '../../features/reserve_appointment/presentation/cubit/reserve_appointment_cubit.dart';
import '../../features/reserve_appointment/presentation/cubit/reserve_appointment_state.dart';
import 'custom_alert_dialog.dart';

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
                  rows: [rows]))),
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
        ? BlocBuilder<ReserveAppointmentCubit, ReserveAppointmentStates>(
            builder: (context, state) {
              var cubit = ReserveAppointmentCubit.get(context);
              return Padding(
                  padding: EdgeInsets.only(top: 10.h, bottom: 30.h),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: SizedBox(
                          width: double.infinity,
                          child: DataTable(
                              headingRowColor:
                                  WidgetStateProperty.all(Colors.black),
                              columnSpacing: 18.w,
                              columns: [
                                ...columns.map((column) => DataColumn(
                                      label: Text(column,
                                          style: const TextStyle(
                                              color: AppColors.tertiary)),
                                    )),
                                if (icon != null)
                                  const DataColumn(label: Text('')),
                                if (withEditIcon == true)
                                  const DataColumn(label: Text('')),
                                if (withDeleteIcon == true)
                                  const DataColumn(label: Text(''))
                              ],
                              rows: rows.asMap().entries.map((entry) {
                                int index = entry.key;
                                List<String> row = entry.value;

                                List<DataCell> cells = row
                                    .map((cell) => DataCell(Text(cell)))
                                    .toList();


                                // // استبعاد آخر عنصر (id) من الواجهة
                                // List<DataCell> cells = row.sublist(0, row.length - 1)
                                //     .map((cell) => DataCell(Text(cell)))
                                //     .toList();

                                if (icon != null) {
                                  cells.add(DataCell(InkWell(
                                      onTap: () => onIconPressed?.call(index),
                                      child: Icon(icon))));
                                }
                                if (withEditIcon == true) {
                                  cells.add(
                                    DataCell(
                                      SizedBox(
                                        width: 30.w,
                                        height: 30.h,
                                        child: Transform.scale(
                                          scale: 0.55,
                                          child: SvgPicture.asset(
                                            AppAssets.editReservationIcon,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
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
                                    color:
                                        WidgetStateProperty.resolveWith<Color?>(
                                            (Set<WidgetState> states) {
                                      return index % 2 == 0
                                          ? AppColors.primaryColor
                                              .withOpacity(0.27)
                                          : Colors.transparent;
                                    }),
                                    cells: cells);
                              }).toList()))));
            },
          )
        : BlocBuilder<ReserveAppointmentCubit, ReserveAppointmentStates>(
            builder: (context, state) {
              var cubit = ReserveAppointmentCubit.get(context);
              return FittedBox(
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

                        List<DataCell> cells = row
                            .map((cell) => DataCell(Text(cell)))
                            .toList();

                        // // استبعاد آخر عنصر (id) من الواجهة
                        // List<DataCell> cells = row.sublist(0, row.length - 1)
                        //     .map((cell) => DataCell(Text(cell)))
                        //     .toList();

                        if (icon != null) {
                          cells.add(DataCell(InkWell(
                              onTap: () => onIconPressed?.call(index),
                              child: Icon(icon))));
                        }
                        if (withEditIcon == true) {
                          cells.add(
                            DataCell(
                              SizedBox(
                                width: 30.w,
                                height: 30.h,
                                child: Transform.scale(
                                  scale: 0.55,
                                  child: SvgPicture.asset(
                                    AppAssets.editReservationIcon,
                                  ),
                                ),
                              ),
                            ),
                          );
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
                              },
                            ),
                            cells: cells);
                      }).toList(),
                    ),
                  ),
                ),
              );
            },
          );
  }
}

class CustomMultiRowsTableBooking extends StatelessWidget {
  const CustomMultiRowsTableBooking({
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
        ? BlocBuilder<ReserveAppointmentCubit, ReserveAppointmentStates>(
      builder: (context, state) {
        var cubit = ReserveAppointmentCubit.get(context);
        return Padding(
            padding: EdgeInsets.only(top: 10.h, bottom: 30.h),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: SizedBox(
                    width: double.infinity,
                    child: DataTable(
                        headingRowColor:
                        WidgetStateProperty.all(Colors.black),
                        columnSpacing: 18.w,
                        columns: [
                          ...columns.map((column) => DataColumn(
                            label: Text(column,
                                style: const TextStyle(
                                    color: AppColors.tertiary)),
                          )),
                          if (icon != null)
                            const DataColumn(label: Text('')),
                          if (withEditIcon == true)
                            const DataColumn(label: Text('')),
                          if (withDeleteIcon == true)
                            const DataColumn(label: Text(''))
                        ],
                        rows: rows.asMap().entries.map((entry) {
                          int index = entry.key;
                          List<String> row = entry.value;

                          List<DataCell> cells = row.take(row.length - 1)
                              .map((cell) => DataCell(Text(cell)))
                              .toList();

                          if (icon != null) {
                            cells.add(DataCell(InkWell(
                                onTap: () => onIconPressed?.call(index),
                                child: Icon(icon))));
                          }
                          if (withEditIcon == true) {
                            cells.add(
                              DataCell(
                                GestureDetector(
                                  onTap: () {
                                    showCustomAlertDialog(
                                        context: context,
                                        title: StringManager.update.tr(context),
                                        content: SizedBox(
                                          height: 130.h,
                                          child: SingleChildScrollView(
                                            child: Column(
                                              children: [

                                                SizedBox(
                                                  height: 20.h,
                                                ),
                                                SingleChildScrollView(
                                                  scrollDirection: Axis.horizontal,
                                                  child: Row(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          cubit.pickupDate();
                                                        },
                                                        child: Container(
                                                          padding: EdgeInsets.symmetric(
                                                            horizontal: 10.w,
                                                            vertical: 10.h,
                                                          ),
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(10.r),
                                                            color: const Color(0xFFF9F9F9),
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              FittedBox(
                                                                child: Text(
                                                                    "${cubit.dateTime.year} / ${cubit.dateTime.month} / ${cubit.dateTime.day}",
                                                                    style: TextStyle(
                                                                        fontSize: 10.sp,
                                                                        color: const Color(0xFFAAAAAA))),
                                                              ),
                                                              SizedBox(
                                                                width: 5.w,
                                                              ),
                                                              SvgPicture.asset(AppAssets.calenderIcon,
                                                                  width: 12.w, height: 12.h)
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 10.w,
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          cubit.pickupTime();
                                                        },
                                                        child: Container(
                                                          width: 40.w,
                                                          padding: EdgeInsets.symmetric(
                                                              horizontal: 10.w, vertical: 10.h),
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(10.r),
                                                            color: const Color(0xFFF9F9F9),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              cubit.timeOfDay.minute.toString().padLeft(2, '0'),
                                                              style: TextStyle(
                                                                fontSize: 10.sp,
                                                                color: const Color(0xFFAAAAAA),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                                                        child: const Text(
                                                          ":",
                                                          style: TextStyle(fontWeight: FontWeight.bold),
                                                        ),
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          cubit.pickupTime();
                                                        },
                                                        child: Container(
                                                          width: 40.w,
                                                          padding: EdgeInsets.symmetric(
                                                              horizontal: 10.w, vertical: 10.h),
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(10.r),
                                                            color: const Color(0xFFF9F9F9),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              cubit.timeOfDay.hourOfPeriod
                                                                  .toString()
                                                                  .padLeft(2, '0'),
                                                              style: TextStyle(
                                                                fontSize: 10.sp,
                                                                color: const Color(0xFFAAAAAA),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: 10.w),
                                                      GestureDetector(
                                                        onTap: () {
                                                          cubit.pickupTime();
                                                        },
                                                        child: Container(
                                                          width: 40.w,
                                                          padding: EdgeInsets.symmetric(
                                                              horizontal: 10.w, vertical: 10.h),
                                                          decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(10.r),
                                                              color: const Color(0xFFF9F9F9)),
                                                          child: Center(
                                                            child: Text(
                                                              cubit.timeOfDay.period.name,
                                                              style: TextStyle(
                                                                fontSize: 10.sp,
                                                                color: const Color(0xFFAAAAAA),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),


                                                    ],
                                                  ),
                                                ),

                                                SizedBox(
                                                  height: 20.h,
                                                ),
                                                state is UpdateBookingLoading
                                                    ? const Center(child: CircularProgressIndicator()) :
                                                CustomElevatedButton(
                                                  onTap: (){
                                                    debugPrint(row[4]);
                                                    cubit.updateBooking(row[4]);
                                                  },
                                                  widget: Text(
                                                    StringManager.update.tr(context),
                                                    style: Styles.textStyle12,
                                                  ),
                                                )


                                              ],
                                            ),
                                          ),
                                        )

                                    );
                                  },
                                  child: SizedBox(
                                    width: 30.w,
                                    height: 30.h,
                                    child: Transform.scale(
                                      scale: 0.55,
                                      child: SvgPicture.asset(
                                        AppAssets.editReservationIcon,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
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
                              color:
                              WidgetStateProperty.resolveWith<Color?>(
                                      (Set<WidgetState> states) {
                                    return index % 2 == 0
                                        ? AppColors.primaryColor
                                        .withOpacity(0.27)
                                        : Colors.transparent;
                                  }),
                              cells: cells);
                        }).toList()))));
      },
    )
        : BlocBuilder<ReserveAppointmentCubit, ReserveAppointmentStates>(
      builder: (context, state) {
        var cubit = ReserveAppointmentCubit.get(context);
        return FittedBox(
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

                  List<DataCell> cells = row
                      .take(row.length - 1)
                      .map((cell) => DataCell(Text(cell)))
                      .toList();
                  if (icon != null) {
                    cells.add(DataCell(InkWell(
                        onTap: () => onIconPressed?.call(index),
                        child: Icon(icon))));
                  }
                  if (withEditIcon == true) {
                    cells.add(
                      DataCell(
                        GestureDetector(
                          onTap: () {
                            showCustomAlertDialog(
                                context: context,
                                title: StringManager.update.tr(context),
                                content: SizedBox(
                                  height: 130.h,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [

                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  cubit.pickupDate();
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 10.w,
                                                    vertical: 10.h,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10.r),
                                                    color: const Color(0xFFF9F9F9),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      FittedBox(
                                                        child: Text(
                                                            "${cubit.dateTime.year} / ${cubit.dateTime.month} / ${cubit.dateTime.day}",
                                                            style: TextStyle(
                                                                fontSize: 10.sp,
                                                                color: const Color(0xFFAAAAAA))),
                                                      ),
                                                      SizedBox(
                                                        width: 5.w,
                                                      ),
                                                      SvgPicture.asset(AppAssets.calenderIcon,
                                                          width: 12.w, height: 12.h)
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  cubit.pickupTime();
                                                },
                                                child: Container(
                                                  width: 40.w,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10.w, vertical: 10.h),
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10.r),
                                                    color: const Color(0xFFF9F9F9),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      cubit.timeOfDay.minute.toString().padLeft(2, '0'),
                                                      style: TextStyle(
                                                        fontSize: 10.sp,
                                                        color: const Color(0xFFAAAAAA),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.symmetric(horizontal: 5.w),
                                                child: const Text(
                                                  ":",
                                                  style: TextStyle(fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  cubit.pickupTime();
                                                },
                                                child: Container(
                                                  width: 40.w,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10.w, vertical: 10.h),
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10.r),
                                                    color: const Color(0xFFF9F9F9),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      cubit.timeOfDay.hourOfPeriod
                                                          .toString()
                                                          .padLeft(2, '0'),
                                                      style: TextStyle(
                                                        fontSize: 10.sp,
                                                        color: const Color(0xFFAAAAAA),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 10.w),
                                              GestureDetector(
                                                onTap: () {
                                                  cubit.pickupTime();
                                                },
                                                child: Container(
                                                  width: 40.w,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10.w, vertical: 10.h),
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(10.r),
                                                      color: const Color(0xFFF9F9F9)),
                                                  child: Center(
                                                    child: Text(
                                                      cubit.timeOfDay.period.name,
                                                      style: TextStyle(
                                                        fontSize: 10.sp,
                                                        color: const Color(0xFFAAAAAA),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),


                                            ],
                                          ),
                                        ),

                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        state is UpdateBookingLoading
                                            ? const Center(child: CircularProgressIndicator()) :
                                        CustomElevatedButton(
                                          onTap: (){
                                            debugPrint(row[4]);
                                            cubit.updateBooking(row[4]);
                                          },
                                          widget: Text(
                                            StringManager.update.tr(context),
                                            style: Styles.textStyle12,
                                          ),
                                        )


                                      ],
                                    ),
                                  ),
                                )

                            );
                            // debugPrint(row[4]);
                            // cubit.updateBooking(row[4]);
                          },
                          child: SizedBox(
                            width: 30.w,
                            height: 30.h,
                            child: Transform.scale(
                              scale: 0.55,
                              child: SvgPicture.asset(
                                AppAssets.editReservationIcon,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
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
                        },
                      ),
                      cells: cells);
                }).toList(),
              ),
            ),
          ),
        );
      },
    );
  }
}



class CustomMultiRowsCustomerTable extends StatelessWidget {
  const CustomMultiRowsCustomerTable({
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
        ? BlocBuilder<ReserveAppointmentCubit, ReserveAppointmentStates>(
      builder: (context, state) {
        var cubit = ReserveAppointmentCubit.get(context);
        return Padding(
            padding: EdgeInsets.only(top: 10.h, bottom: 30.h),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: SizedBox(
                    width: double.infinity,
                    child: DataTable(
                        headingRowColor:
                        WidgetStateProperty.all(Colors.black),
                        columnSpacing: 18.w,
                        columns: [
                          ...columns.map((column) => DataColumn(
                            label: Text(column,
                                style: const TextStyle(
                                    color: AppColors.tertiary)),
                          )),
                          if (icon != null)
                            const DataColumn(label: Text('')),
                          if (withEditIcon == true)
                            const DataColumn(label: Text('')),
                          if (withDeleteIcon == true)
                            const DataColumn(label: Text(''))
                        ],
                        rows: rows.asMap().entries.map((entry) {
                          int index = entry.key;
                          List<String> row = entry.value;

                          // List<DataCell> cells = row
                          //     .map((cell) => DataCell(Text(cell)))
                          //     .toList();


                          // استبعاد آخر عنصر (id) من الواجهة
                          List<DataCell> cells = row.sublist(0, row.length - 1)
                              .map((cell) => DataCell(Text(cell)))
                              .toList();

                          if (icon != null) {
                            cells.add(DataCell(InkWell(
                                onTap: () => onIconPressed?.call(index),
                                child: Icon(icon))));
                          }
                          if (withEditIcon == true) {
                            cells.add(
                              DataCell(
                                SizedBox(
                                  width: 30.w,
                                  height: 30.h,
                                  child: Transform.scale(
                                    scale: 0.55,
                                    child: SvgPicture.asset(
                                      AppAssets.editReservationIcon,
                                    ),
                                  ),
                                ),
                              ),
                            );
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
                              color:
                              WidgetStateProperty.resolveWith<Color?>(
                                      (Set<WidgetState> states) {
                                    return index % 2 == 0
                                        ? AppColors.primaryColor
                                        .withOpacity(0.27)
                                        : Colors.transparent;
                                  }),
                              cells: cells);
                        }).toList()))));
      },
    )
        : BlocBuilder<ReserveAppointmentCubit, ReserveAppointmentStates>(
      builder: (context, state) {
        var cubit = ReserveAppointmentCubit.get(context);
        return FittedBox(
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

                  // List<DataCell> cells = row
                  //     .map((cell) => DataCell(Text(cell)))
                  //     .toList();

                  // استبعاد آخر عنصر (id) من الواجهة
                  List<DataCell> cells = row.sublist(0, row.length - 1)
                      .map((cell) => DataCell(Text(cell)))
                      .toList();

                  if (icon != null) {
                    cells.add(DataCell(InkWell(
                        onTap: () => onIconPressed?.call(index),
                        child: Icon(icon))));
                  }
                  if (withEditIcon == true) {
                    cells.add(
                      DataCell(
                        SizedBox(
                          width: 30.w,
                          height: 30.h,
                          child: Transform.scale(
                            scale: 0.55,
                            child: SvgPicture.asset(
                              AppAssets.editReservationIcon,
                            ),
                          ),
                        ),
                      ),
                    );
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
                        },
                      ),
                      cells: cells);
                }).toList(),
              ),
            ),
          ),
        );
      },
    );
  }
}
