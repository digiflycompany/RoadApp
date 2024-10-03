import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/core/navigation/navigation.dart';
import 'package:roadapp/features/business_models/presentation/views/screens/debentures_business_models_screen.dart';
import 'package:roadapp/features/business_models/presentation/views/screens/examinations_business_models_screen.dart';

class BusinessModelsScreen extends StatefulWidget {
  const BusinessModelsScreen({super.key});

  @override
  State<BusinessModelsScreen> createState() => _BusinessModelsScreenState();
}

class _BusinessModelsScreenState extends State<BusinessModelsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: preferredSize,
            child:
                CustomAppBar(text: StringManager.businessModels.tr(context))),
        body: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(children: [
                  GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => AppNavigation.navigate(
                          const DebenturesBusinessModelsScreen()),
                      child: Container(
                          height: 55.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: AppColors.yellowColor,
                              borderRadius: BorderRadius.circular(10.r)),
                          child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Align(
                                  alignment: AlignmentDirectional.centerStart,
                                  child: Text(StringManager.bonds.tr(context),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500)))))),
                  SizedBox(height: 30.h),
                  GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => AppNavigation.navigate(
                          const ExaminationsBusinessModelsScreen()),
                      child: Container(
                          height: 55.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: AppColors.yellowColor,
                              borderRadius: BorderRadius.circular(10.r)),
                          child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Align(
                                  alignment: AlignmentDirectional.centerStart,
                                  child: Text(
                                      StringManager.examinations.tr(context),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500))))))
                ]))));
  }
}