import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/features/clients/data/models/customer_reports_response_model.dart';

class CustomerInfoTable extends StatelessWidget {
  const CustomerInfoTable({super.key, required this.vehicles});

  final List<VehicleData> vehicles; // استقبال قائمة المركبات

  @override
  Widget build(BuildContext context) {
    final columns = [
      StringManager.s.tr(context),
      StringManager.car.tr(context),
      StringManager.manufactureYear.tr(context),
      StringManager.transmissionType.tr(context),
      StringManager.licensePlateNumber.tr(context),
    ];

    return FittedBox(
      child: Padding(
        padding: EdgeInsets.only(top: 10.h, bottom: 30.h),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: DataTable(
            headingRowColor: WidgetStateProperty.all(Colors.black),
            columnSpacing: 18.w,
            columns: columns
                .map((column) => DataColumn(
              label: Text(column,
                  style: const TextStyle(color: AppColors.tertiary)),
            ))
                .toList(),
            rows: vehicles.isNotEmpty
                ? vehicles.map((vehicle) {
              return DataRow(
                color: WidgetStateProperty.all(
                  vehicles.indexOf(vehicle) % 2 == 0
                      ? AppColors.primaryColor.withOpacity(0.27)
                      : Colors.transparent,
                ),
                cells: [
                  DataCell(Text((vehicles.indexOf(vehicle) + 1)
                      .toString())), // الرقم الترتيبي
                  DataCell(Text(vehicle.model)), // اسم السيارة
                  DataCell(Text(vehicle.manufacturingYear?.toString() ??
                      "غير متوفر")), // سنة التصنيع
                  DataCell(Text(vehicle.gearShiftType)), // نوع ناقل الحركة
                  DataCell(Text(vehicle.plateNumber)), // رقم اللوحة
                  // const DataCell(
                  //   InkWell(child: Icon(Icons.more_vert_outlined)),
                  // ),
                ],
              );
            }).toList()
                : [
              const DataRow(cells: [
                DataCell(Text("لا توجد مركبات متاحة")),
                DataCell(Text("")),
                DataCell(Text("")),
                DataCell(Text("")),
                DataCell(Text("")),
                //DataCell(Text("")),
              ])
            ],
          ),
        ),
      ),
    );
  }
}





// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:roadapp/core/helpers/localization/app_localization.dart';
// import 'package:roadapp/core/Theming/colors.dart';
// import 'package:roadapp/core/helpers/string_manager.dart';
// import 'package:roadapp/features/clients/data/models/clients_model.dart';
// import 'package:roadapp/features/clients/data/models/customer_reports_response_model.dart';
//
// class CustomerInfoTable extends StatelessWidget {
//   const CustomerInfoTable({super.key, required this.vehicles});
//
//   final List<VehicleData> vehicles; // استقبال المركبات
//
//
//   @override
//   Widget build(BuildContext context) {
//     final columns = [
//       StringManager.s.tr(context),
//       StringManager.car.tr(context),
//       StringManager.manufactureYear.tr(context),
//       StringManager.transmissionType.tr(context),
//       StringManager.licensePlateNumber.tr(context),
//     ];
//
//     final cells = [
//       ClientsModel("1", "صني", "2014", "مانوال", "أ ب هـ 2 3 4 6", "1"),
//       ClientsModel("2", "افيو", "2010", "مانوال", "ن و ص 8 6 4 9", "2"),
//       ClientsModel("3", "باندينو", "2015", "اوتوماتيك", "س و ق 1 5 7 4", "1"),
//     ];
//     return FittedBox(
//         child: Padding(
//             padding: EdgeInsets.only(top: 10.h, bottom: 30.h),
//             child: ClipRRect(
//                 borderRadius: BorderRadius.circular(10.r),
//                 child: DataTable(
//                     headingRowColor: WidgetStateProperty.all(Colors.black),
//                     columnSpacing: 18.w,
//                     columns: [
//                       DataColumn(
//                           label: Text(columns[0],
//                               style:
//                               const TextStyle(color: AppColors.tertiary))),
//                       DataColumn(
//                           label: Text(columns[1],
//                               style:
//                               const TextStyle(color: AppColors.tertiary))),
//                       DataColumn(
//                           label: Center(
//                               child: Text(columns[2],
//                                   textAlign: TextAlign.center,
//                                   style: const TextStyle(
//                                       color: AppColors.tertiary)))),
//                       DataColumn(
//                           label: Center(
//                               child: Text(columns[3],
//                                   style: const TextStyle(
//                                       color: AppColors.tertiary)))),
//                       DataColumn(
//                           label: Text(columns[4],
//                               style:
//                               const TextStyle(color: AppColors.tertiary))),
//                       const DataColumn(
//                           label: Text("",
//                               style: TextStyle(color: AppColors.tertiary)))
//                     ],
//                     rows: cells.map(((element) {
//                       return DataRow(
//                           color: WidgetStateProperty.all(
//                               cells.indexOf(element) % 2 == 0
//                                   ? AppColors.primaryColor.withOpacity(0.27)
//                                   : Colors.transparent),
//                           cells: [
//                             DataCell(Text(element.no)),
//                             DataCell(Text(element.company)),
//                             DataCell(Text(element.car)),
//                             DataCell(Text(element.carModel)),
//                             DataCell(Text(element.plateNumber)),
//                             const DataCell(
//                                 InkWell(child: Icon(Icons.more_vert_outlined)))
//                           ]);
//                     })).toList()))));
//   }
// }