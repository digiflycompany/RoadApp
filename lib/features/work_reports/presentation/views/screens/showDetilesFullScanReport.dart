import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';

import '../../../../../core/Theming/styles.dart';
import '../../../../../core/helpers/string_manager.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../data/models/full_scan_report_response.dart';
import '../../cubit/work_reports_cubit.dart';


class ShowDetilesFullScanReport extends StatelessWidget {
  const ShowDetilesFullScanReport({super.key, required this.reportContent});

  final ReportContent reportContent;

  Color getColor(int value) {
    switch (value) {
      case 1:
        return Colors.red;
      case 2:
        return Colors.yellow;
      case 3:
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  Widget buildItem(String label, int value) {
    return Row(
      children: [
        CircleAvatar(radius: 8, backgroundColor: getColor(value)),
        const SizedBox(width: 8),
        Text(label, style: const TextStyle(fontSize: 16)),
      ],
    );
  }

  Widget buildSection(String title, Map<String, int> items) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ExpansionTile(
        collapsedBackgroundColor: AppColors.primaryColor,
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        children: items.entries
            .map((e) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
          child: buildItem(e.key, e.value),
        ))
            .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: preferredSize,
          child:
          CustomAppBar(text: StringManager.servicesReport.tr(context))),
      body: BlocBuilder<WorkReportsCubit, WorkReportsState>(
  builder: (context, state) {
    final cubit = WorkReportsCubit.get(context);
    return SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(
              height: 20.h,
            ),
          Row(
          mainAxisAlignment:
          MainAxisAlignment.center,
          children: [
            // TextButton(
            //   onPressed: () => cubit
            //       .shareFullScanAsPdf(),
            //   child: Container(
            //     width: 50,
            //     decoration: BoxDecoration(
            //       color: AppColors.red,
            //       borderRadius:
            //       BorderRadius.circular(12),
            //     ),
            //     child: Padding(
            //       padding:
            //       const EdgeInsets.all(8.0),
            //       child: Text(
            //         textAlign: TextAlign.center,
            //         'PDF',
            //         style: Styles.textStyle14
            //             .copyWith(
            //           color:
            //           AppColors.black,
            //
            //         ),
            //       ),
            //     ),
            //   ),
            // ),

            Text(
              "${StringManager.share.tr(context)} : ",
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
            TextButton(
              onPressed: () => cubit
                  .shareFullScanAsExcel(),
              child: Container(
                width: 50,
                decoration: BoxDecoration(
                  color: AppColors.green,
                  borderRadius:
                  BorderRadius.circular(12),
                ),
                child: Padding(
                  padding:
                  const EdgeInsets.all(8.0),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Excel',
                    style: Styles.textStyle14
                        .copyWith(
                        color:
                        AppColors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
            SizedBox(
              height: 20.h,
            ),
            buildSection(
                StringManager.outerStructure.tr(context), {
              StringManager.carExteriorParts.tr(context): reportContent.outerStructure.carExteriorParts,
              StringManager.interiorCondition.tr(context): reportContent.outerStructure.interiorCondition,
              StringManager.frontAndRearGlass.tr(context): reportContent.outerStructure.frontAndRearGlass,
              StringManager.roof.tr(context): reportContent.outerStructure.roof,
              StringManager.windows.tr(context): reportContent.outerStructure.windows,
              StringManager.inch.tr(context): reportContent.outerStructure.inch,
            }),
            buildSection(StringManager.chassisAndFrame.tr(context), {
              StringManager.fourChassis.tr(context): reportContent.chassisAndFrame.fourChassis,
              StringManager.frontFrame.tr(context): reportContent.chassisAndFrame.frontFrame,
              StringManager.roofStructure.tr(context): reportContent.chassisAndFrame.roofStructure,
              StringManager.rearFrame.tr(context): reportContent.chassisAndFrame.rearFrame,
              StringManager.frontFacade.tr(context): reportContent.chassisAndFrame.frontFacade,
              StringManager.rearFacade.tr(context): reportContent.chassisAndFrame.rearFacade,
            }),
            buildSection(StringManager.engineAndTransmission.tr(context), {
              StringManager.electronicallyExamineAllSystems.tr(context): reportContent.engineAndTransmission.electronicallyExamineAllSystems,
              StringManager.examineMainBattery.tr(context): reportContent.engineAndTransmission.examineMainBattery,
              StringManager.electricalEngineAndItsParts.tr(context): reportContent.engineAndTransmission.electricalEngineAndItsParts,
              StringManager.electricalConverter.tr(context): reportContent.engineAndTransmission.electricalConverter,
              StringManager.rechargeSystems.tr(context): reportContent.engineAndTransmission.rechargeSystems,
              StringManager.coolingSystems.tr(context): reportContent.engineAndTransmission.coolingSystems,
            }),
            buildSection(StringManager.steeringSystem.tr(context), {
              StringManager.frontPines.tr(context): reportContent.steeringSystem.frontPines,
              StringManager.rearPines.tr(context): reportContent.steeringSystem.rearPines,
              StringManager.steeringGroupAndItsParts.tr(context): reportContent.steeringSystem.steeringGroupAndItsParts,
              StringManager.frontAndRearAxes.tr(context): reportContent.steeringSystem.frontAndRearAxes,
              StringManager.wheelHub.tr(context): reportContent.steeringSystem.wheelHub,
              StringManager.engineAndTransmissionMounts.tr(context): reportContent.steeringSystem.engineAndTransmissionMounts,
            }),
            buildSection(StringManager.electricalGroup.tr(context), {
              StringManager.frontLightingSystems.tr(context): reportContent.electricalGroup.frontLightingSystems,
              StringManager.rearLightingSystems.tr(context): reportContent.electricalGroup.rearLightingSystems,
              StringManager.roadsideAssistanceSystems.tr(context): reportContent.electricalGroup.roadsideAssistanceSystems,
              StringManager.batteryAndChargingSystem.tr(context): reportContent.electricalGroup.batteryAndChargingSystem,
              StringManager.accessoriesAndFittings.tr(context): reportContent.electricalGroup.accessoriesAndFittings,
            }),
            buildSection(StringManager.airConditioningSystem.tr(context), {
              StringManager.airConditioningAndCompressorSystem.tr(context): reportContent.airConditioningSystem.airConditioningAndCompressorSystem,
              StringManager.heatingSystem.tr(context): reportContent.airConditioningSystem.heatingSystem,
              StringManager.engineAndFansCooling.tr(context): reportContent.airConditioningSystem.engineAndFansCooling,
              StringManager.fluidSmuggling.tr(context): reportContent.airConditioningSystem.fluidSmuggling,
            }),
            buildSection(StringManager.brakesAndSafety.tr(context), {
              StringManager.airBags.tr(context): reportContent.brakesAndSafety.airBags,
              StringManager.tires.tr(context): reportContent.brakesAndSafety.tires,
              StringManager.brakesAndTheirParts.tr(context): reportContent.brakesAndSafety.brakesAndTheirParts,
              StringManager.seatBelts.tr(context): reportContent.brakesAndSafety.seatBelts,
              StringManager.antiSlipSystems.tr(context): reportContent.brakesAndSafety.antiSlipSystems,
            }),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "${StringManager.notes.tr(context)}: \n ${reportContent.notesSection.notes}",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      );
  },
),
    );
  }
}
