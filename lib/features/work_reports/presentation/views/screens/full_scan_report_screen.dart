import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/navigation/navigation.dart';
import 'package:roadapp/features/work_reports/presentation/cubit/work_reports_cubit.dart';
import 'package:roadapp/core/widgets/custom_loading_indicator.dart';
import 'package:roadapp/features/work_reports/presentation/views/screens/showDetilesFullScanReport.dart';

import '../../../../../core/helpers/string_manager.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../data/models/full_scan_report_response.dart';
import '../widgets/date_widget.dart';

class FullScanReportsScreen extends StatefulWidget {
  const FullScanReportsScreen({super.key});

  @override
  _FullScanReportsScreenState createState() => _FullScanReportsScreenState();
}

class _FullScanReportsScreenState extends State<FullScanReportsScreen> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollListener);
    fetchData();
  }

  void _scrollListener() {
    if (scrollController.position.atEdge) {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        _loadMoreData();
      }
    }
  }

  void _loadMoreData() {
    var cubit = context.read<WorkReportsCubit>();
    cubit.fetchFullScanReport(page: cubit.servicesReportsPage + 1, more: true);
  }

  void fetchData() {
    var cubit = context.read<WorkReportsCubit>();
    cubit.fetchFullScanReport();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WorkReportsCubit, WorkReportsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: PreferredSize(
              preferredSize: preferredSize,
              child:
                  CustomAppBar(text: StringManager.servicesReport.tr(context))),
          body: state is FetchFullScanReportsErrorState
              ? const Center(
                  child: Text('حدث خطأ أثناء تحميل البيانات.'),
                )
              : SingleChildScrollView(
                  controller: scrollController,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      children: [
                        SizedBox(height: 20.h),

                        // Adding date selection widget
                        const ProcessDateStartAndEnd(),
                        SizedBox(height: 20.h),

                        // Adding scan type selection widget
                        const SelectScanType(),
                        SizedBox(height: 20.h),

                        // Showing Full Scan Reports
                        state is FetchFullScanReportsLoadingState
                            ? const CustomLoadingIndicator(
                                height: 300,
                                width: double.infinity,
                              )
                            :  FullScanReportWidget(),
                        // Custom widget for displaying reports

                        SizedBox(height: 20.h),
                        state is FetchFullScanReportsLoadingMoreState
                            ? const CustomLoadingIndicator(
                                width: double.infinity,
                                height: 60,
                              )
                            : const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}

class FullScanReportWidget extends StatelessWidget {
   FullScanReportWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkReportsCubit, WorkReportsState>(
      builder: (context, state) {
        var cubit = WorkReportsCubit.get(context);
        List<Report> reports = cubit.servicesReports ?? [];

        return reports.isNotEmpty
            ? Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: DataTable(
                  columnSpacing: 15.w,
                  headingRowHeight: 40.h,
                  dataRowMinHeight: 40.h,
                  headingRowColor: WidgetStateColor.resolveWith((states) => Colors.black),
                  headingTextStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  columns: [
                    DataColumn(label: _buildTableHeader("View")),
                    DataColumn(label: _buildTableHeader("Vehicle Number")),
                    DataColumn(label: _buildTableHeader("Price")),
                  ],
                  rows: reports.map((report) {
                    return DataRow(
                      color: WidgetStateProperty.resolveWith((states) => Colors.amber[100]),
                      cells: [
                        DataCell(
                          IconButton(
                            icon: const Icon(Icons.visibility, ),
                            onPressed: () {
                              AppNavigation.navigate(
                                ShowDetilesFullScanReport(reportContent: report.reportContent),
                              );
                            },
                          ),
                        ),
                        DataCell(Text(report.vehicleNumber ?? "N/A", style: _tableTextStyle)),
                        DataCell(Text(report.scanPrice.toString(), style: _tableTextStyle)),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        )
            : const Center(
          child: Text(
            "No Reports Available",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        );
      },
    );
  }

  /// 🔹 **تخصيص تنسيق عناوين الجدول**
  Widget _buildTableHeader(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold, color: Colors.white),
    );
  }

  /// 🔹 **تخصيص تنسيق نص الجدول**
  final TextStyle _tableTextStyle = TextStyle(fontSize: 12.sp);
}

class SelectScanType extends StatelessWidget {
  const SelectScanType({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkReportsCubit, WorkReportsState>(
      builder: (context, state) {
        var cubit = WorkReportsCubit.get(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(StringManager.examinationType.tr(context),
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            Wrap(
              spacing: 4,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Radio(
                        value: 1,
                        groupValue: cubit.selectedFullScanRadio,
                        onChanged: (value) =>
                            cubit.changeFullRadio(value ?? 1)),
                    Text(
                      StringManager.malfunctionInspectionReport.tr(context),
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Radio(
                        value: 2,
                        groupValue: cubit.selectedFullScanRadio,
                        onChanged: (value) =>
                            cubit.changeFullRadio(value ?? 2)),
                    Text(
                      StringManager.maintenanceReports.tr(context),
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Radio(
                        value: 3,
                        groupValue: cubit.selectedFullScanRadio,
                        onChanged: (value) =>
                            cubit.changeFullRadio(value ?? 3)),
                    Text(
                      StringManager.carBuyingSellingReport.tr(context),
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        );
      },
    );
  }
}

class ProcessDateStartAndEnd extends StatelessWidget {
  const ProcessDateStartAndEnd({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkReportsCubit, WorkReportsState>(
      builder: (context, state) {
        var cubit = WorkReportsCubit.get(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              StringManager.processDate.tr(context),
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                Text('${StringManager.from.tr(context)}: '),
                SizedBox(width: 5.w),
                SelectDateWidget(
                  title:
                      "${cubit.startDateTimeFullScan.year} / ${cubit.startDateTimeFullScan.month} / ${cubit.startDateTimeFullScan.day}",
                  onTap: () => cubit.pickupStartDateFullScan(context),
                ),
                SizedBox(width: 16.w),
                Text('${StringManager.to.tr(context)}: '),
                SizedBox(width: 5.w),
                SelectDateWidget(
                  title:
                      "${cubit.endDateTimeFullScan.year} / ${cubit.endDateTimeFullScan.month} / ${cubit.endDateTimeFullScan.day}",
                  onTap: () => cubit.pickupEndDateFullScan(context),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
