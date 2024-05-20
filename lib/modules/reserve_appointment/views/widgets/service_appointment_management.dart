import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:roadapp2/shared/const/app_images.dart';

import '../../../../shared/resources/colors.dart';

class ServiceAppointmentManagement extends StatelessWidget {
  const ServiceAppointmentManagement({super.key, required this.columns1, required this.cells1});

  final List columns1;
  final List cells1;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.r),
      child: DataTable(
        columnSpacing: 25.w,
        headingRowColor: MaterialStateProperty.all(Colors.black),
        columns: [
          DataColumn(
              label:
              Expanded(child: Text(columns1[0], style: const TextStyle(color: AppColors.tertiary),textAlign: TextAlign.center,))),
          DataColumn(
              label:
              Expanded(child: Text(columns1[1], style: const TextStyle(color: AppColors.tertiary),textAlign: TextAlign.center,))),
          DataColumn(
              label:
              Expanded(child: Text(columns1[2], style: const TextStyle(color: AppColors.tertiary),textAlign: TextAlign.center,))),
          DataColumn(
              label:
              Expanded(child: Text(columns1[3], style: const TextStyle(color: AppColors.tertiary),textAlign: TextAlign.center))),
          const DataColumn(
              label:
              SizedBox()),
        ],
        rows:
        cells1
            .map(
          ((element) {
            return DataRow(
              color: MaterialStateProperty.all(
                  AppColors.primaryColor.withOpacity(0.27)),
              cells: [
                DataCell(Center(child: Text(element.vendor))),
                DataCell(Center(child: Text(element.operation))),
                DataCell(Center(child: Text(element.date))),
                DataCell(Center(child: Text(element.time))),
                DataCell(Row(
                  children: [
                    SizedBox(
                      width: 30.w,
                      height: 30.h,
                      child: Transform.scale(
                          scale: 0.55,
                          child: SvgPicture.asset(AppImages.editReservationIcon)),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    SizedBox(
                      width: 30.w,
                      height: 30.h,
                      child: Transform.scale(
                          scale: 0.55,
                          child: SvgPicture.asset(AppImages.deleteIcon)),
                    ),
                  ],
                )),
              ],
            ); } ),
        ).
        toList(),
      ),
    );
  }
}
