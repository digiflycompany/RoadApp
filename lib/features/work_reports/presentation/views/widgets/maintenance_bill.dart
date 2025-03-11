import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_loading_indicator.dart';
import 'package:roadapp/features/work_reports/presentation/cubit/work_reports_cubit.dart';

import '../../../../../core/helpers/navigation/navigation.dart';
import '../screens/show_details_work_report_screen.dart';

class MaintenanceBill extends StatelessWidget {
  const MaintenanceBill({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkReportsCubit, WorkReportsState>(
      builder: (context, state) {
        var cubit = WorkReportsCubit.get(context);
        int index = 1;

        var filteredWorkReports = cubit.workReports!
            .where((item) =>
        item.receiverId == cubit.maintenanceCenterProfileIdKey ||
            item.creatorId == cubit.maintenanceCenterProfileIdKey)
            .toList();

        double totalValue = filteredWorkReports.fold(0.0, (previousValue, item) {
          return previousValue + (double.tryParse(item.totalPrice.toString()) ?? 0.0);
        });

        return filteredWorkReports.isNotEmpty
            ? Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.r)),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.r),
                  topRight: Radius.circular(15.r),
                ),
                child: DataTable(
                  columnSpacing: 13.w,
                  headingRowHeight: 40.h,
                  dataRowMinHeight: 40.h,
                  headingRowColor: WidgetStateColor.resolveWith((states) => Colors.black),
                  headingTextStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  columns: [
                    DataColumn(label: Text('view', style: TextStyle(fontSize: 8.sp))),
                    DataColumn(label: Text(StringManager.s.tr(context), style: TextStyle(fontSize: 8.sp))),
                    DataColumn(label: Text(StringManager.bondDate.tr(context), style: TextStyle(fontSize: 8.sp))),
                    DataColumn(label: Text(StringManager.value.tr(context), style: TextStyle(fontSize: 8.sp))),
                    const DataColumn(label: SizedBox()), // زر الموافقة/الرفض
                  ],
                  rows: filteredWorkReports.map((item) {
                    return DataRow(
                      cells: [

                        DataCell(
                          IconButton(
                            icon: const Icon(Icons.visibility, ),
                            onPressed: () {
                              AppNavigation.navigate(
                                ShowDetailsWorkReportScreen(workReport: item),
                              );
                            },
                          ),
                        ),
                        DataCell(Text('${index++}', style: TextStyle(fontSize: 12.sp))),
                        DataCell(Text(cubit.extractDate(item.date ?? ''), style: TextStyle(fontSize: 12.sp))),
                        DataCell(Text(item.totalPrice.toString(), style: TextStyle(fontSize: 12.sp))),
                        DataCell(
                          item.status == 'PENDING' && item.creatorId != cubit.maintenanceCenterProfileIdKey
                              ? _buildApprovalActions(context, cubit, item)
                              : const SizedBox(),
                        ),
                      ],
                      color: WidgetStateProperty.resolveWith<Color?>((states) => Colors.amber[100]),
                      // onSelectChanged: (_) {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (_) => ShowDetailsWorkReportScreen(workReport: item),
                      //     ),
                      //   );
                      // },
                    );
                  }).toList(),
                ),
              ),
            ),
            state is FetchWorkReportsLoadingState
                ? const CustomLoadingIndicator(height: 300, width: double.infinity)
                : _buildTotalAmountFooter(context, totalValue),
          ],
        )
            : _buildNoWorkReportMessage();
      },
    );
  }

  Widget _buildApprovalActions(BuildContext context, WorkReportsCubit cubit, dynamic item) {
    return Row(
      children: [
        _buildActionIcon(
          isLoading: cubit.loadingItemsApprove[item.id] ?? false,
          onTap: () => cubit.approveWorkReport(id: item.id!),
          icon: Icons.check,
          color: AppColors.green,
        ),
        SizedBox(width: 10.w),
        _buildActionIcon(
          isLoading: cubit.loadingItemsDecline[item.id] ?? false,
          onTap: () => cubit.declineWorkReport(id: item.id!),
          icon: CupertinoIcons.xmark,
          color: AppColors.red,
        ),
      ],
    );
  }

  Widget _buildActionIcon({
    required bool isLoading,
    required VoidCallback onTap,
    required IconData icon,
    required Color color,
  }) {
    return isLoading
        ? const Center(child: SizedBox(height: 20, width: 20, child: CircularProgressIndicator()))
        : GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(50)),
        child: Icon(icon, color: Colors.white),
      ),
    );
  }

  Widget _buildTotalAmountFooter(BuildContext context, double totalValue) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.amber[100],
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(15.r)),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "${StringManager.total.tr(context)} : $totalValue",
        textAlign: TextAlign.right,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildNoWorkReportMessage() {
    return Center(
      child: Text(
        "No work report",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
      ),
    );
  }
}


// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:roadapp/core/Theming/colors.dart';
// import 'package:roadapp/core/helpers/localization/app_localization.dart';
// import 'package:roadapp/core/helpers/string_manager.dart';
// import 'package:roadapp/core/widgets/custom_loading_indicator.dart';
// import 'package:roadapp/features/work_reports/presentation/cubit/work_reports_cubit.dart';
//
// class MaintenanceBill extends StatelessWidget {
//   const MaintenanceBill({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<WorkReportsCubit, WorkReportsState>(
//       builder: (context, state) {
//         var cubit = WorkReportsCubit.get(context);
//         int index = 1;
//
//         var filteredWorkReports = cubit.workReports!
//             .where((item) =>
//                 item.receiverId == cubit.maintenanceCenterProfileIdKey ||
//                 item.creatorId == cubit.maintenanceCenterProfileIdKey)
//             .toList();
//
//         double totalValue =
//             filteredWorkReports.fold(0.0, (previousValue, item) {
//           return previousValue +
//               (double.tryParse(item.totalPrice.toString()) ?? 0.0);
//         });
//
//         return filteredWorkReports.isNotEmpty
//             ? Column(
//                 children: [
//                   Container(
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15.r)),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(15.r),
//                           topRight: Radius.circular(15.r)),
//                       child: DataTable(
//                         columnSpacing: 13.w,
//                         headingRowHeight: 40.h,
//                         dataRowMinHeight: 40.h,
//                         headingRowColor: WidgetStateColor.resolveWith(
//                             (states) => Colors.black),
//                         headingTextStyle: const TextStyle(
//                             color: Colors.white, fontWeight: FontWeight.bold),
//                         columns: [
//                           DataColumn(
//                             label: Text(StringManager.s.tr(context),
//                                 style: TextStyle(fontSize: 8.sp)),
//                           ),
//                           DataColumn(
//                             label: Text(StringManager.bondDate.tr(context),
//                                 style: TextStyle(fontSize: 8.sp)),
//                           ),
//                           DataColumn(
//                             label: Text(
//                               StringManager.value.tr(context),
//                               style: TextStyle(
//                                 fontSize: 8.sp,
//                               ),
//                             ),
//                           ),
//                           DataColumn(
//                             label: Text(
//                               '',
//                               style: TextStyle(
//                                 fontSize: 8.sp,
//                               ),
//                             ),
//                           ),
//                         ],
//                         rows: filteredWorkReports.map((item) {
//                           return DataRow(
//                             cells: [
//                               DataCell(Text('${index++}',
//                                   style: TextStyle(
//                                     fontSize: 12.sp,
//                                   ))),
//                               DataCell(Text(cubit.extractDate(item.date ?? ''),
//                                   style: TextStyle(fontSize: 12.sp))),
//                               DataCell(Text(item.totalPrice.toString(),
//                                   style: TextStyle(fontSize: 12.sp))),
//                               DataCell(item.status == 'PENDING' &&
//                                       item.creatorId !=
//                                           cubit.maintenanceCenterProfileIdKey
//                                   ? Row(
//                                       children: [
//                                         cubit.loadingItemsApprove[item.id] ==
//                                                 true
//                                             ? const Center(
//                                                 child: SizedBox(
//                                                   height: 20,
//                                                   width: 20,
//                                                   child:
//                                                       CircularProgressIndicator(),
//                                                 ),
//                                               )
//                                             : GestureDetector(
//                                                 onTap: () {
//                                                   cubit.approveWorkReport(
//                                                       id: item.id!);
//                                                 },
//                                                 child: Container(
//                                                   padding:
//                                                       const EdgeInsets.all(2),
//                                                   decoration: BoxDecoration(
//                                                     color: AppColors.green,
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             50),
//                                                   ),
//                                                   child:
//                                                       const Icon(Icons.check),
//                                                 ),
//                                               ),
//                                         SizedBox(
//                                           width: 10.w,
//                                         ),
//                                         cubit.loadingItemsDecline[item.id] ==
//                                                 true
//                                             ? const Center(
//                                                 child: SizedBox(
//                                                   height: 20,
//                                                   width: 20,
//                                                   child:
//                                                       CircularProgressIndicator(),
//                                                 ),
//                                               )
//                                             : GestureDetector(
//                                                 onTap: () {
//                                                   cubit.declineWorkReport(
//                                                       id: item.id!);
//                                                 },
//                                                 child: Container(
//                                                   padding:
//                                                       const EdgeInsets.all(2),
//                                                   decoration: BoxDecoration(
//                                                     color: AppColors.red,
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             50),
//                                                   ),
//                                                   child: const Icon(
//                                                     CupertinoIcons.xmark,
//                                                     color: Colors.white,
//                                                   ),
//                                                 ),
//                                               ),
//                                       ],
//                                     )
//                                   : const SizedBox()),
//                             ],
//                             color: WidgetStateProperty.resolveWith<Color?>(
//                               (Set<WidgetState> states) {
//                                 return Colors.amber[100];
//                               },
//                             ),
//
//                           );
//                         }).toList(),
//                       ),
//                     ),
//                   ),
//                   state is FetchWorkReportsLoadingState
//                       ? const CustomLoadingIndicator(
//                           height: 300,
//                           width: double.infinity,
//                         )
//                       : Container(
//                           width: double.infinity,
//                           decoration: BoxDecoration(
//                             color: Colors.amber[100],
//                             borderRadius: BorderRadius.only(
//                               bottomLeft: Radius.circular(15.r),
//                               bottomRight: Radius.circular(
//                                 15.r,
//                               ),
//                             ),
//                           ),
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(
//                             "${StringManager.total.tr(context)} : $totalValue",
//                             textAlign: TextAlign.right,
//                             style: const TextStyle(
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         )
//                 ],
//               )
//             : Center(
//                 child: Text(
//                   "No work report",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 20.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               );
//       },
//     );
//   }
// }
