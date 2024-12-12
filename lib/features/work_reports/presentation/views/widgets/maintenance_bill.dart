import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_loading_indicator.dart';
import 'package:roadapp/features/work_reports/presentation/cubit/work_reports_cubit.dart';

class MaintenanceBill extends StatelessWidget {
  const MaintenanceBill({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkReportsCubit, WorkReportsState>(
      builder: (context, state) {
        var cubit = WorkReportsCubit.get(context);
        int index = 1;

        // تصفية البيانات حسب receiverId أو creatorId
        var filteredWorkReports = cubit.workReports!
            .where((item) =>
                item.receiverId == cubit.maintenanceCenterProfileIdKey ||
                item.creatorId == cubit.maintenanceCenterProfileIdKey)
            .toList();

        double totalValue =
            filteredWorkReports.fold(0.0, (previousValue, item) {
          return previousValue +
              (double.tryParse(item.totalPrice.toString()) ?? 0.0);
        });

        return filteredWorkReports.isNotEmpty
            ? Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.r),
                          topRight: Radius.circular(15.r)),
                      child: DataTable(
                        columnSpacing: 13.w,
                        headingRowHeight: 40.h,
                        dataRowMinHeight: 40.h,
                        headingRowColor: WidgetStateColor.resolveWith(
                            (states) => Colors.black),
                        headingTextStyle: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        columns: [
                          DataColumn(
                            label: Text(StringManager.s.tr(context),
                                style: TextStyle(fontSize: 8.sp)),
                          ),
                          DataColumn(
                            label: Text(StringManager.bondDate.tr(context),
                                style: TextStyle(fontSize: 8.sp)),
                          ),
                          DataColumn(
                            label: Text(
                              StringManager.value.tr(context),
                              style: TextStyle(
                                fontSize: 8.sp,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              '',
                              style: TextStyle(
                                fontSize: 8.sp,
                              ),
                            ),
                          ),
                        ],
                        rows: filteredWorkReports.map((item) {
                          return DataRow(
                            cells: [
                              DataCell(Text('${index++}',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                  ))),
                              DataCell(Text(cubit.extractDate(item.date ?? ''),
                                  style: TextStyle(fontSize: 12.sp))),
                              DataCell(Text(item.totalPrice.toString(),
                                  style: TextStyle(fontSize: 12.sp))),
                              DataCell(item.status == 'PENDING' &&
                                      item.creatorId !=
                                          cubit.maintenanceCenterProfileIdKey
                                  ? Row(
                                      children: [
                                        cubit.loadingItemsApprove[item.id] ==
                                                true
                                            ? const Center(
                                                child: SizedBox(
                                                  height: 20,
                                                  width: 20,
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                              )
                                            : GestureDetector(
                                                onTap: () {
                                                  cubit.approveWorkReport(
                                                      id: item.id!);
                                                },
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(2),
                                                  decoration: BoxDecoration(
                                                    color: AppColors.green,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                  ),
                                                  child:
                                                      const Icon(Icons.check),
                                                ),
                                              ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        cubit.loadingItemsDecline[item.id] ==
                                                true
                                            ? const Center(
                                                child: SizedBox(
                                                  height: 20,
                                                  width: 20,
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                              )
                                            : GestureDetector(
                                                onTap: () {
                                                  cubit.declineWorkReport(
                                                      id: item.id!);
                                                },
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(2),
                                                  decoration: BoxDecoration(
                                                    color: AppColors.red,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                  ),
                                                  child: const Icon(
                                                    CupertinoIcons.xmark,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                      ],
                                    )
                                  : const SizedBox()),
                            ],
                            color: WidgetStateProperty.resolveWith<Color?>(
                              (Set<WidgetState> states) {
                                return Colors.amber[100];
                              },
                            ),

                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  state is FetchWorkReportsLoadingState
                      ? const CustomLoadingIndicator(
                          height: 300,
                          width: double.infinity,
                        )
                      : Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.amber[100],
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15.r),
                              bottomRight: Radius.circular(
                                15.r,
                              ),
                            ),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${StringManager.total.tr(context)} : $totalValue",
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                ],
              )
            : Center(
                child: Text(
                  "Empty",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
      },
    );
  }
}
