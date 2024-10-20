import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/navigation/navigation.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/features/business_models/presentation/views/screens/examinations_business_models_screen.dart';

class Examination extends StatelessWidget {
  const Examination({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () =>
            AppNavigation.navigate(const ExaminationsBusinessModelsScreen()),
        child: Container(
            height: 55.h,
            width: double.infinity,
            decoration: BoxDecoration(
                color: AppColors.yellowColor,
                borderRadius: BorderRadius.circular(10.r)),
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(StringManager.examinations.tr(context),
                        style:
                            const TextStyle(fontWeight: FontWeight.w500))))));
  }
}