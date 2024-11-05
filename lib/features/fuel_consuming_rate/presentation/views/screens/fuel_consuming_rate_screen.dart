import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/features/fuel_consuming_rate/presentation/views/widgets/add_button.dart';
import 'package:roadapp/features/fuel_consuming_rate/presentation/views/widgets/fuel_consumin_item.dart';
import 'package:roadapp/features/fuel_consuming_rate/presentation/views/widgets/fuel_diagram.dart';
import 'package:roadapp/features/maintenance%20_report/cubit/cubit.dart';
import 'package:roadapp/features/maintenance%20_report/cubit/states.dart';
import 'package:roadapp/features/maintenance%20_report/data/repo/report_repo.dart';

import '../../../../../core/dependency_injection/di.dart';

class FuelConsumingRateScreen extends StatefulWidget {
  const FuelConsumingRateScreen({super.key});

  @override
  State<FuelConsumingRateScreen> createState() =>
      _FuelConsumingRateScreenState();
}

class _FuelConsumingRateScreenState extends State<FuelConsumingRateScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => MaintenanceReportCubit(getIt.get<ReportRepo>()),
        child: BlocConsumer<MaintenanceReportCubit, MaintenanceReportStates>(
            listener: (BuildContext context, MaintenanceReportStates state) {},
            builder: (BuildContext context, MaintenanceReportStates state) {
              return Scaffold(
                  appBar: PreferredSize(
                      preferredSize: preferredSize,
                      child: CustomAppBar(
                          text: StringManager.calcFuelAverage.tr(context))),
                  body: SingleChildScrollView(
                      child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(children: [
                            const AddButton(),
                            SizedBox(height: 20.h),
                            ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (item, index) {
                                  return const FuelConsumingItem();
                                },
                                separatorBuilder: (item, index) {
                                  return SizedBox(height: 20.h);
                                },
                                itemCount: 3),
                            SizedBox(height: 20.h),
                            const FuelDiagram(),
                            SizedBox(height: 25.h)
                          ]))));
            }));
  }
}