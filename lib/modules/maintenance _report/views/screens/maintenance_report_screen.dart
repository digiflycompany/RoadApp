import 'package:eva_icons_flutter/eva_icons_flutter.dart' as evaicons;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp2/modules/maintenance%20_report/cubit/cubit.dart';
import 'package:roadapp2/modules/maintenance%20_report/cubit/states.dart';
import 'package:roadapp2/modules/maintenance%20_report/views/widgets/maintenance_report_item.dart';
import 'package:roadapp2/shared/widgets/custom_alert_dialog.dart';
import 'package:roadapp2/shared/widgets/custom_button.dart';

import '../../../../shared/resources/colors.dart';
import '../../../../shared/widgets/custom_appbar.dart';
import '../../../../shared/widgets/custom_text_field.dart';

class MaintenanceReportScreen extends StatelessWidget {
  const MaintenanceReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MaintenanceReportCubit>(
      create: (BuildContext context) => MaintenanceReportCubit(),
      child: BlocConsumer<MaintenanceReportCubit, MaintenanceReportStates>(
        listener: (BuildContext context, MaintenanceReportStates state) {},
        builder: (BuildContext context, MaintenanceReportStates state) {
          var cubit = MaintenanceReportCubit.get(context);
          return Scaffold(
            appBar: PreferredSize(
                preferredSize: preferredSize,
                child: const CustomAppBar(text: 'تقارير الصيانة')),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 230.w,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.black,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("1",
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: AppColors.tertiary)),
                            SizedBox(width: 10.w),
                            Text("تويوتا",
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: AppColors.tertiary)),
                            SizedBox(width: 10.w),
                            Text("كورولا",
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: AppColors.tertiary)),
                            SizedBox(width: 10.w),
                            Text("2015",
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: AppColors.tertiary)),
                            SizedBox(width: 10.w),
                            Text("أ ب هـ ",
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: AppColors.tertiary)),
                            Text("2 3 4 6",
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: AppColors.tertiary)),
                          ],
                        ),
                      ),
                      //SizedBox(width: 8.w),
                      Container(
                          height: 40.h,
                          width: 35.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColors.primaryColor,
                          ),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              showCustomAlertDialog(
                                  context: context,
                                  title: "إضافة تقرير",
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          CustomTextField(
                                            fillColor: AppColors.whiteColor2,
                                            hintText: "اسم المركز",
                                            controller: TextEditingController(),
                                            width: 100.w,
                                          ),
                                          SizedBox(width: 10.w),
                                          CustomTextField(
                                              fillColor: AppColors.whiteColor2,
                                              hintText: "رقم الهاتف",
                                              controller:
                                                  TextEditingController(),
                                              width: 100.w),
                                        ],
                                      ),
                                      SizedBox(height: 10.h),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          CustomTextField(
                                            fillColor: AppColors.whiteColor2,
                                            hintText: "نوع الخدمة",
                                            controller: TextEditingController(),
                                            width: 100.w,
                                          ),
                                          SizedBox(width: 10.w),
                                          CustomTextField(
                                              fillColor: AppColors.whiteColor2,
                                              hintText: "السعر",
                                              controller:
                                                  TextEditingController(),
                                              width: 100.w),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            CustomTextField(
                                              fillColor: AppColors.whiteColor2,
                                              hintText: "نوع المنتج",
                                              controller:
                                                  TextEditingController(),
                                              width: 100.w,
                                            ),
                                            SizedBox(width: 10.w),
                                            CustomTextField(
                                                fillColor:
                                                    AppColors.whiteColor2,
                                                hintText: "السعر",
                                                controller:
                                                    TextEditingController(),
                                                width: 100.w),
                                          ],
                                        ),
                                      ),
                                      CustomElevatedButton(
                                          onTap: () {},
                                          widget: const Text('   أضف   '))
                                    ],
                                  ));
                            },
                          )),
                      SizedBox(width: 10.w,),
                      SizedBox(
                        width: 20.w,
                        child: IconButton(
                            onPressed: () {
                              showCustomAlertDialog(
                                  context: context,
                                  title: "مشاركة",
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const Icon(Icons.facebook,
                                                  color: Colors.blue),
                                              Text(
                                                'فيسبوك',
                                                style: TextStyle(fontSize: 10.sp),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const Icon(Icons.message_outlined,
                                                  color: Colors.yellow),
                                              Text(
                                                'الرسائل',
                                                style: TextStyle(fontSize: 10.sp),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20.h),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const Icon(Icons.download),
                                              Text(
                                                'تنزيل',
                                                style: TextStyle(fontSize: 10.sp),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const Icon(Icons.article,
                                                  color: Colors.red),
                                              Text(
                                                'PDF',
                                                style: TextStyle(fontSize: 10.sp),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 5),
                                        child: CheckboxListTile(
                                            value: cubit.selectPrice,
                                            onChanged: (val) {
                                              cubit.selectPrice = val!;
                                            },
                                            contentPadding: EdgeInsets.zero,
                                            visualDensity: VisualDensity.compact,
                                            title: Text(
                                              'ارسل بالسعر',
                                              style: TextStyle(fontSize: 10.sp),
                                            )),
                                      ),
                                      CustomElevatedButton(
                                          onTap: () {},
                                          widget: Text(
                                            'اختر',
                                            style: TextStyle(fontSize: 10.sp),
                                          )),
                                    ],
                                  ));
                            },
                            icon: const Icon(Icons.share),
                            constraints: const BoxConstraints(),
                            style: const ButtonStyle(
                                // iconSize: MaterialStateProperty.all(20.r),
                                )),
                      ),
                      SizedBox(width: 2.w,),
                      SizedBox(
                        width: 20.w,
                        child: IconButton(
                          onPressed: () {
                            showCustomAlertDialog(
                                context: context,
                                title: "الظهور حسب",
                                content:
                                    StatefulBuilder(builder: (ctxx, setState) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Flexible(
                                            child: CheckboxListTile(
                                                title: Text(
                                                  'التاريخ',
                                                  style:
                                                      TextStyle(fontSize: 10.sp),
                                                ),
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .leading,
                                                checkColor: Colors.black,
                                                fillColor:
                                                    const MaterialStatePropertyAll(
                                                        AppColors.primaryColor),
                                                contentPadding: EdgeInsets.zero,
                                                value: cubit.checkBoxDate,
                                                onChanged: (val) {
                                                  cubit.checkBoxDate = val!;
                                                  setState(() {});
                                                }),
                                          ),
                                          Flexible(
                                            child: CheckboxListTile(
                                                title: Text(
                                                  'الخدمة',
                                                  style:
                                                      TextStyle(fontSize: 10.sp),
                                                ),
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .leading,
                                                checkColor: Colors.black,
                                                fillColor:
                                                    const MaterialStatePropertyAll(
                                                        AppColors.primaryColor),
                                                contentPadding: EdgeInsets.zero,
                                                value: cubit.checkBoxService,
                                                onChanged: (val) {
                                                  cubit.checkBoxService = val!;
                                                  setState(() {});
                                                }),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Flexible(
                                            child: CheckboxListTile(
                                                title: Text(
                                                  'السعر',
                                                  style:
                                                      TextStyle(fontSize: 10.sp),
                                                ),
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .leading,
                                                checkColor: Colors.black,
                                                fillColor:
                                                    const MaterialStatePropertyAll(
                                                        AppColors.primaryColor),
                                                contentPadding: EdgeInsets.zero,
                                                value: cubit.checkBoxPrice,
                                                onChanged: (val) {
                                                  cubit.checkBoxPrice = val!;
                                                  setState(() {});
                                                }),
                                          ),
                                          Flexible(
                                            child: CheckboxListTile(
                                                title: Text(
                                                  'المركز',
                                                  style:
                                                      TextStyle(fontSize: 10.sp),
                                                ),
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .leading,
                                                checkColor: Colors.black,
                                                fillColor:
                                                    const MaterialStatePropertyAll(
                                                        AppColors.primaryColor),
                                                contentPadding: EdgeInsets.zero,
                                                value: cubit.checkBoxCenter,
                                                onChanged: (val) {
                                                  cubit.checkBoxCenter = val!;
                                                  setState(() {});
                                                }),
                                          ),
                                        ],
                                      ),
                                      Flexible(
                                        child: CheckboxListTile(
                                            title: Text(
                                              'المنتج',
                                              style: TextStyle(fontSize: 10.sp),
                                            ),
                                            controlAffinity:
                                                ListTileControlAffinity.leading,
                                            checkColor: Colors.black,
                                            fillColor:
                                                const MaterialStatePropertyAll(
                                                    AppColors.primaryColor),
                                            contentPadding: EdgeInsets.zero,
                                            value: cubit.checkBoxProduct,
                                            onChanged: (val) {
                                              cubit.checkBoxProduct = val!;
                                              setState(() {});
                                            }),
                                      ),
                                      CustomElevatedButton(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          widget: Text(
                                            'اختر',
                                            style: TextStyle(
                                              fontSize: 9.sp,
                                            ),
                                          ))
                                    ],
                                  );
                                }));
                          },
                          icon: const Icon(evaicons.EvaIcons.options2Outline),
                          constraints: const BoxConstraints(),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  const MaintenanceReportItem(),
                  SizedBox(
                    height: 25.h,
                  ),
                  const MaintenanceReportItem(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // Widget maintenanceReportItem() {
  //   return Card(
  //     child: Column(
  //       children: [
  //         Container(
  //           width: double.infinity,
  //           color: AppColors.primaryColor.withOpacity(0.27),
  //           child: const Column(
  //             children: [
  //               Text("مركز الخدمة:أحمد حسني"),
  //               Text("التاريخ : 15/9/2023"),
  //             ],
  //           ),
  //         ),
  //         Container(
  //           padding: EdgeInsets.symmetric(vertical: 20.h),
  //           child: const Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceAround,
  //             children: [
  //               Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Text("نوع الخدمة:غيار زيت"),
  //                   Text("نوع المنتج:زيت شيل 05W40"),
  //                 ],
  //               ),
  //               Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Text("السعر:50"),
  //                   Text("السعر:1200"),
  //                 ],
  //               ),
  //             ],
  //           ),
  //         ),
  //         Container(
  //           width: double.infinity,
  //           color: Colors.grey[300],
  //           height: 1,
  //         ),
  //         SizedBox(
  //           height: 15.h,
  //         ),
  //         const Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceAround,
  //           children: [
  //             Text("نوع المنتج:زيت شيل 05W40"),
  //             Text("الإجمالي:1250"),
  //           ],
  //         ),
  //         SizedBox(height: 15.h),
  //       ],
  //     ),
  //   );
  // }
}
