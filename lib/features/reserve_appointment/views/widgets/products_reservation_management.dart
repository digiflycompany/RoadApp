import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/app_assets.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/utils/string_manager.dart';

class ProductsReservationManagement extends StatelessWidget {
  const ProductsReservationManagement({super.key, required this.cells2});

  final List cells2;

  @override
  Widget build(BuildContext context) {
    final columns2 = [
      StringManager.centerName.tr(context),
      StringManager.procedureType.tr(context),
      StringManager.date.tr(context),
      StringManager.time.tr(context)
    ];
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.r),
      child: DataTable(
        columnSpacing: 25,
        headingRowColor: MaterialStateProperty.all(Colors.black),
        columns: [
          DataColumn(
              label: Expanded(
                  child: Text(columns2[0],
                      style: const TextStyle(color: AppColors.tertiary),
                      textAlign: TextAlign.center))),
          DataColumn(
              label: Expanded(
                  child: Text(columns2[1],
                      style: const TextStyle(color: AppColors.tertiary),
                      textAlign: TextAlign.center))),
          DataColumn(
              label: Expanded(
                  child: Text(columns2[2],
                      style: const TextStyle(color: AppColors.tertiary),
                      textAlign: TextAlign.center))),
          DataColumn(
              label: Expanded(
                  child: Text(columns2[3],
                      style: const TextStyle(color: AppColors.tertiary),
                      textAlign: TextAlign.center))),
          const DataColumn(label: SizedBox()),
        ],
        rows: cells2
            .map(
              ((element) => DataRow(
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
                                child: SvgPicture.asset(
                                    AppAssets.editReservationIcon)),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          SizedBox(
                            width: 30.w,
                            height: 30.h,
                            child: Transform.scale(
                                scale: 0.55,
                                child: SvgPicture.asset(AppAssets.deleteIcon)),
                          ),
                        ],
                      )),
                    ],
                  )),
            )
            .toList(),
      ),
    );
  }
}
