import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/core/widgets/custom_data_table.dart';

import '../../../../../core/Theming/styles.dart';
import '../../../../../core/helpers/navigation/navigation.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';
import '../../../../maintenance _report/views/screens/maintenance_report_screen.dart';
import '../../../data/models/vehicles_response.dart';
import '../../cubit/vehicles_cubit.dart';
import '../../cubit/vehicles_state.dart';

class VehiclesScreenTwo extends StatefulWidget {
  const VehiclesScreenTwo({super.key});

  @override
  State<VehiclesScreenTwo> createState() => _VehiclesScreenTwoState();
}

class _VehiclesScreenTwoState extends State<VehiclesScreenTwo> {
  final TextEditingController company = TextEditingController();
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollListener);
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
    var cubit = context.read<VehiclesCubit>();
    cubit.fetchVehicles(page: cubit.vehiclesPage + 1, more: true);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    final columns = [
      StringManager.s.tr(context),
      StringManager.company.tr(context),
      StringManager.car.tr(context),
      StringManager.manufactureYear.tr(context),
      StringManager.licensePlateNumber.tr(context),
    ];
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: preferredSize,
          child:
              CustomAppBar(text: StringManager.maintenanceReports.tr(context))),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: 10.h),
              const Gap(20),
              BlocBuilder<VehiclesCubit, VehiclesState>(
                builder: (BuildContext context, VehiclesState state) {
                  var cubit = VehiclesCubit.get(context);
                  return (state is VehiclesSuccessState &&
                          state.vehicles != null &&
                          state.vehicles!.isNotEmpty)
                      ? CustomMultiRowsTable(
                          columns: columns,
                          rows: state.vehicles!.asMap().entries.map((entry) {
                            int index = entry.key;
                            Vehicle vehicle = entry.value;
                            return [
                              (index + 1).toString(),
                              vehicle.brandId?.name ?? '',
                              vehicle.model ?? '',
                              vehicle.manufacturingYear == null
                                  ? ''
                                  : vehicle.manufacturingYear.toString(),
                              vehicle.plateNumber ?? ''
                            ];
                          }).toList(),
                          icon: Icons.more_vert,
                          onIconPressed: (int index) {
                            AppNavigation.navigate(
                              MaintenanceReportScreen(
                                index: '${index + 1}',
                                nameCompany:
                                    cubit.vehicles![index].brandId?.name ?? '',
                                nameCar:
                                    cubit.vehicles![index].brandId?.nameAr ??
                                        '',
                                model: cubit.vehicles![index].model ?? '',
                                plateNumber:
                                    cubit.vehicles![index].plateNumber ?? '',
                                parameterValue: cubit.vehicles![index].id ?? '',
                              ),
                            );
                          })
                      : (state is VehiclesSuccessState &&
                              (state.vehicles == null ||
                                  state.vehicles!.isEmpty))
                          ? Center(
                              child: Text(StringManager
                                  .youDoNotHaveAnyVehiclesYet
                                  .tr(context)))
                          : state is VehiclesErrorState
                              ? Center(
                                  child: Text(state.error,
                                      style: Styles.textStyle16))
                              : state is FetchingVehiclesLoadingState
                                  ? CustomLoadingIndicator(height: height * .65)
                                  : Column(
                                      children: [
                                        cubit.vehicles == null
                                            ? Center(
                                                child: Text(
                                                    StringManager
                                                        .noInternetPleaseTryAgain,
                                                    style: Styles.textStyle16),
                                              )
                                            : CustomMultiRowsTable(
                                                columns: columns,
                                                rows: cubit.vehicles!
                                                    .asMap()
                                                    .entries
                                                    .map(
                                                  (entry) {
                                                    int index = entry.key;
                                                    Vehicle vehicle =
                                                        entry.value;
                                                    return [
                                                      (index + 1).toString(),
                                                      vehicle.brandId?.name ??
                                                          '',
                                                      vehicle.model ?? '',
                                                      (vehicle.manufacturingYear ??
                                                              0)
                                                          .toString(),
                                                      vehicle.plateNumber ?? ''
                                                    ];
                                                  },
                                                ).toList(),
                                                icon: Icons.more_vert,
                                                onIconPressed: (int index) {
                                                  AppNavigation.navigate(
                                                    MaintenanceReportScreen(
                                                      index: '${index + 1}',
                                                      nameCompany: cubit
                                                              .vehicles![index]
                                                              .brandId
                                                              ?.name ??
                                                          '',
                                                      nameCar: cubit
                                                              .vehicles![index]
                                                              .brandId
                                                              ?.nameAr ??
                                                          '',
                                                      model: cubit
                                                              .vehicles![index]
                                                              .model ??
                                                          '',
                                                      plateNumber: cubit
                                                              .vehicles![index]
                                                              .plateNumber ??
                                                          '',
                                                      parameterValue: cubit
                                                              .vehicles![index]
                                                              .id ??
                                                          '',
                                                      // vehicleId: 'cubit.vehicles[index].i',
                                                    ),
                                                  );
                                                },
                                              ),
                                        if (state is MoreLoadingState)
                                          CustomLoadingIndicator(height: 40.h)
                                      ],
                                    );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
