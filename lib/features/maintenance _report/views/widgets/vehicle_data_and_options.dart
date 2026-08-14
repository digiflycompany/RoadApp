import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_alert_dialog.dart';
import 'package:roadapp/features/maintenance%20_report/cubit/cubit.dart';
import 'package:roadapp/features/maintenance%20_report/cubit/states.dart';
import 'package:roadapp/features/maintenance%20_report/views/widgets/add_report_icon.dart';
import 'package:roadapp/features/vehicles/presentation/views/widgets/vehicle_data.dart';
import '../widgets/share_pdf_and_excel_widget.dart';

class VehicleDataAndOptions extends StatelessWidget {
  const VehicleDataAndOptions(
      {super.key,
      required this.index,
      required this.nameCompany,
      required this.nameCar,
      required this.model,
      required this.plateNumber,
      required this.parameterValue});

  final String index, nameCompany, nameCar, model, plateNumber, parameterValue;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaintenanceReportCubit, MaintenanceReportStates>(
        builder: (_, state) {
      var cubit = MaintenanceReportCubit.get(context);
      var reports = cubit.reportsResponses?.data?.reports ?? [];
      return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        VehicleData(
          index: index,
          nameCompany: nameCompany,
          nameCar: nameCar,
          model: model,
          plateNumber: plateNumber
        ),
        AddReportIcon(state: state, vehicleId: parameterValue, cubit: cubit),
        IconButton(
            icon: const Icon(Icons.share_outlined),
            onPressed: () {
              showCustomAlertDialog(
                  context: context,
                  title: StringManager.share.tr(context),
                  content:
                      SharePdfAndExcelWidget(cubit: cubit, reports: reports));
            })
      ]);
    });
  }
}
