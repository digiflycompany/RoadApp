import 'package:flutter/material.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/features/business_models/presentation/views/widgets/examination_text_field.dart';

class ExaminationGrid extends StatelessWidget {
  const ExaminationGrid({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SizedBox(
        height: 170,
        child: GridView.count(
            childAspectRatio: width > 500 ? 5.5 : 2,
            crossAxisSpacing: 20,
            crossAxisCount: 2,
            children: [
              ExaminationTextField(
                  label: StringManager.licensePlateNumber.tr(context)),
              ExaminationTextField(
                  label: StringManager.examinationType.tr(context)),
              ExaminationTextField(
                  label: StringManager.examinationDate.tr(context)),
              ExaminationTextField(label: StringManager.price.tr(context))
            ]));
  }
}