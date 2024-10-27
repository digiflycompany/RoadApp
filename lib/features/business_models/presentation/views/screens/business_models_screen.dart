import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/features/business_models/presentation/views/widgets/debentures.dart';
import 'package:roadapp/features/business_models/presentation/views/widgets/examination.dart';

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
                  const Debentures(),
                  SizedBox(height: 30.h),
                  const Examination()
                ]))));
  }
}