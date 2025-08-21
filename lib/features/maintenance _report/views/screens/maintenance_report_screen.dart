import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/navigation/navigation.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_alert_dialog.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/core/widgets/custom_loading_indicator.dart';
import 'package:roadapp/features/maintenance%20_report/cubit/cubit.dart';
import 'package:roadapp/features/maintenance%20_report/cubit/states.dart';
import 'package:roadapp/features/maintenance%20_report/views/widgets/add_report_icon.dart';
import 'package:roadapp/features/maintenance%20_report/views/widgets/maintenance_report_item.dart';
import 'package:roadapp/features/vehicles/presentation/views/widgets/vehicle_data.dart';
import 'package:roadapp/features/work_reports/data/models/full_scan_report_response.dart';
import 'package:roadapp/features/work_reports/data/repo/work_reports_repo.dart';
import 'package:roadapp/features/work_reports/presentation/views/screens/showDetilesFullScanReport.dart';
import '../../../../core/dependency_injection/di.dart';
import '../../data/repo/report_repo.dart';
import '../widgets/share_pdf_and_excel_widget.dart';
import '../widgets/start_end_date.dart';

class MaintenanceReportScreen extends StatelessWidget {
  const MaintenanceReportScreen({
    super.key,
    required this.nameCompany,
    required this.model,
    required this.plateNumber,
    required this.index,
    required this.nameCar,
    required this.parameterValue,
  });

  final String index;
  final String nameCompany;
  final String nameCar;
  final String model;
  final String plateNumber;
  final String parameterValue;

  @override
  Widget build(BuildContext context) {
    // ScrollController for pagination
    final ScrollController scrollController = ScrollController();

    return BlocProvider<MaintenanceReportCubit>(
      create: (BuildContext context) => MaintenanceReportCubit(
        getIt.get<ReportRepo>(),
        getIt.get<WorkReportsRepo>(),
      )..getReports(vehicleId: parameterValue),
      child: BlocConsumer<MaintenanceReportCubit, MaintenanceReportStates>(
        listener: (BuildContext context, MaintenanceReportStates state) {
          if (state is ReportsLoadingMoreState) {
            // showDefaultLoadingIndicator(context);
          }
        },
        builder: (BuildContext context, MaintenanceReportStates state) {
          var cubit = MaintenanceReportCubit.get(context);
          var reports = cubit.reportsResponses?.data?.reports ?? [];

          // Add listener to scroll controller to detect when user reaches bottom
          scrollController.addListener(() {
            if (scrollController.position.pixels >=
                    scrollController.position.maxScrollExtent &&
                state is! ReportsLoadingMoreState) {
              // Trigger loading more reports
              cubit.loadMoreReports(parameterValue);
            }
          });

          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(60.h),
              child: CustomAppBar(
                text: StringManager.maintenanceReports.tr(context),
              ),
            ),
            body: state is GetReportsLoadingState
                ? const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: CustomLoadingIndicator(),
                  )
                : Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 15.0.w, vertical: 20.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            VehicleData(
                              index: index,
                              nameCompany: nameCompany,
                              nameCar: nameCar,
                              model: model,
                              plateNumber: plateNumber,
                            ),
                            AddReportIcon(
                                state: state,
                                vehicleId: parameterValue,
                                cubit: cubit),
                            IconButton(
                              icon: const Icon(Icons.share_outlined),
                              onPressed: () {
                                showCustomAlertDialog(
                                  context: context,
                                  title: StringManager.share.tr(context),
                                  content: SharePdfAndExcelWidget(
                                    cubit: cubit,
                                    reports: reports,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 25.h),
                        StartEndDate(
                          id: parameterValue,
                          plateNumber: plateNumber,
                        ),
                        SizedBox(
                          height: 10.w,
                        ),
                        const SelectReportType(),
                        if (cubit.selectedReportType == 1)
                          Expanded(
                            child: reports.isEmpty
                                ? Center(
                                    child: Text(
                                      "No reports available",
                                      style: TextStyle(fontSize: 16.sp),
                                    ),
                                  )
                                : ListView.separated(
                                    controller: scrollController,
                                    physics: const BouncingScrollPhysics(),
                                    itemBuilder: (_, index) {
                                      var report = reports[index];
                                      return MaintenanceReportItem(
                                        name: report.maintenanceCenterName,
                                        phoneNumber:
                                            report.maintenanceCenterLandLine,
                                        date: cubit.formatDate(
                                            report.date!.toString()),
                                        servicesName:
                                            (report.services?.isNotEmpty ??
                                                    false)
                                                ? report.services![0].name
                                                : null,
                                        servicesPrice:
                                            (report.services?.isNotEmpty ??
                                                    false)
                                                ? report.services![0].price
                                                    .toString()
                                                : null,
                                        productsName:
                                            (report.products?.isNotEmpty ??
                                                    false)
                                                ? report.products![0].name
                                                : null,
                                        productsPrice:
                                            (report.products?.isNotEmpty ??
                                                    false)
                                                ? report.products![0].price
                                                    .toString()
                                                : null,
                                        totalPrice: report.price?.toString(),
                                        verified: report.verified,
                                      );
                                    },
                                    separatorBuilder: (_, index) =>
                                        const Gap(20),
                                    itemCount: reports.length,
                                  ),
                          ),
                        if (cubit.selectedReportType == 2)
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SelectScanType(plateNumber: plateNumber),
                              state is FetchFullScanReportsLoadingState
                                  ? const CustomLoadingIndicator(
                                      height: 200,
                                      width: double.infinity,
                                    )
                                  : FullScanReportWidget(),
                            ],
                          )),
                        SizedBox(height: 5.w),
                        state is ReportsLoadingMoreState
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.yellowColor2,
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}

class SelectReportType extends StatelessWidget {
  const SelectReportType({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaintenanceReportCubit, MaintenanceReportStates>(
      builder: (context, state) {
        var cubit = MaintenanceReportCubit.get(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(StringManager.reportType.tr(context),
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            Row(
              // spacing: 4,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Radio(
                        value: 1,
                        groupValue: cubit.selectedReportType,
                        onChanged: (value) =>
                            cubit.changeReportTypeRadio(value ?? 1)),
                    Text(
                      StringManager.clientReports.tr(context),
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Radio(
                        value: 2,
                        groupValue: cubit.selectedReportType,
                        onChanged: (value) =>
                            cubit.changeReportTypeRadio(value ?? 2)),
                    Text(
                      StringManager.providerReports.tr(context),
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class SelectScanType extends StatelessWidget {
  const SelectScanType({super.key, required this.plateNumber});

  final String plateNumber;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaintenanceReportCubit, MaintenanceReportStates>(
      builder: (context, state) {
        var cubit = MaintenanceReportCubit.get(context);
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
                            cubit.changeFullRadio(value ?? 1, plateNumber)),
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
                            cubit.changeFullRadio(value ?? 2, plateNumber)),
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
                            cubit.changeFullRadio(value ?? 3, plateNumber)),
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

class FullScanReportWidget extends StatelessWidget {
  FullScanReportWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaintenanceReportCubit, MaintenanceReportStates>(
      builder: (context, state) {
        var cubit = MaintenanceReportCubit.get(context);
        List<FullScanReport> reports = cubit.servicesReports ?? [];

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
                        headingRowColor: WidgetStateColor.resolveWith(
                            (states) => Colors.black),
                        headingTextStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        columns: [
                          DataColumn(label: _buildTableHeader("View")),
                          DataColumn(
                              label: _buildTableHeader("Vehicle Number")),
                          DataColumn(label: _buildTableHeader("Price")),
                        ],
                        rows: reports.map((report) {
                          return DataRow(
                            color: WidgetStateProperty.resolveWith(
                                (states) => Colors.amber[100]),
                            cells: [
                              DataCell(
                                IconButton(
                                  icon: const Icon(
                                    Icons.visibility,
                                  ),
                                  onPressed: () {
                                    AppNavigation.navigate(
                                      ShowDetilesFullScanReport(
                                          reportContent: report.reportContent),
                                    );
                                  },
                                ),
                              ),
                              DataCell(Text(report.vehicleNumber ?? "N/A",
                                  style: _tableTextStyle)),
                              DataCell(Text(report.scanPrice.toString(),
                                  style: _tableTextStyle)),
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
      style: TextStyle(
          fontSize: 10.sp, fontWeight: FontWeight.bold, color: Colors.white),
    );
  }

  /// 🔹 **تخصيص تنسيق نص الجدول**
  final TextStyle _tableTextStyle = TextStyle(fontSize: 12.sp);
}
