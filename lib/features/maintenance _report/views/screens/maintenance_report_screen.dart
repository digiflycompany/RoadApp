import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/core/widgets/custom_loading_indicator.dart';
import 'package:roadapp/core/widgets/share_button.dart';
import 'package:roadapp/features/maintenance%20_report/cubit/cubit.dart';
import 'package:roadapp/features/maintenance%20_report/cubit/states.dart';
import 'package:roadapp/features/maintenance%20_report/data/repo/report_repo.dart';
import 'package:roadapp/features/maintenance%20_report/views/widgets/add_report_icon.dart';
import 'package:roadapp/features/maintenance%20_report/views/widgets/maintenance_report_item.dart';
import 'package:roadapp/features/vehicles/presentation/views/widgets/filter_button.dart';
import 'package:roadapp/features/vehicles/presentation/views/widgets/vehicle_data.dart';

import '../../../../core/dependency_injection/di.dart';

class MaintenanceReportScreen extends StatelessWidget {
  const MaintenanceReportScreen(
      {super.key,
      required this.nameCompany,
      required this.model,
      required this.plateNumber,
      required this.index,
      required this.nameCar,
      required this.parameterValue});

  final String index;
  final String nameCompany;
  final String nameCar;
  final String model;
  final String plateNumber;
  final String parameterValue;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MaintenanceReportCubit>(
      create: (BuildContext context) =>
          MaintenanceReportCubit(getIt.get<ReportRepo>())
            ..getReports(parameterValue),
      child: BlocConsumer<MaintenanceReportCubit, MaintenanceReportStates>(
        listener: (BuildContext context, MaintenanceReportStates state) {},
        builder: (BuildContext context, MaintenanceReportStates state) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: preferredSize,
              child: CustomAppBar(
                text: StringManager.maintenanceReports.tr(context),
              ),
            ),
            body: state is GetReportsLoadingState
                ? const CustomLoadingIndicator()
                : BlocBuilder<MaintenanceReportCubit, MaintenanceReportStates>(
                    builder: (context, state) {
                      var cubit = MaintenanceReportCubit.get(context);
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15.0.w, vertical: 20.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                VehicleData(
                                  index: index,
                                  nameCompany: nameCompany,
                                  nameCar: nameCar,
                                  model: model,
                                  plateNumber: plateNumber,
                                ),
                                const AddReportIcon(),
                                const ShareButton(),
                                const FilterButton(),
                              ],
                            ),
                          ),
                          SizedBox(height: 25.h),
                          Expanded(
                            child: ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (_, index) => MaintenanceReportItem(
                                name: cubit.reportsResponses!.data!
                                    .reports![index].maintenanceCenterId!.name ,
                                phoneNumber: cubit.reportsResponses!.data!
                                    .reports![index].maintenanceCenterId!.landline,
                                date: cubit
                                    .reportsResponses!.data!.reports![index].date
                                    .toString() ?? '',
                                servicesName: cubit.reportsResponses!.data!
                                    .reports![index].services![index].name ?? '',
                                servicesPrice: cubit.reportsResponses!.data!
                                    .reports![index].services![index].price
                                    .toString() ?? '',
                                productsName: cubit.reportsResponses!.data!
                                    .reports![index].products![index].name ?? '',
                                productsPrice: cubit.reportsResponses!.data!
                                    .reports![index].products![index].price
                                    .toString() ?? '',
                                totalPrice: cubit
                                    .reportsResponses!.data!.reports![index].price
                                    .toString() ?? '',
                                verified: false,
                              ),
                              separatorBuilder: (_, index) => const Gap(25),
                              itemCount: cubit
                                  .reportsResponses!.data!.reports!.length,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
          );
        },
      ),
    );
  }
}
