import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_alert_dialog.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/core/widgets/custom_data_table.dart';
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
              BlocListener<VehiclesCubit, VehiclesState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                child: CustomMultiRowsTable(columns: columns,
                    rows: rows,
                    icon: Icons.more_vert,
                    onIconPressed: () {
                      showCustomAlertDialog(
                          context: context,
                          title: StringManager.vehicleDetails.tr(context),
                          content: const VehicleDetailsDialog());
                    }),
              )
            ])));
  }
}