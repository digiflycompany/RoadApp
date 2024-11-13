import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_alert_dialog.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/core/widgets/custom_loading_indicator.dart';
import 'package:roadapp/features/maintenance%20_report/cubit/cubit.dart';
import 'package:roadapp/features/maintenance%20_report/cubit/states.dart';
import 'package:roadapp/features/maintenance%20_report/views/widgets/add_report_icon.dart';
import 'package:roadapp/features/maintenance%20_report/views/widgets/maintenance_report_item.dart';
import 'package:roadapp/features/vehicles/presentation/views/widgets/vehicle_data.dart';
import '../../../../core/dependency_injection/di.dart';
import '../../data/repo/report_repo.dart';
import '../widgets/share_pdf_and_excel_widget.dart';

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
    final ScrollController _scrollController = ScrollController();

    return BlocProvider<MaintenanceReportCubit>(
      create: (BuildContext context) =>
          MaintenanceReportCubit(getIt.get<ReportRepo>())
            ..getReports(vehicleId: parameterValue),
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
          _scrollController.addListener(() {
            if (_scrollController.position.pixels >=
                    _scrollController.position.maxScrollExtent &&
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
                ? const CustomLoadingIndicator()
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
                                vehicleId: parameterValue, cubit: cubit),
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
                        Expanded(
                          child: reports.isEmpty
                              ? Center(
                                  child: Text(
                                    "No reports available",
                                    style: TextStyle(fontSize: 16.sp),
                                  ),
                                )
                              : ListView.separated(
                                  controller: _scrollController,
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder: (_, index) {
                                    var report = reports[index];
                                    return MaintenanceReportItem(
                                      name: report.maintenanceCenterId?.name,
                                      phoneNumber:
                                          report.maintenanceCenterId?.landline,
                                      date: cubit
                                          .formatDate(report.date!.toString()),
                                      servicesName: report.services![0].name,
                                      servicesPrice:
                                          report.services![0].price?.toString(),
                                      productsName: report.products![0].name,
                                      productsPrice:
                                          report.products![0].price?.toString(),
                                      totalPrice: report.price?.toString(),
                                      verified: report.verified,
                                    );
                                  },
                                  separatorBuilder: (_, index) => const Gap(20),
                                  itemCount: reports.length,
                                ),
                        ),

                        SizedBox(
                          height: 5.w,
                        ),

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
