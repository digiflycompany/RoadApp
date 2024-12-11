import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/features/business_models/presentation/views/widgets/examination_grid.dart';
import 'package:roadapp/features/business_models/presentation/views/widgets/expansion_tile_example.dart';
import 'package:roadapp/features/business_models/presentation/views/widgets/notes_expansion_tile.dart';

class ExaminationData extends StatelessWidget {
  const ExaminationData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ExaminationGrid(),
        SizedBox(height: 30.h),
        ExpansionTileExample(
          title: StringManager.outerStructure.tr(context),
          point1: StringManager.carExteriorParts.tr(context),
          point1En: StringManager.carExteriorParts,
          point2: StringManager.interiorCondition.tr(context),
          point2En: StringManager.interiorCondition,
          point3: StringManager.frontAndRearGlass.tr(context),
          point3En: StringManager.frontAndRearGlass,
          point4: StringManager.roof.tr(context),
          point4En: StringManager.roof,
          point5: StringManager.windows.tr(context),
          point5En: StringManager.windows,
          point6: StringManager.inch.tr(context),
          point6En: StringManager.inch,
        ),
        SizedBox(height: 20.h),
        ExpansionTileExample(
          title: StringManager.chassisAndFrame.tr(context),
          point1: StringManager.fourChassis.tr(context),
          point1En: StringManager.fourChassis,
          point2: StringManager.frontFrame.tr(context),
          point2En: StringManager.frontFrame,
          point3: StringManager.roofStructure.tr(context),
          point3En: StringManager.roofStructure,
          point4: StringManager.rearFrame.tr(context),
          point4En: StringManager.rearFrame,
          point5: StringManager.frontFacade.tr(context),
          point5En: StringManager.frontFacade,
          point6: StringManager.rearFacade.tr(context),
          point6En: StringManager.rearFacade,
        ),
        SizedBox(height: 20.h),
        ExpansionTileExample(
          title: StringManager.engineAndTransmission.tr(context),
          point1: StringManager.electronicallyExamineAllSystems.tr(context),
          point1En: StringManager.electronicallyExamineAllSystems,
          point2: StringManager.examineMainBattery.tr(context),
          point2En: StringManager.examineMainBattery,
          point3: StringManager.electricalEngineAndItsParts.tr(context),
          point3En: StringManager.electricalEngineAndItsParts,
          point4: StringManager.electricalConverter.tr(context),
          point4En: StringManager.electricalConverter,
          point5: StringManager.rechargeSystems.tr(context),
          point5En: StringManager.rechargeSystems,
          point6: StringManager.coolingSystems.tr(context),
          point6En: StringManager.coolingSystems,
        ),
        SizedBox(height: 20.h),
        ExpansionTileExample(
          title: StringManager.steeringSystem.tr(context),
          point1: StringManager.frontPines.tr(context),
          point1En: StringManager.frontPines,
          point2: StringManager.rearPines.tr(context),
          point2En: StringManager.rearPines,
          point3: StringManager.steeringGroupAndItsParts.tr(context),
          point3En: StringManager.steeringGroupAndItsParts,
          point4: StringManager.frontAndRearAxes.tr(context),
          point4En: StringManager.frontAndRearAxes,
          point5: StringManager.wheelHub.tr(context),
          point5En: StringManager.wheelHub,
          point6: StringManager.engineAndTransmissionMounts.tr(context),
          point6En: StringManager.engineAndTransmissionMounts,
        ),
        SizedBox(height: 20.h),
        ExpansionTileExample(
          title: StringManager.electricalGroup.tr(context),
          point1: StringManager.frontLightingSystems.tr(context),
          point1En: StringManager.frontLightingSystems,
          point2: StringManager.rearLightingSystems.tr(context),
          point2En: StringManager.rearLightingSystems,
          point3: StringManager.roadsideAssistanceSystems.tr(context),
          point3En: StringManager.roadsideAssistanceSystems,
          point4: StringManager.batteryAndChargingSystem.tr(context),
          point4En: StringManager.batteryAndChargingSystem,
          point5: StringManager.accessoriesAndFittings.tr(context),
          point5En: StringManager.accessoriesAndFittings,
        ),
        SizedBox(height: 20.h),
        ExpansionTileExample(
          title: StringManager.airConditioningSystem.tr(context),
          point1: StringManager.airConditioningAndCompressorSystem.tr(context),
          point1En: StringManager.airConditioningAndCompressorSystem,
          point2: StringManager.heatingSystem.tr(context),
          point2En: StringManager.heatingSystem,
          point3: StringManager.engineAndFansCooling.tr(context),
          point3En: StringManager.engineAndFansCooling,
          point4: StringManager.fluidSmuggling.tr(context),
          point4En: StringManager.fluidSmuggling,
        ),
        SizedBox(height: 20.h),
        ExpansionTileExample(
          title: StringManager.brakesAndSafety.tr(context),
          point1: StringManager.airBags.tr(context),
          point1En: StringManager.airBags,
          point2: StringManager.tires.tr(context),
          point2En: StringManager.tires,
          point3: StringManager.brakesAndTheirParts.tr(context),
          point3En: StringManager.brakesAndTheirParts,
          point4: StringManager.seatBelts.tr(context),
          point4En: StringManager.seatBelts,
          point5: StringManager.antiSlipSystems.tr(context),
          point5En: StringManager.antiSlipSystems,
        ),
        SizedBox(height: 20.h),
        const NotesExpansionTile()
      ],
    );
  }
}
