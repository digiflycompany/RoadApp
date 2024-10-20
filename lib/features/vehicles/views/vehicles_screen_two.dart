import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/core/widgets/custom_data_table.dart';
import 'package:roadapp/features/vehicles/widgets/add_vehicle_button.dart';

class VehiclesScreenTwo extends StatelessWidget {
  final cells = [
    ["1", "تويوتا", "كورولا", "2015", "أ ب هـ 2 3 4 6"],
   [ "2", "شيفروليه", "كروز", "2012", "أ ب هـ 2 3 4 6"],
    ["3", "شيفروليه", "لانوس", "2010", "أ ب هـ 2 3 4 6"],
    ["4", "شيفروليه", "كروز", "2012", "أ ب هـ 2 3 4 6"],
    ["5", "شيفروليه", "لانوس", "2010", "أ ب هـ 2 3 4 6"],
  ];

  final TextEditingController company = TextEditingController();

  VehiclesScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final columns = [
      StringManager.s.tr(context),
      StringManager.company.tr(context),
      StringManager.car.tr(context),
      StringManager.manufactureYear.tr(context),
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
                      child: 
                      CustomMultiRowsTable(columns: columns, rows: cells)))
            ])));
  }
}