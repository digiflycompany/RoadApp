import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/features/maintenance_centers/presentation/views/widgets/maintenance_center_item.dart';
import 'package:roadapp/features/maintenance_centers/presentation/views/widgets/maintenance_filter.dart';

class MaintenanceCenters extends StatefulWidget {
  const MaintenanceCenters({super.key});

  @override
  State<MaintenanceCenters> createState() => _MaintenanceCentersState();
}

class _MaintenanceCentersState extends State<MaintenanceCenters> {
  bool leastPriceCheckbox = false;

  bool nearestCheckbox = false;

  bool mostRatedCheckbox = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width,
        height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: preferredSize,
            child: CustomAppBar(
                text: StringManager.coolingCycleMaintenance.tr(context))),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
                child: Column(children: [
              const MaintenanceFilter(),
                  GridView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent:
                          height >= 1000 ? (height >= 1200 ? 216.2 : 210) : 180,
                          mainAxisSpacing: 10.h,
                          crossAxisCount: width >= 500 ? 4 : 2),
                      itemBuilder: (context, index) {
                        return const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: MaintenanceCenterItem());
                      },
                      itemCount: 27)
            ]))));
  }
}
