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

class VehiclesScreen extends StatelessWidget {
  final rows = [
    ["1", "تويوتا", "كورولا", "2015", "أ ب هـ 2 3 4 6"],
    ["1", "تويوتا", "كورولا", "2015", "أ ب هـ 2 3 4 6"],
    ["1", "تويوتا", "كورولا", "2015", "أ ب هـ 2 3 4 6"],
    ["1", "تويوتا", "كورولا", "2015", "أ ب هـ 2 3 4 6"],
    ["1", "تويوتا", "كورولا", "2015", "أ ب هـ 2 3 4 6"]
  ];

  final TextEditingController company = TextEditingController();

  VehiclesScreen({super.key});

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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              SizedBox(height: 10.h),
              const AddVehicleButton(),
              const Gap(20),
              BlocBuilder<VehiclesCubit, VehiclesState>(
                  builder: (BuildContext context, VehiclesState state) {
                return (state is VehiclesSuccessState &&
                        state.vehicles != null &&
                        state.vehicles!.isNotEmpty)
                    ? CustomMultiRowsTable(
                        columns: columns,
                        rows: state.vehicles!.asMap().entries.map((entry) {
                          int index = entry.key;
                          Vehicle vehicle = entry.value;
                          return [
                            (index + 1).toString() ?? '',
                            vehicle.make ?? '',
                            vehicle.model ?? '',
                            '',
                            vehicle.plateNumber ?? ''
                          ];
                        }).toList(),
                        icon: Icons.more_vert,
                        onIconPressed: () {
                          showCustomAlertDialog(
                              context: context,
                              title: StringManager.vehicleDetails.tr(context),
                              content: const VehicleDetailsDialog());
                        })
                    : (state is VehiclesSuccessState &&
                            state.vehicles != null &&
                            state.vehicles!.isNotEmpty)
                        ? Center(
                            child: Text(StringManager.youDoNotHaveAnyVehiclesYet
                                .tr(context)))
                        : state is VehiclesErrorState
                            ? Center(
                                child: Text(state.error,
                                    style: Styles.textStyle16))
                            : CustomLoadingIndicator(height: height * .65);
              })
            ])));
  }
}
