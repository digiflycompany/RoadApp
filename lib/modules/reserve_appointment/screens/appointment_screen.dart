import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp2/models/appointment_reservation_management/appointment_reservation_management_model.dart';
import 'package:roadapp2/shared/const/app_images.dart';

import '../../../shared/resources/colors.dart';
import '../../../shared/widgets/custom_appbar.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  final columns1 = ["اسم المركز", "نوع الاجراء", "التاريخ", "الوقت"];

  final columns2 = ["اسم المركز", "نوع الاجراء", "التاريخ", "الوقت"];

  final cells2 = [
    AppointmentReservationManagementModel(
        "العالمية للكوري", "تيل فرامل", "09/03/2023", "8م"),
    AppointmentReservationManagementModel(
        "العالمية للكوري", "فانوس أمامي", "09/03/2023", "8م"),
    // AppointmentReservationManagementModel("3", "شيفروليه", "لانوس", "2010"),
    // AppointmentReservationManagementModel("4", "شيفروليه", "كروز", "2012"),
    // AppointmentReservationManagementModel("5", "شيفروليه", "لانوس", "2010"),
    // VehiclesModel("6", "شيفروليه", "كورولا", "2015", "أ ب هـ 2 3 4 6"),
    // VehiclesModel("7", "شيفروليه", "كورولا", "2015", "أ ب هـ 2 3 4 6"),
    // VehiclesModel("8", "شيفروليه", "كورولا", "2015", "أ ب هـ 2 3 4 6"),
    // VehiclesModel("9", "شيفروليه", "كورولا", "2015", "أ ب هـ 2 3 4 6"),
    // VehiclesModel("10", "شيفروليه", "كورولا", "2015", "أ ب هـ 2 3 4 6"),
    // VehiclesModel("11", "شيفروليه", "كورولا", "2015", "أ ب هـ 2 3 4 6"),
    // VehiclesModel("11", "شيفروليه", "كورولا", "2015", "أ ب هـ 2 3 4 6"),
  ];

  final cells1 = [
    AppointmentReservationManagementModel(
        "مركز الوكيل", "صيانة دورة التبريد", "09/03/2023", "8م"),
    AppointmentReservationManagementModel(
        "مركز الوكيل", "صيانة دورة التبريد", "09/03/2023", "8م"),
    // AppointmentReservationManagementModel("3", "شيفروليه", "لانوس", "2010"),
    // AppointmentReservationManagementModel("4", "شيفروليه", "كروز", "2012"),
    // AppointmentReservationManagementModel("5", "شيفروليه", "لانوس", "2010"),
    // VehiclesModel("6", "شيفروليه", "كورولا", "2015", "أ ب هـ 2 3 4 6"),
    // VehiclesModel("7", "شيفروليه", "كورولا", "2015", "أ ب هـ 2 3 4 6"),
    // VehiclesModel("8", "شيفروليه", "كورولا", "2015", "أ ب هـ 2 3 4 6"),
    // VehiclesModel("9", "شيفروليه", "كورولا", "2015", "أ ب هـ 2 3 4 6"),
    // VehiclesModel("10", "شيفروليه", "كورولا", "2015", "أ ب هـ 2 3 4 6"),
    // VehiclesModel("11", "شيفروليه", "كورولا", "2015", "أ ب هـ 2 3 4 6"),
    // VehiclesModel("11", "شيفروليه", "كورولا", "2015", "أ ب هـ 2 3 4 6"),
  ];

  int index = 0;

  bool click = true;

  late final widgets = [
    serviceAppointmentManagement(),
    productsReservationManagement(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: preferredSize,
          child: const CustomAppBar(text: 'الموعد')),
      body: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: Padding(
          padding: EdgeInsets.all(10.0.r),
          child: Column(
            //  crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: 20.h,
              ),
              // ElevatedButton(onPressed: (){},
              //   style:ButtonStyle(
              //       backgroundColor: MaterialStateProperty.all(AppColors.primaryColor)
              //   ) , child: const Text(
              //   "اضافة مركبة",
              //   style: TextStyle(
              //       color: Colors.black
              //   ),
              // ),
              // ),
              // SizedBox(
              //   height: 10.h,
              // ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 40.h,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: click
                                  ? AppColors.primaryColor
                                  : AppColors.tertiary,
                              padding: EdgeInsets.zero),
                          onPressed: () {
                            // navigateTo(context, const MaintenanceServiceDetails());
                            setState(() {
                              index = 0;
                              click = true;
                            });
                          },
                          child: Text(
                            "إدارة مواعيد الخدمات",
                            style: TextStyle(
                                fontSize: 10.sp, color: AppColors.secondColor),
                          )),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 40.h,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: click
                                  ? AppColors.tertiary
                                  : AppColors.primaryColor,
                              padding: EdgeInsets.zero),
                          onPressed: () {
                            setState(() {
                              index = 1;
                              click = false;
                            });
                          },
                          child: Text(
                            "إدارة حجز المنتجات",
                            style: TextStyle(
                                fontSize: 10.sp, color: AppColors.secondColor),
                          )),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              FittedBox(child: widgets[index])
              // DataTable(
              //   columnSpacing: 25,
              //   headingRowColor: MaterialStateProperty.all(Colors.black),
              //   columns: [
              //     DataColumn(
              //         label: Text(columns[0],
              //             style: TextStyle(color: AppColors.tertiary))),
              //     DataColumn(
              //         label: Text(columns[1],
              //             style: TextStyle(color: AppColors.tertiary))),
              //     DataColumn(
              //         label: Text(columns[2],
              //             style: TextStyle(color: AppColors.tertiary))),
              //     DataColumn(
              //         label: Text(columns[3],
              //             style: TextStyle(color: AppColors.tertiary))),
              //   ],
              //   rows: cells
              //       .map(
              //         ((element) => DataRow(
              //               color: MaterialStateProperty.all(
              //                   HexColor("#FFCF49").withOpacity(0.27)),
              //               cells: [
              //                 DataCell(Text(element.vendor)),
              //                 DataCell(Text(element.operation)),
              //                 DataCell(Text(element.date)),
              //                 DataCell(Row(
              //                   children: [
              //                     Text(element.time),
              //                     SizedBox(
              //                       width: 20.w,
              //                     ),
              //                     IconButton(
              //                         color: Colors.green,
              //                         onPressed: () {},
              //                         icon: const Icon(Icons.edit)),
              //                     SizedBox(
              //                       width: 10.w,
              //                     ),
              //                     IconButton(
              //                         color: Colors.red,
              //                         onPressed: () {},
              //                         icon: const Icon(Icons.delete))
              //                   ],
              //                 )),
              //                 //   DataCell(IconButton(onPressed: (){}, icon: const Icon(Icons.edit))),
              //               ],
              //             )),
              //       )
              //       .toList(),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget serviceAppointmentManagement() {
    return DataTable(
      columnSpacing: 25,
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
                    //   DataCell(IconButton(onPressed: (){}, icon: const Icon(Icons.edit))),
                  ],
                )),
          ).
          toList(),
    );
  }

  Widget productsReservationManagement() {
    return DataTable(
      columnSpacing: 25,
      headingRowColor: MaterialStateProperty.all(Colors.black),
      columns: [
        DataColumn(
            label:
                Text(columns2[0], style: const TextStyle(color: AppColors.tertiary))),
        DataColumn(
            label:
                Text(columns2[1], style: const TextStyle(color: AppColors.tertiary))),
        DataColumn(
            label:
                Text(columns2[2], style: const TextStyle(color: AppColors.tertiary))),
        DataColumn(
            label:
                Text(columns2[3], style: const TextStyle(color: AppColors.tertiary))),
      ],
      rows: cells2
          .map(
            ((element) => DataRow(
                  color: MaterialStateProperty.all(
                      AppColors.primaryColor.withOpacity(0.27)),
                  cells: [
                    DataCell(Text(element.vendor)),
                    DataCell(Text(element.operation)),
                    DataCell(Text(element.date)),
                    DataCell(Row(
                      children: [
                        Text(element.time),
                        SizedBox(
                          width: 20.w,
                        ),
                        IconButton(
                            color: Colors.green,
                            onPressed: () {},
                            icon: const Icon(Icons.edit)),
                        SizedBox(
                          width: 10.w,
                        ),
                        IconButton(
                            color: Colors.red,
                            onPressed: () {},
                            icon: const Icon(Icons.delete))
                      ],
                    )),
                    //   DataCell(IconButton(onPressed: (){}, icon: const Icon(Icons.edit))),
                  ],
                )),
          )
          .toList(),
    );
  }
}
