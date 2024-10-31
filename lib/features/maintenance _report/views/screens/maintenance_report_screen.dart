import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/core/widgets/share_button.dart';
import 'package:roadapp/features/maintenance%20_report/cubit/cubit.dart';
import 'package:roadapp/features/maintenance%20_report/cubit/states.dart';
import 'package:roadapp/features/maintenance%20_report/views/widgets/add_report_icon.dart';
import 'package:roadapp/features/maintenance%20_report/views/widgets/maintenance_report_item.dart';
import 'package:roadapp/features/vehicles/presentation/views/widgets/filter_button.dart';
import 'package:roadapp/features/vehicles/presentation/views/widgets/vehicle_data.dart';

class MaintenanceReportScreen extends StatelessWidget {
  const MaintenanceReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MaintenanceReportCubit>(
        create: (BuildContext context) => MaintenanceReportCubit(),
        child: BlocConsumer<MaintenanceReportCubit, MaintenanceReportStates>(
            listener: (BuildContext context, MaintenanceReportStates state) {},
            builder: (BuildContext context, MaintenanceReportStates state) {
              return Scaffold(
                  appBar: PreferredSize(
                      preferredSize: preferredSize,
                      child: CustomAppBar(
                          text: StringManager.maintenanceReports.tr(context))),
                  body: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.0.w, vertical: 20.h),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  VehicleData(),
                                  AddReportIcon(),
                                  ShareButton(),
                                  FilterButton()
                                ]),
                            SizedBox(height: 25.h),
                            Expanded(
                                child: ListView.separated(
                                  physics: const BouncingScrollPhysics(),
                                    itemBuilder: (_, index) =>
                                        const MaintenanceReportItem(),
                                    separatorBuilder: (_, index) =>
                                        const Gap(25),
                                    itemCount: 25))
                          ])));
            }));
  }
}