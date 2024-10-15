import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/app_assets.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/utils/string_manager.dart';

class ServiceAppointmentManagement extends StatelessWidget {
  const ServiceAppointmentManagement({super.key, required this.cells1});

  final List cells1;

  @override
  Widget build(BuildContext context) {
    final columns1 = [
      StringManager.centerName.tr(context),
      StringManager.procedureType.tr(context),
      StringManager.date.tr(context),
      StringManager.time.tr(context)
    ];

    return ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: DataTable(
            columnSpacing: 25.w,
            headingRowColor: WidgetStateProperty.all(Colors.black),
            columns: [
              DataColumn(
                  label: Expanded(
                      child: Text(columns1[0],
                          style: const TextStyle(color: AppColors.tertiary),
                          textAlign: TextAlign.center))),
              DataColumn(
                  label: Expanded(
                      child: Text(columns1[1],
                          style: const TextStyle(color: AppColors.tertiary),
                          textAlign: TextAlign.center))),
              DataColumn(
                  label: Expanded(
                      child: Text(columns1[2],
                          style: const TextStyle(color: AppColors.tertiary),
                          textAlign: TextAlign.center))),
              DataColumn(
                  label: Expanded(
                      child: Text(columns1[3],
                          style: const TextStyle(color: AppColors.tertiary),
                          textAlign: TextAlign.center))),
              const DataColumn(label: SizedBox())
            ],
            rows: cells1.map(((element) {
              return DataRow(
                  color: WidgetStateProperty.all(
                      AppColors.primaryColor.withOpacity(0.27)),
                  cells: [
                    DataCell(Center(child: Text(element.vendor))),
                    DataCell(Center(child: Text(element.operation))),
                    DataCell(Center(child: Text(element.date))),
                    DataCell(Center(child: Text(element.time))),
                    DataCell(Row(children: [
                      SizedBox(
                          width: 30.w,
                          height: 30.h,
                          child: Transform.scale(
                              scale: 0.55,
                              child: SvgPicture.asset(
                                  AppAssets.editReservationIcon))),
                      SizedBox(width: 10.w),
                      SizedBox(
                          width: 30.w,
                          height: 30.h,
                          child: Transform.scale(
                              scale: 0.55,
                              child: SvgPicture.asset(AppAssets.deleteIcon)))
                    ]))
                  ]);
            })).toList()));
  }
}
