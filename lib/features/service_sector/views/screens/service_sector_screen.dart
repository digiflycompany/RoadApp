import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/features/service_sector/views/widgets/sectors_grid.dart';
import 'package:roadapp/features/service_sector/views/widgets/select_sector_button.dart';

class ServiceSectorScreen extends StatelessWidget {
  const ServiceSectorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: preferredSize,
            child: CustomAppBar(
                text: StringManager.chooseServiceSector.tr(context))),
        body: Padding(
            padding: EdgeInsets.only(
                top: 50.h, bottom: 20.h, right: 15.w, left: 15.w),
            child: Column(children: [
              const Expanded(child: SectorsGrid()),
              SizedBox(height: 20.h),
              const SelectSectorButton()
            ])));
  }
}