import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:roadapp/core/Theming/styles.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_alert_dialog.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/core/widgets/custom_data_table.dart';
import 'package:roadapp/core/widgets/custom_loading_indicator.dart';
import 'package:roadapp/features/vehicles/data/models/vehicles_response.dart';
import 'package:roadapp/features/vehicles/presentation/cubit/vehicles_cubit.dart';
import 'package:roadapp/features/vehicles/presentation/cubit/vehicles_state.dart';
import 'package:roadapp/features/vehicles/presentation/views/widgets/add_vehicle_button.dart';
import 'package:roadapp/features/vehicles/presentation/views/widgets/vehicle_details_dialog.dart';

class VehiclesScreen extends StatefulWidget {
  const VehiclesScreen({super.key});

  @override
  State<VehiclesScreen> createState() => _VehiclesScreenState();
}

class _VehiclesScreenState extends State<VehiclesScreen> {
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
      StringManager.licensePlateNumber
    ];
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: preferredSize,
            child: CustomAppBar(
                text: StringManager.identifiedVehicles.tr(context))),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(height: 10.h),
                      AddVehicleButton(vehiclesContext: context),
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
                                  showCustomAlertDialog(
                                      context: context,
                                      title:
                                      StringManager.vehicleDetails.tr(context),
                                      content: VehicleDetailsDialog(
                                          vehicle: state.vehicles![index]));
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
                                ? CustomLoadingIndicator(
                                height: height * .65)
                                : Column(
                                children: [
                                  CustomMultiRowsTable(
                                      columns: columns,
                                      rows: cubit.vehicles!
                                          .asMap()
                                          .entries
                                          .map((entry) {
                                        int index = entry.key;
                                        Vehicle vehicle = entry.value;
                                        return [
                                          (index + 1).toString(),
                                          vehicle.brandId?.name ?? '',
                                          vehicle.model ?? '',
                                          (vehicle.manufacturingYear ?? 0)
                                              .toString(),
                                          vehicle.plateNumber ?? ''
                                        ];
                                      }).toList(),
                                      icon: Icons.more_vert,
                                      onIconPressed: (int index) {
                                        showCustomAlertDialog(
                                            context: context,
                                            title: StringManager
                                                .vehicleDetails
                                                .tr(context),
                                            content: VehicleDetailsDialog(
                                                vehicle: cubit
                                                    .vehicles![index]));
                                      }),
                                  if(state is MoreLoadingState) CustomLoadingIndicator(height: 40.h)
                                ]
                            );
                          })
                    ]))));
  }
}