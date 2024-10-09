import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/features/clients/views/clients_details_screen.dart';
import 'package:roadapp/core/navigation/navigation.dart';
import '../data/models/clients_model.dart';

class ClientsScreen extends StatelessWidget {
  final cells = [
    ClientsModel("1", "أحمد نبيل", "ذكر", "طبيب", "0123456789", "1"),
    ClientsModel("2", "أيمن حازم", "ذكر", "مهندس", "0123456789", "2"),
    ClientsModel("3", "ندى شوقي", "انثى", "معلمة", "0123456789", "1"),
    ClientsModel("4", "جاد مرسي", "ذكر", "ظابط", "0123456789", "3"),
    ClientsModel("5", "إيمان أحمد", "انثى", "تسويق", "0123456789", "1"),
  ];

  final TextEditingController company = TextEditingController();

  ClientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final columns = [
      StringManager.s.tr(context),
      StringManager.clientName.tr(context),
      StringManager.gender.tr(context),
      StringManager.job.tr(context),
      StringManager.phoneNumber.tr(context),
      StringManager.vehiclesNumber.tr(context)
    ];
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: preferredSize,
            child: CustomAppBar(
                text: StringManager.identifiedCustomers.tr(context))),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              SizedBox(height: 10.h),
              FittedBox(
                  child: Padding(
                      padding: EdgeInsets.only(top: 10.h, bottom: 30.h),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: DataTable(
                              showCheckboxColumn: false,
                              headingRowColor:
                                  WidgetStateProperty.all(Colors.black),
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
                                    label: Center(
                                  child: Text(columns[2],
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: AppColors.tertiary)),
                                )),
                                DataColumn(
                                    label: Center(
                                  child: Text(columns[3],
                                      style: const TextStyle(
                                          color: AppColors.tertiary)),
                                )),
                                DataColumn(
                                    label: Text(columns[4],
                                        style: const TextStyle(
                                            color: AppColors.tertiary))),
                                DataColumn(
                                    label: Text(columns[5],
                                        style: const TextStyle(
                                            color: AppColors.tertiary))),
                                const DataColumn(
                                    label: Text("",
                                        style: TextStyle(
                                            color: AppColors.tertiary))),
                              ],
                              rows: cells.map(((element) {
                                return DataRow(
                                    color: WidgetStateProperty.all(
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
                                      DataCell(Center(
                                          child: Text(element.numOfVehicles))),
                                      const DataCell(
                                          Icon(Icons.more_vert_outlined))
                                    ],
                                    onSelectChanged: (f) {
                                      AppNavigation.navigate(
                                          ClientsDetailsScreen());
                                    });
                              })).toList()))))
            ])));
  }
}