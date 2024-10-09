import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/core/widgets/custom_alert_dialog.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/features/vehicles/data/models/vehicles_model.dart';
import 'package:roadapp/features/vehicles/widgets/add_vehicle_button.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/features/vehicles/widgets/vehicle_details_dialog.dart';

class VehiclesScreen extends StatelessWidget {
  final cells = [
    VehiclesModel("1", "تويوتا", "كورولا", "2015", "أ ب هـ 2 3 4 6"),
    VehiclesModel("2", "شيفروليه", "كروز", "2012", "أ ب هـ 2 3 4 6"),
    VehiclesModel("3", "شيفروليه", "لانوس", "2010", "أ ب هـ 2 3 4 6"),
    VehiclesModel("4", "شيفروليه", "كروز", "2012", "أ ب هـ 2 3 4 6"),
    VehiclesModel("5", "شيفروليه", "لانوس", "2010", "أ ب هـ 2 3 4 6"),
  ];

  final TextEditingController company = TextEditingController();

  VehiclesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final columns = [
      StringManager.s.tr(context),
      StringManager.company.tr(context),
      StringManager.car.tr(context),
      StringManager.launchYear.tr(context),
      StringManager.licensePlateNumber
    ];
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: preferredSize,
            child: CustomAppBar(
                text: StringManager.identifiedVehicles.tr(context))),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              SizedBox(height: 10.h),
              const AddVehicleButton(),
              FittedBox(
                  child: Padding(
                      padding: EdgeInsets.only(top: 10.h, bottom: 30.h),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: DataTable(
                              headingRowColor:
                                  MaterialStateProperty.all(Colors.black),
                              columnSpacing: 18.w,
                              columns: [
                                DataColumn(
                                    label: Text(columns[0],
                                        style: const TextStyle(
                                            color: AppColors.tertiary))),
                                DataColumn(
                                    label: Text(columns[1],
                                        style: const TextStyle(
                                            color: AppColors.tertiary))),
                                DataColumn(
                                    label: Text(columns[2],
                                        style: const TextStyle(
                                            color: AppColors.tertiary))),
                                DataColumn(
                                    label: Text(columns[3],
                                        style: const TextStyle(
                                            color: AppColors.tertiary))),
                                DataColumn(
                                    label: Text(columns[4],
                                        style: const TextStyle(
                                            color: AppColors.tertiary))),
                                const DataColumn(
                                    label: Text("",
                                        style: TextStyle(
                                            color: AppColors.tertiary)))
                              ],
                              rows: cells.map(((element) {
                                return DataRow(
                                    color: MaterialStateProperty.all(
                                        cells.indexOf(element) % 2 == 0
                                            ? AppColors.primaryColor
                                                .withOpacity(0.27)
                                            : Colors.transparent),
                                    cells: [
                                      DataCell(Text(element.no)),
                                      DataCell(Text(element.company)),
                                      DataCell(Text(element.car)),
                                      DataCell(Text(element.carModel)),
                                      DataCell(Text(element.plateNumber)),
                                      DataCell(InkWell(
                                          onTap: () {
                                            showCustomAlertDialog(
                                                context: context,
                                                title: StringManager
                                                    .vehicleDetails
                                                    .tr(context),
                                                content:
                                                    const VehicleDetailsDialog());
                                          },
                                          child: const Icon(
                                              Icons.more_vert_outlined)))
                                    ]);
                              })).toList()))))
            ])));
  }
}