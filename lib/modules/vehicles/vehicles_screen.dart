import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp2/models/vehicles/vehicles_screen.dart';
import 'package:roadapp2/shared/widgets/custom_alert_dialog.dart';
import 'package:roadapp2/shared/widgets/custom_button.dart';
import 'package:roadapp2/shared/widgets/custom_elevated_button_two.dart';
import 'package:roadapp2/shared/widgets/custom_text_field.dart';
import '../../shared/resources/colors.dart';
import '../../shared/widgets/custom_appbar.dart';

class VehiclesScreen extends StatelessWidget {

  final columns = ["م", "الشركة", "السيارة", "الموديل", "رقم اللوحة"];
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
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: preferredSize,
          child: const CustomAppBar(text: 'المركبات المعرفة')),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CustomElevatedButtonTwo(
                onTap: () {
                  showCustomAlertDialog(
                      context: context,
                      title: 'إضافة مركبة',
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomTextField(                              fillColor: AppColors.whiteColor2,

                                hintText: "الشركة*",
                                controller: TextEditingController(),
                                width: 100.w,
                              ),
                              SizedBox(width: 10.w),
                              CustomTextField(                              fillColor: AppColors.whiteColor2,

                                  hintText: "السيارة*",
                                  controller: TextEditingController(),
                                  width: 100.w),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomTextField(                              fillColor: AppColors.whiteColor2,

                                hintText: "الموديل*",
                                controller: TextEditingController(),
                                width: 100.w,
                              ),
                              SizedBox(width: 10.w),
                              CustomTextField(                              fillColor: AppColors.whiteColor2,

                                  hintText: "رقم اللوحة*",
                                  controller: TextEditingController(),
                                  width: 100.w),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CustomTextField(                              fillColor: AppColors.whiteColor2,

                                  hintText: "نوع الفتيس*",
                                  controller: TextEditingController(),
                                  width: 100.w,
                                ),
                                SizedBox(width: 10.w),
                                CustomTextField(                              fillColor: AppColors.whiteColor2,

                                    hintText: "عداد ال CC*",
                                    controller: TextEditingController(),
                                    width: 100.w),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomTextField(                              fillColor: AppColors.whiteColor2,

                                hintText: "رقم الماتور*",
                                controller: TextEditingController(),
                                width: 100.w,
                              ),
                              SizedBox(width: 10.w),
                              CustomTextField(                              fillColor: AppColors.whiteColor2,

                                  hintText: "رقم الشاسية*",
                                  controller: TextEditingController(),
                                  width: 100.w),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.h, bottom: 15.h),
                            child: CustomTextField(
                              fillColor: AppColors.whiteColor2,
                                hintText: "سعة التانك*",
                                controller: TextEditingController(),
                                width: 200.w),
                          ),
                          CustomElevatedButton(
                              onTap: () {}, widget: const Text('   أضف   '))
                        ],
                      ));
                },
                widget: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.add),
                    Text(
                      'إضافة مركبة',
                      style: TextStyle(fontSize: 9.sp),
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
                              style: const TextStyle(color: AppColors.tertiary))),
                      DataColumn(
                          label: Text(columns[2],
                              style: const TextStyle(color: AppColors.tertiary))),
                      DataColumn(
                          label: Text(columns[3],
                              style: const TextStyle(color: AppColors.tertiary))),
                      DataColumn(
                          label: Text(columns[4],
                              style: const TextStyle(color: AppColors.tertiary))),
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
                                  showCustomAlertDialog(
                                      context: context,
                                      title: 'تفاصيل المركبة',
                                      content: SizedBox(
                                        width: double.infinity,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(vertical:5),
                                          child: Wrap(
                                            runSpacing: 7
                                            ,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text('الشركة: ',
                                                      style: TextStyle(
                                                          fontSize: 9.sp)),
                                                  Text('تويوتا ',
                                                      style: TextStyle(
                                                          fontSize: 9.sp)),
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 25.w),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Text('السيارة: ',
                                                        style: TextStyle(
                                                            fontSize: 9.sp)),
                                                    Text('كورونا ',
                                                        style: TextStyle(
                                                            fontSize: 9.sp)),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text('الموديل: ',
                                                      style: TextStyle(
                                                          fontSize: 9.sp)),
                                                  Text('2015 ',
                                                      style: TextStyle(
                                                          fontSize: 9.sp)),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text('رقم اللوحة: ',
                                                      style: TextStyle(
                                                          fontSize: 9.sp)),
                                                  Text('أ ب ت 1 2 3  ',
                                                      style: TextStyle(
                                                          fontSize: 9.sp)),
                                                ],
                                              ),
                                              SizedBox(width: 64.w),
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text('نوع الفتيس: ',
                                                      style: TextStyle(
                                                          fontSize: 9.sp)),
                                                  Text(' ',
                                                      style: TextStyle(
                                                          fontSize: 9.sp)),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text('رقم الشاسية: ',
                                                      style: TextStyle(
                                                          fontSize: 9.sp)),
                                                  Text('55 ',
                                                      style: TextStyle(
                                                          fontSize: 9.sp)),
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 15.w),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Text('سعة التانك: ',
                                                        style: TextStyle(
                                                            fontSize: 9.sp)),
                                                    Text(' ',
                                                        style: TextStyle(
                                                            fontSize: 9.sp)),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text('رقم الماتور: ',
                                                      style: TextStyle(
                                                          fontSize: 9.sp)),
                                                  Text('1848 ',
                                                      style: TextStyle(
                                                          fontSize: 9.sp)),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text('عداد ال CC: ',
                                                      style: TextStyle(
                                                          fontSize: 9.sp)),
                                                  Text('5KM ',
                                                      style: TextStyle(
                                                          fontSize: 9.sp)),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ));
                                },
                                child:  const Icon(Icons.more_vert_outlined))),
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


