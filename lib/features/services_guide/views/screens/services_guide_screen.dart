import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/features/services_guide/views/widgets/search_row.dart';
import 'package:roadapp/features/services_guide/views/widgets/services_grid.dart';

class ServicesGuideScreen extends StatelessWidget {
  const ServicesGuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: preferredSize,
            child: CustomAppBar(text: StringManager.servicesGuide.tr(context))),
        body: Padding(
            padding: EdgeInsets.all(20.r),
            child: Column(children: [
              const SearchRow(),
              SizedBox(height: 30.h),
              const ServicesGrid()
            ])));
  }
}