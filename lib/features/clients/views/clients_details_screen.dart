import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/core/utils/app_assets.dart';
import 'package:roadapp/features/clients/views/widgets/details_options_row.dart';
import '../data/models/clients_model.dart';

class ClientsDetailsScreen extends StatelessWidget {
  final cells = [
    ClientsModel("1", "صني", "2014", "مانوال", "أ ب هـ 2 3 4 6", "1"),
    ClientsModel("2", "افيو", "2010", "مانوال", "ن و ص 8 6 4 9", "2"),
    ClientsModel("3", "باندينو", "2015", "اوتوماتيك", "س و ق 1 5 7 4", "1"),
  ];

  final TextEditingController company = TextEditingController();

  ClientsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final columns = [
      StringManager.s.tr(context),
      StringManager.car.tr(context),
      StringManager.launchYear.tr(context),
      StringManager.transmissionType.tr(context),
      StringManager.licensePlateNumber.tr(context),
    ];
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: preferredSize,
          child: CustomAppBar(text: StringManager.identifiedCustomers.tr(context))),
      body: Column(
        children: [
          SizedBox(
            height: 10.h
          ),
          const DetailsOptionsRow(),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 7.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black,

                  ),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("جاد مرسي",style: TextStyle(
                        color: Colors.white,
                        fontSize: 11.sp
                      )),
                      Text("ذكر",style: TextStyle(
                          color: Colors.white,
                          fontSize: 11.sp
                      )),
                      Text("ظابط",style: TextStyle(
                          color: Colors.white,
                          fontSize: 11.sp
                      )),
                      Text("0123456789",style: TextStyle(
                          color: Colors.white,
                          fontSize: 11.sp
                      )),
                      Text("3",style: TextStyle(
                          color: Colors.white,
                          fontSize: 11.sp
                      )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
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
                              label: Center(
                            child: Text(columns[2],
                                textAlign: TextAlign.center,
                                style: const TextStyle(color: AppColors.tertiary)),
                          )),
                          DataColumn(
                              label: Center(
                            child: Text(columns[3],
                                style: const TextStyle(color: AppColors.tertiary)),
                          )),
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
                                const DataCell(
                                    InkWell(
                                    child: Icon(Icons.more_vert_outlined))),
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
        ],
      ),
    );
  }
}
