import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/core/widgets/search_row.dart';
import 'package:roadapp/features/maintenance_service/views/widgets/maintenance_service_item.dart';

class MaintenanceServiceScreen extends StatelessWidget {
  const MaintenanceServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: preferredSize,
            child: CustomAppBar(
                text: StringManager.maintenanceService.tr(context))),
        body: Padding(
            padding: EdgeInsets.all(20.r),
            child: SingleChildScrollView(
                child: Column(children: [
              const SearchRow(),
              SizedBox(height: 30.h),
              GridView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 150.h,
                      crossAxisCount: 3,
                      mainAxisSpacing: 20.h),
                  itemBuilder: (context, index) {
                    return const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: MaintenanceServiceItem());
                  },
                  itemCount: 9)
            ]))));
  }
}