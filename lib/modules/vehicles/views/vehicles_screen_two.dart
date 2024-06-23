import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/models/vehicles/vehicles_model.dart';
import 'package:roadapp/modules/maintenance%20_report/views/screens/maintenance_report_screen.dart';
import 'package:roadapp/modules/vehicles/widgets/add_vehicle_component.dart';
import 'package:roadapp/modules/vehicles/widgets/single_add_vehicle_text_field.dart';
import 'package:roadapp/services/navigation/navigation.dart';
import 'package:roadapp/shared/widgets/custom_alert_dialog.dart';
import 'package:roadapp/shared/widgets/custom_button.dart';
import 'package:roadapp/shared/widgets/custom_elevated_button_two.dart';

import '../../../shared/resources/colors.dart';
import '../../../shared/widgets/custom_appbar.dart';

class VehiclesScreenTwo extends StatelessWidget {
  final columns = ["م", "الشركة", "السيارة", "الموديل", "رقم اللوحة"];
  final cells = [
    VehiclesModel("1", "تويوتا", "كورولا", "2015", "أ ب هـ 2 3 4 6"),
    VehiclesModel("2", "شيفروليه", "كروز", "2012", "أ ب هـ 2 3 4 6"),
    VehiclesModel("3", "شيفروليه", "لانوس", "2010", "أ ب هـ 2 3 4 6"),
    VehiclesModel("4", "شيفروليه", "كروز", "2012", "أ ب هـ 2 3 4 6"),
    VehiclesModel("5", "شيفروليه", "لانوس", "2010", "أ ب هـ 2 3 4 6"),
  ];

  final TextEditingController company = TextEditingController();

  VehiclesScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: preferredSize,
          child: const CustomAppBar(text: 'المركبات المعرفة')),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 10.h,
            ),
            CustomElevatedButtonTwo(
                onTap: () {
                  showCustomAlertDialog(
                      context: context,
                      title: 'إضافة مركبة',
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          const AddVehicleComponent(
                            firstText: 'الشركة',
                            secondText: 'السيارة',
                          ),
                          const AddVehicleComponent(
                            firstText: 'الموديل',
                            secondText: 'رقم اللوحة',
                          ),
                          const AddVehicleComponent(
                            firstText: 'نوع الفتيس',
                            secondText: 'عدد الـ CC',
                          ),
                          const AddVehicleComponent(
                            firstText: 'رقم الماتور',
                            secondText: 'رقم الشاسيه',
                            required: false,
                          ),
                          const SingleAddVehicleTextField(),
                          CustomElevatedButton(
                              onTap: () {},
                              widget: Text(
                                '   أضف   ',
                                style: TextStyle(
                                  fontSize: 10.sp,
                                ),
                              ))
                        ],
                      ));
                },
                widget: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                    Text(
                      'إضافة مركبة',
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                )),
            FittedBox(
              child: Padding(
                padding: EdgeInsets.only(top: 10.h, bottom: 30.h),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: DataTable(
                    headingRowColor: MaterialStateProperty.all(Colors.black),
                    columnSpacing: 18.w,
                    columns: [
                      DataColumn(
                          label: Text(
                        columns[0],
                        style: const TextStyle(color: AppColors.tertiary),
                      )),
                      DataColumn(
                          label: Text(columns[1],
                              style:
                                  const TextStyle(color: AppColors.tertiary))),
                      DataColumn(
                          label: Text(columns[2],
                              style:
                                  const TextStyle(color: AppColors.tertiary))),
                      DataColumn(
                          label: Text(columns[3],
                              style:
                                  const TextStyle(color: AppColors.tertiary))),
                      DataColumn(
                          label: Text(columns[4],
                              style:
                                  const TextStyle(color: AppColors.tertiary))),
                      const DataColumn(
                          label: Text("",
                              style: TextStyle(color: AppColors.tertiary))),
                    ],
                    rows: cells.map(
                      ((element) {
                        return DataRow(
                          color: MaterialStateProperty.all(
                              cells.indexOf(element) % 2 == 0
                                  ? AppColors.primaryColor.withOpacity(0.27)
                                  : Colors.transparent),
                          cells: [
                            DataCell(Text(element.no)),
                            DataCell(Text(element.company)),
                            DataCell(Text(element.car)),
                            DataCell(Text(element.carModel)),
                            DataCell(Text(element.plateNumber)),
                            DataCell(InkWell(
                                onTap: () {
                                  AppNavigation.navigate(
                                      const MaintenanceReportScreen());
                                },
                                child: const Icon(Icons.more_vert_outlined))),
                          ],
                        );
                      }),
                    ).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
