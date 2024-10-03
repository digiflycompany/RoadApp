import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/features/business_models/presentation/views/widgets/examination_grid.dart';
import 'package:roadapp/features/business_models/presentation/views/widgets/expansion_tile_example.dart';
import 'package:roadapp/features/business_models/presentation/views/widgets/notes_expansion_tile.dart';

class ExaminationData extends StatelessWidget {
  const ExaminationData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const ExaminationGrid(),
      SizedBox(height: 30.h),
      ExpansionTileExample(
          title: StringManager.outerStructure.tr(context),
          point1: StringManager.carExteriorParts.tr(context),
          point2: StringManager.interiorCondition.tr(context),
          point3: StringManager.frontAndRearGlass.tr(context),
          point4: StringManager.roof.tr(context),
          point5: StringManager.windows.tr(context),
          point6: StringManager.inch.tr(context)),
      SizedBox(height: 20.h),
      ExpansionTileExample(
          title: StringManager.chassisAndFrame.tr(context),
          point1: StringManager.fourChassis.tr(context),
          point2: StringManager.frontFrame.tr(context),
          point3: StringManager.roofStructure.tr(context),
          point4: StringManager.rearFrame.tr(context),
          point5: StringManager.frontFacade.tr(context),
          point6: StringManager.rearFacade.tr(context)),
      SizedBox(height: 20.h),
      ExpansionTileExample(
          title: StringManager.engineAndTransmission.tr(context),
          point1: StringManager.electronicallyExamineAllSystems.tr(context),
          point2: StringManager.examineMainBattery.tr(context),
          point3: StringManager.electricalEngineAndItsParts.tr(context),
          point4: StringManager.electricalConverter.tr(context),
          point5: StringManager.rechargeSystems.tr(context),
          point6: StringManager.coolingSystems.tr(context)),
      SizedBox(height: 20.h),
      ExpansionTileExample(
          title: StringManager.steeringSystem.tr(context),
          point1: StringManager.frontPines.tr(context),
          point2: StringManager.rearPines.tr(context),
          point3: StringManager.steeringGroupAndItsParts.tr(context),
          point4: StringManager.frontAndRearAxes.tr(context),
          point5: StringManager.wheelHub.tr(context),
          point6: StringManager.engineAndTransmissionMounts.tr(context)),
      SizedBox(height: 20.h),
      ExpansionTileExample(
          title: StringManager.electricalGroup.tr(context),
          point1: StringManager.frontLightingSystems.tr(context),
          point2: StringManager.rearLightingSystems.tr(context),
          point3: 'أنظمة المساعدة على الطريق',
          point4: 'البطارية و نظام الشحن',
          point5: 'الاكسسوارات و التجهزيات',
          point6: 'الاكسسوارات و التجهزيات'),
      SizedBox(height: 20.h),
      const ExpansionTileExample(
          title: 'نظام التكييف',
          point1: 'نظام التكييف و الكمبرسر',
          point2: 'نظام التدفئة',
          point3: 'تبريد المحرك و المراوح',
          point4: 'تهريب السوائل',
          point5: 'تهريب السوائل',
          point6: 'تهريب السوائل'),
      SizedBox(height: 20.h),
      const ExpansionTileExample(
          title: 'المكابح والسلامة',
          point1: 'الاكياس الهوائية',
          point2: 'الإطارات',
          point3: 'البريكات و اجزائها',
          point4: 'احزمة الأمان',
          point5: 'أنظمة منع الإنزلاق',
          point6: 'أنظمة منع الإنزلاق'),
      SizedBox(height: 20.h),
      const NotesExpansionTile()
    ]);
  }
}