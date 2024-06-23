import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/clients/clients_model.dart';
import '../../../shared/resources/colors.dart';
import '../../../shared/widgets/custom_appbar.dart';

class ClientsScreen extends StatelessWidget {
  final columns = [
    "م",
    "اسم العميل",
    "نوع",
    "مهنة",
    "رقم الهاتف",
    "عدد المركبات"
  ];
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
                      DataColumn(
                          label: Text(columns[5],
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
                            DataCell(
                                Center(child: Text(element.numOfVehicles))),
                            DataCell(InkWell(
                                // onTap: () {
                                //   showCustomAlertDialog(
                                //       context: context,
                                //       title: 'تفاصيل المركبة',
                                //       content: SizedBox(
                                //         width: double.infinity,
                                //         child: Padding(
                                //           padding: const EdgeInsets.symmetric(
                                //               vertical: 5),
                                //           child: Wrap(
                                //             runSpacing: 7,
                                //             children: [
                                //               Row(
                                //                 mainAxisSize: MainAxisSize.min,
                                //                 children: [
                                //                   Text('الشركة: ',
                                //                       style: TextStyle(
                                //                           fontSize: 9.sp)),
                                //                   Text('تويوتا ',
                                //                       style: TextStyle(
                                //                           fontSize: 9.sp)),
                                //                 ],
                                //               ),
                                //               Padding(
                                //                 padding: EdgeInsets.symmetric(
                                //                     horizontal: 25.w),
                                //                 child: Row(
                                //                   mainAxisSize:
                                //                       MainAxisSize.min,
                                //                   children: [
                                //                     Text('السيارة: ',
                                //                         style: TextStyle(
                                //                             fontSize: 9.sp)),
                                //                     Text('كورونا ',
                                //                         style: TextStyle(
                                //                             fontSize: 9.sp)),
                                //                   ],
                                //                 ),
                                //               ),
                                //               Row(
                                //                 mainAxisSize: MainAxisSize.min,
                                //                 children: [
                                //                   Text('الموديل: ',
                                //                       style: TextStyle(
                                //                           fontSize: 9.sp)),
                                //                   Text('2015 ',
                                //                       style: TextStyle(
                                //                           fontSize: 9.sp)),
                                //                 ],
                                //               ),
                                //               Row(
                                //                 mainAxisSize: MainAxisSize.min,
                                //                 children: [
                                //                   Text('رقم اللوحة: ',
                                //                       style: TextStyle(
                                //                           fontSize: 9.sp)),
                                //                   Text('أ ب ت 1 2 3  ',
                                //                       style: TextStyle(
                                //                           fontSize: 9.sp)),
                                //                 ],
                                //               ),
                                //               SizedBox(width: 64.w),
                                //               Row(
                                //                 mainAxisSize: MainAxisSize.min,
                                //                 children: [
                                //                   Text('نوع الفتيس: ',
                                //                       style: TextStyle(
                                //                           fontSize: 9.sp)),
                                //                   Text(' ',
                                //                       style: TextStyle(
                                //                           fontSize: 9.sp)),
                                //                 ],
                                //               ),
                                //               Row(
                                //                 mainAxisSize: MainAxisSize.min,
                                //                 children: [
                                //                   Text('رقم الشاسية: ',
                                //                       style: TextStyle(
                                //                           fontSize: 9.sp)),
                                //                   Text('55 ',
                                //                       style: TextStyle(
                                //                           fontSize: 9.sp)),
                                //                 ],
                                //               ),
                                //               Padding(
                                //                 padding: EdgeInsets.symmetric(
                                //                     horizontal: 15.w),
                                //                 child: Row(
                                //                   mainAxisSize:
                                //                       MainAxisSize.min,
                                //                   children: [
                                //                     Text('سعة التانك: ',
                                //                         style: TextStyle(
                                //                             fontSize: 9.sp)),
                                //                     Text(' ',
                                //                         style: TextStyle(
                                //                             fontSize: 9.sp)),
                                //                   ],
                                //                 ),
                                //               ),
                                //               Row(
                                //                 mainAxisSize: MainAxisSize.min,
                                //                 children: [
                                //                   Text('رقم الماتور: ',
                                //                       style: TextStyle(
                                //                           fontSize: 9.sp)),
                                //                   Text('1848 ',
                                //                       style: TextStyle(
                                //                           fontSize: 9.sp)),
                                //                 ],
                                //               ),
                                //               Row(
                                //                 mainAxisSize: MainAxisSize.min,
                                //                 children: [
                                //                   Text('عداد ال CC: ',
                                //                       style: TextStyle(
                                //                           fontSize: 9.sp)),
                                //                   Text('5KM ',
                                //                       style: TextStyle(
                                //                           fontSize: 9.sp)),
                                //                 ],
                                //               ),
                                //             ],
                                //           ),
                                //         ),
                                //       ));
                                // },
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
